const express = require('express');
const router = express.Router();
const https = require('https');
const ihrissmartrequire = require('ihrissmartrequire')
ihrissmartrequire.ignore("*node_modules")
const fhirAxios = ihrissmartrequire('modules/fhir/fhirAxios')
const outcomes = ihrissmartrequire('config/operationOutcomes')

const url = 'https://mfl.mhss.gov.na/api/facilities.json';
//const fhirServerUrl = 'https://your-fhir-server-url/fhir';
const facilityTypes = [
    {"hospital": "Hospital"},
    {"HC": "Health Centre"},
    {"RHO": "Regional Health Office"},
    {"DHO": "District Health Office"},
    {"IH": "Intermediate Hospital"},
    {"CLC": "Clinic"},
    {"PHARM": "Pharmacy"},
    {"LAB": "Laboratory"},
    {"RH": "Referral Hospital"},
    {"DH": "District Hospital"},
    {"RC": "Rehab Centre"},
    {"CBART": "CBART"},
    {"MV": "Mobile Van"},
    {"MIMS": "MIMS"}
  ];

/**
 * Main router to synchronize locations.
 * Fetches location data, organizes it, converts it to FHIR Location resources,
 * and posts them as FHIR bundles to a FHIR server.
 */
router.get('/synclocations', async (req, res) => {
  try {
    const jsonData = await fetchData(url);
    const organizedLocations = organizeLocations(jsonData.locations);
    await postFhirBundles(organizedLocations);
    res.status(200).send('FHIR bundles posted successfully');
  } catch (error) {
    console.error('Error:', error);
    res.status(500).send('Error posting FHIR bundles');
  }
});

/**
 * Fetches data from the given URL.
 * @param {string} url - The URL to fetch data from.
 * @returns {Promise<Object>} - A promise that resolves to the fetched JSON data.
 */
function fetchData(url) {
  return new Promise((resolve, reject) => {
    https.get(url, (res) => {
      let data = '';

      res.on('data', (chunk) => {
        data += chunk;
      });

      res.on('end', () => {
        try {
          const jsonData = JSON.parse(data);
          resolve(jsonData);
        } catch (e) {
          reject('Error parsing JSON:', e);
        }
      });

    }).on('error', (err) => {
      reject('Error with the request:', err);
    });
  });
}

/**
 * Organizes locations into regions, districts, and facilities.
 * @param {Array} locations - The array of location objects.
 * @returns {Object} - An object containing arrays of regions, districts, and facilities.
 */
function organizeLocations(locations) {
  const result = {
    regions: [],
    districts: [],
    facilities: []
  };

  locations.forEach(location => {
    const fhirLocation = convertToFhirLocation(location);

    switch (location.location_type.name) {
      case 'Region':
        result.regions.push(fhirLocation);
        break;
      case 'District':
        result.districts.push(fhirLocation);
        break;
      case 'Facility':
        result.facilities.push(fhirLocation);
        break;
      default:
        break;
    }

    if (location.children && location.children.length > 0) {
      const childResult = organizeLocations(location.children);
      result.regions.push(...childResult.regions);
      result.districts.push(...childResult.districts);
      result.facilities.push(...childResult.facilities);
    }
  });

  return result;
}

/**
 * Converts a location object to a FHIR Location resource.
 * @param {Object} location - The location object.
 * @returns {Object} - The FHIR Location resource.
 */
function convertToFhirLocation(location) {
    let profiles = [
      "http://ihe.net/fhir/StructureDefinition/IHE.mCSD.Location"
    ];
  
    let physicalType = {
      coding: [
        {
          system: "http://hl7.org/fhir/codesystem-location-physical-type.html",
          code: location.location_type.name === 'Facility' ? 'bu' : 'jdn'
        }
      ],
      text: location.location_type.name === 'Facility' ? 'Building' : 'Jurisdiction'
    };
  
    if (location.location_type.name === 'Region' || location.location_type.name === 'District') {
      profiles.push("http://ihris.org/fhir/StructureDefinition/ihris-jurisdiction");
    } else if (location.location_type.name === 'Facility') {
        profiles.push("http://ihe.net/fhir/StructureDefinition/IHE_mCSD_FacilityLocation");    
      profiles.push("http://ihris.org/fhir/StructureDefinition/ihris-facility");
    }
  
    let idPrefix = '';
    let parentIdPrefix = '';
  
    switch (location.location_type.name) {
      case 'Region':
        idPrefix = 'R';
        break;
      case 'District':
        idPrefix = 'D';
        parentIdPrefix = 'R';
        break;
      case 'Facility':
        idPrefix = 'F';
        parentIdPrefix = 'D';
        break;
      default:
        break;
    }
  
    let typeCoding = {
      system: "http://ihris.org/fhir/CodeSystem/ihris-jurisdiction-type",
      code: location.location_type.name.toLowerCase()
    };
    let typeText = location.location_type.name;
  
    if (location.location_type.name === 'Facility') {
      for (const facilityType of facilityTypes) {
        const [key, value] = Object.entries(facilityType)[0];
        if (location.name.includes(value)) {
          typeCoding.code = key;
          typeText = value;
          break;
        }
      }
    }
  
    return {
      resourceType: "Location",
      id: idPrefix + location.id.toString(),
      status: "active",
      meta: {
        profile: profiles
      },
      name: location.name,
      address: {
        text: location.address
      },
      position: {
        longitude: location.point_x,
        latitude: location.point_y
      },
      managingOrganization: {
        display: location.location_ownership ? location.location_ownership.name : null
      },
      type: [
        {
          coding: [typeCoding],
          text: typeText
        }
      ],
      physicalType: physicalType,
      partOf: location.location_type.name === 'Region' ? {
        reference: 'Location/NA'
      } : location.parent_id ? {
        reference: `Location/${parentIdPrefix}${location.parent_id}`
      } : null
    };
  }

/**
 * Creates a FHIR bundle of type transaction.
 * @param {Array} resources - The array of FHIR Location resources.
 * @returns {Object} - The FHIR bundle.
 */
function createFhirBundle(resources) {
  return {
    resourceType: "Bundle",
    type: "transaction",
    entry: resources.map(resource => ({
      request: {
        method: "PUT",
        url: `Location/${resource.id}`
      },
      resource: resource
    }))
  };
}

/**
 * Posts FHIR bundles to the FHIR server.
 * Ensures that regions are posted before districts and districts before facilities.
 * @param {Object} organizedLocations - The object containing arrays of regions, districts, and facilities.
 */
async function postFhirBundles(organizedLocations) {
  try {
    const regionBundle = createFhirBundle(organizedLocations.regions);
    const districtBundle = createFhirBundle(organizedLocations.districts);
    const facilityBundle = createFhirBundle(organizedLocations.facilities);

    try {
      await fhirAxios.create(regionBundle).then(function (response) {
        console.log('Region FHIR bundle posted successfully');
      }).catch (function (err) {
        console.log(JSON.stringify(err.response.data,null,2));
      })
    } catch (error) {
      console.error('Error posting region FHIR bundle');
    }

    try {
      await fhirAxios.create(districtBundle).then(function (response) {
        console.log('District FHIR bundle posted successfully');
      }).catch (function (err) {
        console.log(JSON.stringify(err.response.data,null,2));
      })
    } catch (error) {
      console.error('Error posting District FHIR bundle');
    }

    try {
      await fhirAxios.create(facilityBundle).then(function (response) {
        console.log('Facility FHIR bundle posted successfully');
      }).catch (function (err) {
        console.log(JSON.stringify(err.response.data,null,2));
      })
    } catch (error) {
      console.error('Error posting facility FHIR bundle:');
    }

  } catch (error) {
    console.error('Error posting FHIR bundles');
  }
}

module.exports = router;