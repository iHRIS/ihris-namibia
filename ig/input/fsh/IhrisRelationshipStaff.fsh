Instance:       ihris-es-report-staff
InstanceOf:     IhrisRelationship
Title:          "Staff Relationship"
Usage:          #example

* code.text = "iHRISRelationship"
* code.coding = #iHRISRelationship
* subject.reference = "StructureDefinition/ihris-practitioner"
* extension[reportdetails].extension[name].valueString = "practitioner"
* extension[reportdetails].extension[label].valueString = "CHW List"
* extension[reportdetails].extension[resource].valueString = "Practitioner"
* extension[reportdetails].extension[resourcePage].valueString = "practitioner"

* extension[reportdetails].extension[resourcePageID].valueString = "id"
* extension[reportdetails].extension[parameters][0].extension[esFieldName].valueString = "ES_DATA_ID"
* extension[reportdetails].extension[parameters][0].extension[parameter].valueString = "idParma"
* extension[reportdetails].extension[parameters][1].extension[esFieldName].valueString = "ES_DATA_NAME"
* extension[reportdetails].extension[parameters][1].extension[parameter].valueString = "nameParam"

* extension[reportdetails].extension[query].valueString = "active=true"
* extension[reportdetails].extension[displayCheckbox].valueBoolean = true
* extension[reportdetails].extension[locationBasedConstraint].valueBoolean = true

* extension[reportdetails].extension[reportelement][0].extension[name].valueString = "Id"
* extension[reportdetails].extension[reportelement][0].extension[fhirpath].valueString = "identifier.where(type.coding.where(code='nationalIN')).value"
* extension[reportdetails].extension[reportelement][0].extension[display].valueString = "Identifier(NID)"
* extension[reportdetails].extension[reportelement][0].extension[filter].valueBoolean = true
* extension[reportdetails].extension[reportelement][0].extension[dropDownFilter].valueBoolean = false
* extension[reportdetails].extension[reportelement][0].extension[order].valueInteger = 0

* extension[reportdetails].extension[reportelement][1].extension[name].valueString = "given"
* extension[reportdetails].extension[reportelement][1].extension[fhirpath].valueString = "name.given"
* extension[reportdetails].extension[reportelement][1].extension[display].valueString = "Given name"
* extension[reportdetails].extension[reportelement][1].extension[filter].valueBoolean = true
* extension[reportdetails].extension[reportelement][1].extension[dropDownFilter].valueBoolean = false
* extension[reportdetails].extension[reportelement][1].extension[order].valueInteger = 1

* extension[reportdetails].extension[reportelement][2].extension[name].valueString = "family"
* extension[reportdetails].extension[reportelement][2].extension[fhirpath].valueString = "name.family"
* extension[reportdetails].extension[reportelement][2].extension[display].valueString = "Family name"
* extension[reportdetails].extension[reportelement][2].extension[filter].valueBoolean = true
* extension[reportdetails].extension[reportelement][2].extension[dropDownFilter].valueBoolean = false
* extension[reportdetails].extension[reportelement][2].extension[order].valueInteger = 2

* extension[reportdetails].extension[reportelement][3].extension[name].valueString = "other"
* extension[reportdetails].extension[reportelement][3].extension[fhirpath].valueString = "name.extension.where(url='http://ihris.org/fhir/StructureDefinition/ihris-practitioner-othername').valueString"
* extension[reportdetails].extension[reportelement][3].extension[display].valueString = "Other name"
* extension[reportdetails].extension[reportelement][3].extension[filter].valueBoolean = true
* extension[reportdetails].extension[reportelement][3].extension[dropDownFilter].valueBoolean = false
* extension[reportdetails].extension[reportelement][3].extension[order].valueInteger = 3

* extension[reportdetails].extension[reportelement][4].extension[name].valueString = "gender"
* extension[reportdetails].extension[reportelement][4].extension[fhirpath].valueString = "gender"
* extension[reportdetails].extension[reportelement][4].extension[display].valueString = "Gender"
* extension[reportdetails].extension[reportelement][4].extension[filter].valueBoolean = true
* extension[reportdetails].extension[reportelement][4].extension[dropDownFilter].valueBoolean = true
* extension[reportdetails].extension[reportelement][4].extension[order].valueInteger = 4

* extension[reportdetails].extension[reportelement][5].extension[name].valueString = "birthDate"
* extension[reportdetails].extension[reportelement][5].extension[fhirpath].valueString = "birthDate"
* extension[reportdetails].extension[reportelement][5].extension[display].valueString = "BirthDate"
* extension[reportdetails].extension[reportelement][5].extension[filter].valueBoolean = true
* extension[reportdetails].extension[reportelement][5].extension[dropDownFilter].valueBoolean = false
* extension[reportdetails].extension[reportelement][5].extension[order].valueInteger = 5

* extension[reportdetails].extension[reportelement][6].extension[name].valueString = "nationality"
* extension[reportdetails].extension[reportelement][6].extension[fhirpath].valueString = "Practitioner.extension.where(url='http://ihris.org/fhir/StructureDefinition/ihris-practitioner-nationality').valueCoding.display"
* extension[reportdetails].extension[reportelement][6].extension[display].valueString = "Citizenship"
* extension[reportdetails].extension[reportelement][6].extension[filter].valueBoolean = true
* extension[reportdetails].extension[reportelement][6].extension[dropDownFilter].valueBoolean = true
* extension[reportdetails].extension[reportelement][6].extension[order].valueInteger = 6

* extension[reportdetails].extension[reportelement][7].extension[name].valueString = "phone"
* extension[reportdetails].extension[reportelement][7].extension[fhirpath].valueString = "Practitioner.telecom.where(system='phone').value"
* extension[reportdetails].extension[reportelement][7].extension[display].valueString = "Phone Number"
* extension[reportdetails].extension[reportelement][7].extension[filter].valueBoolean = false
* extension[reportdetails].extension[reportelement][7].extension[dropDownFilter].valueBoolean = false
* extension[reportdetails].extension[reportelement][7].extension[order].valueInteger = 7

* extension[reportdetails].extension[reportelement][8].extension[name].valueString = "email"
* extension[reportdetails].extension[reportelement][8].extension[fhirpath].valueString = "Practitioner.telecom.where(system='email').value"
* extension[reportdetails].extension[reportelement][8].extension[display].valueString = "Email"
* extension[reportdetails].extension[reportelement][8].extension[filter].valueBoolean = false
* extension[reportdetails].extension[reportelement][8].extension[dropDownFilter].valueBoolean = false
* extension[reportdetails].extension[reportelement][8].extension[order].valueInteger = 8

* extension[reportdetails].extension[reportelement][9].extension[name].valueString = "martialStatus"
* extension[reportdetails].extension[reportelement][9].extension[fhirpath].valueString = "Practitioner.extension.where(url='http://ihris.org/fhir/StructureDefinition/ihris-practitioner-marital-status').valueCoding.display"
* extension[reportdetails].extension[reportelement][9].extension[display].valueString = "Marital Status"
* extension[reportdetails].extension[reportelement][9].extension[filter].valueBoolean = true
* extension[reportdetails].extension[reportelement][9].extension[dropDownFilter].valueBoolean = true
* extension[reportdetails].extension[reportelement][9].extension[order].valueInteger = 9

* extension[reportdetails].extension[reportelement][10].extension[name].valueString = "racialgroup"
* extension[reportdetails].extension[reportelement][10].extension[fhirpath].valueString = "Practitioner.extension.where(url='http://ihris.org/fhir/StructureDefinition/ihris-practitioner-racial-group').valueCoding.display"
* extension[reportdetails].extension[reportelement][10].extension[display].valueString = "Racial Group"
* extension[reportdetails].extension[reportelement][10].extension[filter].valueBoolean = true
* extension[reportdetails].extension[reportelement][10].extension[dropDownFilter].valueBoolean = true
* extension[reportdetails].extension[reportelement][10].extension[order].valueInteger = 10

* extension[reportdetails].extension[reportelement][11].extension[name].valueString = "ihris-related-group"
* extension[reportdetails].extension[reportelement][11].extension[fhirpath].valueString = "Practitioner.extension.where(url='http://ihris.org/fhir/StructureDefinition/ihris-related-group').extension.where(url='location').valueString"
* extension[reportdetails].extension[reportelement][11].extension[filter].valueBoolean = false
* extension[reportdetails].extension[reportelement][11].extension[dropDownFilter].valueBoolean = false

* extension[reportdetails].extension[reportelement][12].extension[name].valueString = "res-id"
* extension[reportdetails].extension[reportelement][12].extension[fhirpath].valueString = "Practitioner.id"
* extension[reportdetails].extension[reportelement][12].extension[filter].valueBoolean = false
* extension[reportdetails].extension[reportelement][12].extension[dropDownFilter].valueBoolean = false

* extension[reportlink][0].extension[name].valueString = "role"
* extension[reportlink][0].extension[resource].valueString = "PractitionerRole"
* extension[reportlink][0].extension[linkElement].valueString = "PractitionerRole.practitioner.reference"
* extension[reportlink][0].extension[linkTo].valueString = "practitioner"
* extension[reportlink][0].extension[linkElementSearchParameter].valueString = "practitioner"
* extension[reportlink][0].extension[multiple].valueBoolean = false

* extension[reportlink][0].extension[reportelement][0].extension[name].valueString = "job"
* extension[reportlink][0].extension[reportelement][0].extension[fhirpath].valueString = "code.coding.display"
* extension[reportlink][0].extension[reportelement][0].extension[display].valueString = "Job Title"
* extension[reportlink][0].extension[reportelement][0].extension[filter].valueBoolean = true
* extension[reportlink][0].extension[reportelement][0].extension[dropDownFilter].valueBoolean = true
* extension[reportlink][0].extension[reportelement][0].extension[order].valueInteger = 11

* extension[reportlink][0].extension[reportelement][1].extension[name].valueString = "startDate"
* extension[reportlink][0].extension[reportelement][1].extension[fhirpath].valueString = "period.start"
* extension[reportlink][0].extension[reportelement][1].extension[display].valueString = "Start Date"
* extension[reportlink][0].extension[reportelement][1].extension[filter].valueBoolean = true
* extension[reportlink][0].extension[reportelement][1].extension[dropDownFilter].valueBoolean = false
* extension[reportlink][0].extension[reportelement][1].extension[order].valueInteger = 12

* extension[reportlink][0].extension[reportelement][2].extension[name].valueString = "endDate"
* extension[reportlink][0].extension[reportelement][2].extension[fhirpath].valueString = "period.end"
* extension[reportlink][0].extension[reportelement][2].extension[display].valueString = "End Date"
* extension[reportlink][0].extension[reportelement][2].extension[filter].valueBoolean = true
* extension[reportlink][0].extension[reportelement][2].extension[dropDownFilter].valueBoolean = false
* extension[reportlink][0].extension[reportelement][2].extension[order].valueInteger = 13

* extension[reportlink][0].extension[reportelement][3].extension[name].valueString = "empTerms"
* extension[reportlink][0].extension[reportelement][3].extension[fhirpath].valueString = "extension.where(url='http://ihris.org/fhir/StructureDefinition/ihris-practitionerrole-employment-terms').valueCoding.display"
* extension[reportlink][0].extension[reportelement][3].extension[display].valueString = "Employment Terms"
* extension[reportlink][0].extension[reportelement][3].extension[filter].valueBoolean = true
* extension[reportlink][0].extension[reportelement][3].extension[dropDownFilter].valueBoolean = true
* extension[reportlink][0].extension[reportelement][3].extension[order].valueInteger = 14

* extension[reportlink][0].extension[reportelement][4].extension[name].valueString = "salary"
* extension[reportlink][0].extension[reportelement][4].extension[fhirpath].valueString = "extension.where(url='http://ihris.org/fhir/StructureDefinition/ihris-practitionerrole-salary').valueMoney.value"
* extension[reportlink][0].extension[reportelement][4].extension[display].valueString = "Salary"
* extension[reportlink][0].extension[reportelement][4].extension[filter].valueBoolean = true
* extension[reportlink][0].extension[reportelement][4].extension[dropDownFilter].valueBoolean = true
* extension[reportlink][0].extension[reportelement][4].extension[order].valueInteger = 15

* extension[reportlink][0].extension[reportelement][5].extension[name].valueString = "supervisor"
* extension[reportlink][0].extension[reportelement][5].extension[fhirpath].valueString = "extension.where(url='http://ihris.org/fhir/StructureDefinition/ihris-practitionerrole-supervisor').valueCoding.display"
* extension[reportlink][0].extension[reportelement][5].extension[display].valueString = "Supervisor"
* extension[reportlink][0].extension[reportelement][5].extension[filter].valueBoolean = true
* extension[reportlink][0].extension[reportelement][5].extension[dropDownFilter].valueBoolean = true
* extension[reportlink][0].extension[reportelement][5].extension[order].valueInteger = 15

* extension[reportlink][1].extension[name].valueString = "facility"
* extension[reportlink][1].extension[resource].valueString = "Location"
* extension[reportlink][1].extension[linkElement].valueString = "Location.id"
* extension[reportlink][1].extension[linkTo].valueString = "role.location.reference"
* extension[reportlink][1].extension[multiple].valueBoolean = false
* extension[reportlink][1].extension[reportelement][0].extension[name].valueString = "dutyPost"
* extension[reportlink][1].extension[reportelement][0].extension[fhirpath].valueString = "name"
* extension[reportlink][1].extension[reportelement][0].extension[display].valueString = "Facility/Place of work"
* extension[reportlink][1].extension[reportelement][0].extension[filter].valueBoolean = true
* extension[reportlink][1].extension[reportelement][0].extension[dropDownFilter].valueBoolean = true
* extension[reportlink][1].extension[reportelement][0].extension[order].valueInteger = 11

* extension[reportlink][2].extension[name].valueString = "const"
* extension[reportlink][2].extension[resource].valueString = "Location"
* extension[reportlink][2].extension[linkElement].valueString = "Location.id"
* extension[reportlink][2].extension[linkTo].valueString = "facility.partOf.reference"
* extension[reportlink][2].extension[multiple].valueBoolean = false
* extension[reportlink][2].extension[initialFilter].valueString = "_profile=http://ihris.org/fhir/StructureDefinition/ihris-jurisdiction"
* extension[reportlink][2].extension[reportelement][0].extension[name].valueString = "constituency"
* extension[reportlink][2].extension[reportelement][0].extension[fhirpath].valueString = "name"
* extension[reportlink][2].extension[reportelement][0].extension[display].valueString = "Constituency"
* extension[reportlink][2].extension[reportelement][0].extension[filter].valueBoolean = true
* extension[reportlink][2].extension[reportelement][0].extension[dropDownFilter].valueBoolean = true
* extension[reportlink][2].extension[reportelement][0].extension[order].valueInteger = 16

* extension[reportlink][3].extension[name].valueString = "district"
* extension[reportlink][3].extension[resource].valueString = "Location"
* extension[reportlink][3].extension[linkElement].valueString = "Location.id"
* extension[reportlink][3].extension[linkTo].valueString = "const.partOf.reference"
* extension[reportlink][3].extension[multiple].valueBoolean = false
* extension[reportlink][3].extension[initialFilter].valueString = "_profile=http://ihris.org/fhir/StructureDefinition/ihris-jurisdiction"
* extension[reportlink][3].extension[reportelement][0].extension[name].valueString = "districtName"
* extension[reportlink][3].extension[reportelement][0].extension[fhirpath].valueString = "name"
* extension[reportlink][3].extension[reportelement][0].extension[display].valueString = "District"
* extension[reportlink][3].extension[reportelement][0].extension[filter].valueBoolean = true
* extension[reportlink][3].extension[reportelement][0].extension[dropDownFilter].valueBoolean = true
* extension[reportlink][3].extension[reportelement][0].extension[order].valueInteger = 17

* extension[reportlink][4].extension[name].valueString = "region"
* extension[reportlink][4].extension[resource].valueString = "Location"
* extension[reportlink][4].extension[linkElement].valueString = "Location.id"
* extension[reportlink][4].extension[linkTo].valueString = "district.partOf.reference"
* extension[reportlink][4].extension[multiple].valueBoolean = false
* extension[reportlink][4].extension[initialFilter].valueString = "_profile=http://ihris.org/fhir/StructureDefinition/ihris-jurisdiction"
* extension[reportlink][4].extension[reportelement][0].extension[name].valueString = "regionName"
* extension[reportlink][4].extension[reportelement][0].extension[fhirpath].valueString = "name"
* extension[reportlink][4].extension[reportelement][0].extension[display].valueString = "Region"
* extension[reportlink][4].extension[reportelement][0].extension[filter].valueBoolean = true
* extension[reportlink][4].extension[reportelement][0].extension[dropDownFilter].valueBoolean = true
* extension[reportlink][4].extension[reportelement][0].extension[order].valueInteger = 18