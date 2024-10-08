const csv = require('csv-parser')
const fs = require('fs')
const nconf = require('nconf')

nconf.argv()

const input = nconf.get('input')
const prefix = 'http://ihris.org/fhir/'


let bundle = {
  resourceType: "Bundle",
  type: "transaction",
  entry: []
}

const locTemplate = {
  resource: {
    resourceType: "Location",
    meta: {
      profile: [
        "http://ihe.net/fhir/StructureDefinition/IHE_mCSD_Location",
        "http://ihe.net/fhir/StructureDefinition/IHE_mCSD_FacilityLocation",
        "http://ihris.org/fhir/StructureDefinition/ihris-facility"
      ]
    },
    id: "",
    name: "",
    status: "active",
    partOf: { reference: "Location/" },
    position: { latitude: "", longitude: "",},
    managingOrganization: "Organization/",
    type: [
      {
        coding: [
          {
            system: "http://ihris.org/fhir/CodeSystem/ihris-facility-type",
            code: ""
          }
        ],
        text: ""
      }
    ],
    physicalType: {
      coding: [
        {
          system: "http://hl7.org/fhir/codesystem-location-physical-type.html",
          code: "bu"
        }
      ],
      text: "Building"
    }
  },
  request: {
    method: "PUT",
    url: "Location/"
  }
}
const orgTemplate = {
  resource: {
    resourceType: "Organization",
    meta: {
      profile: [
        "http://ihe.net/fhir/StructureDefinition/IHE_mCSD_Organization",
        "http://ihe.net/fhir/StructureDefinition/IHE_mCSD_FacilityOrganization"
      ]
    },
    id: "",
    name: "",
    active: true,
    type: [
      {
        coding: [
          {
            system: "urn:ietf:rfc:3986",
            code: "urn:ihe:iti:mcsd:2019:facility"
          }
        ],
        text: "Facility"
      },
      {
        coding: [
          {
            system: "",
            code: ""
          }
        ],
        text: ""
      }
    ]
  },
  request: {
    method: "PUT",
    url: "Organization/"
  }
}

fs.createReadStream( input ).pipe( csv() )
  .on( 'data', ( data ) => {

    let entry = JSON.parse( JSON.stringify( locTemplate ) )
    //console.log(JSON.parse(JSON.stringify(data)))
    entry.resource.id = data.code
    entry.resource.name = data.name
    entry.resource.partOf.reference += data.constituency
    entry.resource.position.latitude = data.latitude
    entry.resource.position.longitude = data.longitude
    entry.resource.type[0].coding[0].code = data.type
    entry.resource.type[0].text = data.FacilityType
    entry.request.url += data.code
    bundle.entry.push( entry )
  } )
  .on ( 'end', () => {
    console.log(JSON.stringify(bundle, null, 2 ))
  } )

/*
var waiting = 3
var started = false
var lists = [ "region", "zone" ]
var lookup = { }

for( let list of lists ) {
  fs.createReadStream( input + list + ".csv" ).pipe( csv() )
    .on( 'data', ( data ) => {
      if ( list === "zone" ) {
        if ( lookup[ data.region ] ) {
          lookup[ data.id ] = lookup[ data.region ] + "." + data.code
        }
      } else {
        lookup[ data.id ] = data.code
      }
    } ).on( 'end', () => {
      waiting--
    } )
}

var maps = [ "facility_type" ]

for( let map of maps ) {
  fs.createReadStream( "maps/"+map+".csv" ).pipe( csv() )
    .on( 'data', ( data ) => {
      lookup[data.id] = data
    } ).on( 'end', () => {
      waiting--
    } )
}


processJobs()

function processJobs() {
  if ( !started && !waiting ) {
    started = true
    fs.createReadStream( input + "facility.csv" ).pipe( csv() )
      .on( 'data', ( data ) => {
        if ( lookup[data.location] ) {
          let code = lookup[data.location]+"."+data.id.substring(9)

          let org = JSON.parse( JSON.stringify( orgTemplate ) )
          org.resource.id = code
          org.resource.name = data.name
          org.resource.type[1].text = lookup[ data.facility_type ].code
          org.resource.type[1].coding[0].system = lookup[ data.facility_type ].system
          org.resource.type[1].coding[0].code = lookup[ data.facility_type ].code

          org.request.url += code
          bundle.entry.push( org )

          let entry = JSON.parse( JSON.stringify( locTemplate ) )
          entry.resource.id = code
          entry.resource.name = data.name
          entry.resource.partOf.reference += lookup[data.location]
          entry.resource.managingOrganization += code
          entry.resource.type[1].text = lookup[ data.facility_type ].code
          entry.resource.type[1].coding[0].system = lookup[ data.facility_type ].system
          entry.resource.type[1].coding[0].code = lookup[ data.facility_type ].code

          entry.request.url += code
          bundle.entry.push( entry )


        } else {
          console.error("Skipping data outside Timor-Leste: "+data.location)
        }

      } )
      .on ( 'end', () => {
        console.log(JSON.stringify(bundle, null, 2 ))
      } )
  } else {
    console.error("Waiting...")
    setTimeout( () => processJobs(), 1000 )
  }
}*/
