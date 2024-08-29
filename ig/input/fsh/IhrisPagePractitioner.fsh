Instance:       ihris-page-practitioner
InstanceOf:     IhrisPage
Title:          "Practitioner"
Usage:          #example
* code = IhrisResourceCodeSystem#page
* extension[display].extension[resource].valueReference = Reference(StructureDefinition/ihris-practitioner)
* extension[display].extension[search][0].valueString = "Surname|Practitioner.name.family"
* extension[display].extension[search][1].valueString = "First Name|Practitioner.name.given"
* extension[display].extension[search][2].valueString = "Other name|Practitioner.name.extension.where(url='http://ihris.org/fhir/StructureDefinition/ihris-practitioner-othername').valueString"
* extension[display].extension[search][3].valueString = "Birth Date|Practitioner.birthDate"
* extension[display].extension[search][4].valueString = "Gender|Practitioner.gender|http://hl7.org/fhir/administrative-gender"
* extension[display].extension[filter][0].valueString = "Name|name:contains"
* extension[display].extension[filter][1].valueString = "Gender|gender|http://hl7.org/fhir/ValueSet/administrative-gender"
* extension[display].extension[add].extension[url].valueUrl = "/questionnaire/ihris-practitioner/practitioner"
* extension[display].extension[add].extension[icon].valueString = "mdi-account-plus"
* extension[display].extension[add].extension[class].valueString = "accent"
* extension[display].extension[link][0].extension[url].valueUrl = "/resource/view/practitioner/FIELD?edit=true"
* extension[display].extension[link][0].extension[field].valueString = "Practitioner.id"
* extension[display].extension[link][0].extension[text].valueString = "Edit"
* extension[display].extension[link][0].extension[button].valueBoolean = true
* extension[display].extension[link][0].extension[icon].valueString = "mdi-pencil"
* extension[display].extension[link][0].extension[class].valueString = "secondary"
* extension[section][0].extension[title].valueString = "Health Worker"
* extension[section][0].extension[description].valueString = "Primary demographic details"
* extension[section][0].extension[name].valueString = "Practitioner"
* extension[section][0].extension[field][0].valueString = "Practitioner.photo"
* extension[section][0].extension[field][1].valueString = "Practitioner.name"
* extension[section][0].extension[field][2].valueString = "Practitioner.birthDate"
* extension[section][0].extension[field][3].valueString = "Practitioner.gender"
* extension[section][0].extension[field][4].valueString = "Practitioner.extension.where(url='http://ihris.org/fhir/StructureDefinition/ihris-practitioner-marital-status').valueCoding.display"
* extension[section][0].extension[field][5].valueString = "Practitioner.extension:physicalStatus"
* extension[section][0].extension[field][6].valueString = "Practitioner.extension.where(url='http://ihris.org/fhir/StructureDefinition/ihris-practitioner-racial-group').valueCoding.display"
* extension[section][0].extension[field][7].valueString = "Practitioner.extension.where(url='http://ihris.org/fhir/StructureDefinition/ihris-practitioner-nationality').valueCoding.display"
* extension[section][1].extension[title].valueString = "Identifiers"
* extension[section][1].extension[description].valueString = "Personal identifiers"
* extension[section][1].extension[name].valueString = "identifiers"
* extension[section][1].extension[field][0].valueString = "Practitioner.identifier"
* extension[section][1].extension[field][1].valueString = "Practitioner.identifier.type"
* extension[section][1].extension[field][2].valueString = "Practitioner.identifier.value"
* extension[section][2].extension[title].valueString = "Contact Details"
* extension[section][2].extension[description].valueString = "Address, email, phone numbers"
* extension[section][2].extension[name].valueString = "contact"
* extension[section][2].extension[field][0].valueString = "Practitioner.telecom"
* extension[section][3].extension[title].valueString = "Position"
* extension[section][3].extension[description].valueString = "Position the person holds"
* extension[section][3].extension[name].valueString = "position"
* extension[section][3].extension[field][0].valueString = "PractitionerRole.code"
* extension[section][3].extension[resource].extension[resource].valueReference = Reference(StructureDefinition/ihris-practitioner-role)
* extension[section][3].extension[resource].extension[linkfield].valueString = "PractitionerRole.practitioner"
* extension[section][3].extension[resource].extension[column][0].extension[header].valueString = "Job"
* extension[section][3].extension[resource].extension[column][0].extension[field].valueString = "PractitionerRole.code.coding"
* extension[section][3].extension[resource].extension[column][1].extension[header].valueString = "Facility/Location"
* extension[section][3].extension[resource].extension[column][1].extension[field].valueString = "PractitionerRole.location"
* extension[section][3].extension[resource].extension[column][2].extension[header].valueString = "Start Date"
* extension[section][3].extension[resource].extension[column][2].extension[field].valueString = "PractitionerRole.period.start"
* extension[section][3].extension[resource].extension[column][3].extension[header].valueString = "End Date"
* extension[section][3].extension[resource].extension[column][3].extension[field].valueString = "PractitionerRole.period.end"
* extension[section][3].extension[resource].extension[column][4].extension[header].valueString = "Employment Terms"
* extension[section][3].extension[resource].extension[column][4].extension[field].valueString = "PractitionerRole.extension.where(url='http://ihris.org/fhir/StructureDefinition/ihris-practitionerrole-employment-terms').valueCoding.display"
* extension[section][3].extension[resource].extension[column][5].extension[header].valueString = "Supervisor"
* extension[section][3].extension[resource].extension[column][5].extension[field].valueString = "PractitionerRole.extension.where(url='http://ihris.org/fhir/StructureDefinition/ihris-practitionerrole-supervisor').valueCoding.display"
* extension[section][3].extension[resource].extension[column][6].extension[header].valueString = "Actions"
* extension[section][3].extension[resource].extension[column][6].extension[field].valueString = "_action"
* extension[section][3].extension[resource].extension[action][0].extension[link].valueString = "/resource/add/practitionerrole?PractitionerRole.practitioner.reference=Practitioner/FHIRID"
* extension[section][3].extension[resource].extension[action][0].extension[text].valueString = "Assign Job"
* extension[section][3].extension[resource].extension[action][0].extension[row].valueBoolean = false
* extension[section][3].extension[resource].extension[action][0].extension[emptyDisplay].valueBoolean = true
* extension[section][3].extension[resource].extension[action][0].extension[condition].valueString = "PractitionerRole.period.end.exists()"
* extension[section][3].extension[resource].extension[action][0].extension[class].valueString = "primary"
* extension[section][3].extension[resource].extension[action][1].extension[link].valueString = "/resource/view/practitionerrole/ITEMID"
* extension[section][3].extension[resource].extension[action][1].extension[text].valueString = "View"
* extension[section][3].extension[resource].extension[action][1].extension[row].valueBoolean = true
* extension[section][3].extension[resource].extension[action][1].extension[class].valueString = "primary"
* extension[section][3].extension[resource].extension[action][2].extension[link].valueString = "/questionnaire/ihris-endrole/practitioner?practitionerrole=ITEMID"
* extension[section][3].extension[resource].extension[action][2].extension[text].valueString = "End Job"
* extension[section][3].extension[resource].extension[action][2].extension[row].valueBoolean = true
* extension[section][3].extension[resource].extension[action][2].extension[condition].valueString = "PractitionerRole.period.end.empty()"
* extension[section][3].extension[resource].extension[action][2].extension[class].valueString = "warning"
/* extension[section][4].extension[resource].extension[action][3].extension[link].valueString = "/questionnaire/ihris-promotion/practitioner?practitionerrole=ITEMID"
* extension[section][4].extension[resource].extension[action][3].extension[text].valueString = "Enter Promotion"
* extension[section][4].extension[resource].extension[action][3].extension[row].valueBoolean = true
* extension[section][4].extension[resource].extension[action][3].extension[condition].valueString = "PractitionerRole.period.end.empty()"
* extension[section][4].extension[resource].extension[action][3].extension[class].valueString = "accent"*/
* extension[section][4].extension[title].valueString = "Qualification/Education History"
* extension[section][4].extension[description].valueString = "Education History Details for the Person"
* extension[section][4].extension[name].valueString = "education-history"
* extension[section][4].extension[resource].extension[resource].valueReference = Reference(StructureDefinition/ihris-basic-education-history)
* extension[section][4].extension[resource].extension[searchfield].valueString = "practitioner"
* extension[section][4].extension[resource].extension[linkfield].valueString = "Basic.extension.where(url='http://ihris.org/fhir/StructureDefinition/ihris-practitioner-reference').valueReference.reference"
* extension[section][4].extension[resource].extension[column][0].extension[header].valueString = "Education Institution"
* extension[section][4].extension[resource].extension[column][0].extension[field].valueString = "extension.where(url='http://ihris.org/fhir/StructureDefinition/ihris-education-history').extension.where(url='institution').valueString"
* extension[section][4].extension[resource].extension[column][1].extension[header].valueString = "Qualification level"
* extension[section][4].extension[resource].extension[column][1].extension[field].valueString = "extension.where(url='http://ihris.org/fhir/StructureDefinition/ihris-education-history').extension.where(url='level').valueCoding"
* extension[section][4].extension[resource].extension[column][2].extension[header].valueString = "Qualification Name"
* extension[section][4].extension[resource].extension[column][2].extension[field].valueString = "extension.where(url='http://ihris.org/fhir/StructureDefinition/ihris-education-history').extension.where(url='qualification').valueString"
* extension[section][4].extension[resource].extension[column][3].extension[header].valueString = "Year"
* extension[section][4].extension[resource].extension[column][3].extension[field].valueString = "extension.where(url='http://ihris.org/fhir/StructureDefinition/ihris-education-history').extension.where(url='year').valueDate"
* extension[section][4].extension[resource].extension[column][4].extension[header].valueString = "Actions"
* extension[section][4].extension[resource].extension[column][4].extension[field].valueString = "_action"
* extension[section][4].extension[resource].extension[action][0].extension[link].valueString = "/questionnaire/ihris-education-history/basic-education-history?practitioner=FHIRID"
* extension[section][4].extension[resource].extension[action][0].extension[text].valueString = "Add Qualification"
* extension[section][4].extension[resource].extension[action][0].extension[row].valueBoolean = false
* extension[section][4].extension[resource].extension[action][0].extension[emptyDisplay].valueBoolean = true
* extension[section][4].extension[resource].extension[action][0].extension[class].valueString = "primary"
* extension[section][4].extension[resource].extension[action][1].extension[link].valueString = "/resource/view/basic-education-history/ITEMID"
* extension[section][4].extension[resource].extension[action][1].extension[text].valueString = "View"
* extension[section][4].extension[resource].extension[action][1].extension[row].valueBoolean = true
* extension[section][4].extension[resource].extension[action][1].extension[class].valueString = "primary"
* extension[section][4].extension[resource].extension[action][2].extension[link].valueString = "/questionnaire/ihris-education-history/basic-education-history/ITEMID?practitioner=FHIRID"
* extension[section][4].extension[resource].extension[action][2].extension[text].valueString = "Edit"
* extension[section][4].extension[resource].extension[action][2].extension[row].valueBoolean = true
* extension[section][4].extension[resource].extension[action][2].extension[class].valueString = "primary"
* extension[section][5].extension[title].valueString = "Emergency Contact"
* extension[section][5].extension[description].valueString = "Emergency Contact for the Person"
* extension[section][5].extension[name].valueString = "emergency"
* extension[section][5].extension[resource].extension[resource].valueReference = Reference(StructureDefinition/ihris-basic-emergency)
* extension[section][5].extension[resource].extension[searchfield].valueString = "practitioner"
* extension[section][5].extension[resource].extension[linkfield].valueString = "Basic.extension.where(url='http://ihris.org/fhir/StructureDefinition/ihris-practitioner-reference').valueReference.reference"
* extension[section][5].extension[resource].extension[column][0].extension[header].valueString = "Name"
* extension[section][5].extension[resource].extension[column][0].extension[field].valueString = "extension.where(url='http://ihris.org/fhir/StructureDefinition/ihris-emergency').extension.where(url='name').valueString"
* extension[section][5].extension[resource].extension[column][1].extension[header].valueString = "Relationship"
* extension[section][5].extension[resource].extension[column][1].extension[field].valueString = "extension.where(url='http://ihris.org/fhir/StructureDefinition/ihris-emergency').extension.where(url='relation').valueCoding.display"
* extension[section][5].extension[resource].extension[column][2].extension[header].valueString = "Mobile Phone"
* extension[section][5].extension[resource].extension[column][2].extension[field].valueString = "extension.where(url='http://ihris.org/fhir/StructureDefinition/ihris-emergency').extension.where(url='mobile').valueString"
* extension[section][5].extension[resource].extension[column][3].extension[header].valueString = "Actions"
* extension[section][5].extension[resource].extension[column][3].extension[field].valueString = "_action"
* extension[section][5].extension[resource].extension[action][0].extension[link].valueString = "/questionnaire/ihris-emergency/emergency?practitioner=FHIRID"
* extension[section][5].extension[resource].extension[action][0].extension[text].valueString = "Add Emergency Contact"
* extension[section][5].extension[resource].extension[action][0].extension[row].valueBoolean = false
* extension[section][5].extension[resource].extension[action][0].extension[emptyDisplay].valueBoolean = true
* extension[section][5].extension[resource].extension[action][0].extension[class].valueString = "primary"
* extension[section][5].extension[resource].extension[action][1].extension[link].valueString = "/resource/view/emergency/ITEMID"
* extension[section][5].extension[resource].extension[action][1].extension[text].valueString = "View"
* extension[section][5].extension[resource].extension[action][1].extension[row].valueBoolean = true
* extension[section][5].extension[resource].extension[action][1].extension[class].valueString = "primary"
* extension[section][5].extension[resource].extension[action][2].extension[link].valueString = "/questionnaire/ihris-emergency/emergency/ITEMID?practitioner=FHIRID"
* extension[section][5].extension[resource].extension[action][2].extension[text].valueString = "Edit"
* extension[section][5].extension[resource].extension[action][2].extension[row].valueBoolean = true
* extension[section][5].extension[resource].extension[action][2].extension[class].valueString = "primary"
* extension[section][6].extension[title].valueString = "Training Information"
* extension[section][6].extension[description].valueString = "Training Information for the Person"
* extension[section][6].extension[name].valueString = "Training Information"
* extension[section][6].extension[resource].extension[resource].valueReference = Reference(StructureDefinition/ihris-basic-inservice-training)
* extension[section][6].extension[resource].extension[searchfield].valueString = "practitioner"
* extension[section][6].extension[resource].extension[linkfield].valueString = "Basic.extension.where(url='http://ihris.org/fhir/StructureDefinition/ihris-practitioner-reference').valueReference.reference"
* extension[section][6].extension[resource].extension[column][0].extension[header].valueString = "Training Organization"
* extension[section][6].extension[resource].extension[column][0].extension[field].valueString = "extension.where(url='http://ihris.org/fhir/StructureDefinition/ihris-inservice-training').extension.where(url='provider').valueString"
* extension[section][6].extension[resource].extension[column][1].extension[header].valueString = "Training Type"
* extension[section][6].extension[resource].extension[column][1].extension[field].valueString = "extension.where(url='http://ihris.org/fhir/StructureDefinition/ihris-inservice-training').extension.where(url='training').valueCoding.display"
* extension[section][6].extension[resource].extension[column][2].extension[header].valueString = "Course Name"
* extension[section][6].extension[resource].extension[column][2].extension[field].valueString = "extension.where(url='http://ihris.org/fhir/StructureDefinition/ihris-inservice-training').extension.where(url='courseName').valueString"
* extension[section][6].extension[resource].extension[column][3].extension[header].valueString = "Start Date"
* extension[section][6].extension[resource].extension[column][3].extension[field].valueString = "extension.where(url='http://ihris.org/fhir/StructureDefinition/ihris-inservice-training').extension.where(url='startDate').valueDate"
* extension[section][6].extension[resource].extension[column][4].extension[header].valueString = "End Date"
* extension[section][6].extension[resource].extension[column][4].extension[field].valueString = "extension.where(url='http://ihris.org/fhir/StructureDefinition/ihris-inservice-training').extension.where(url='endDate').valueDate"
* extension[section][6].extension[resource].extension[column][5].extension[header].valueString = "Actions"
* extension[section][6].extension[resource].extension[column][5].extension[field].valueString = "_action"
* extension[section][6].extension[resource].extension[action][0].extension[link].valueString = "/questionnaire/ihris-inservice-training/inservice-training?practitioner=FHIRID"
* extension[section][6].extension[resource].extension[action][0].extension[text].valueString = "Add Training Info"
* extension[section][6].extension[resource].extension[action][0].extension[row].valueBoolean = false
* extension[section][6].extension[resource].extension[action][0].extension[emptyDisplay].valueBoolean = true
* extension[section][6].extension[resource].extension[action][0].extension[class].valueString = "primary"
* extension[section][6].extension[resource].extension[action][1].extension[link].valueString = "/resource/view/inservice-training/ITEMID"
* extension[section][6].extension[resource].extension[action][1].extension[text].valueString = "View"
* extension[section][6].extension[resource].extension[action][1].extension[row].valueBoolean = true
* extension[section][6].extension[resource].extension[action][1].extension[class].valueString = "primary"
* extension[section][6].extension[resource].extension[action][2].extension[link].valueString = "/questionnaire/ihris-inservice-training/inservice-training/ITEMID?practitioner=FHIRID"
* extension[section][6].extension[resource].extension[action][2].extension[text].valueString = "Edit"
* extension[section][6].extension[resource].extension[action][2].extension[row].valueBoolean = true
* extension[section][6].extension[resource].extension[action][2].extension[class].valueString = "primary"
* extension[section][7].extension[title].valueString = "Banking Information"
* extension[section][7].extension[description].valueString = "Banking Information for the Person"
* extension[section][7].extension[name].valueString = "banking"
* extension[section][7].extension[resource].extension[resource].valueReference = Reference(StructureDefinition/ihris-basic-banking)
* extension[section][7].extension[resource].extension[searchfield].valueString = "practitioner"
* extension[section][7].extension[resource].extension[linkfield].valueString = "Basic.extension.where(url='http://ihris.org/fhir/StructureDefinition/ihris-practitioner-reference').valueReference.reference"
* extension[section][7].extension[resource].extension[column][0].extension[header].valueString = "Account Name"
* extension[section][7].extension[resource].extension[column][0].extension[field].valueString = "extension.where(url='http://ihris.org/fhir/StructureDefinition/ihris-banking').extension.where(url='accountName').valueString"
* extension[section][7].extension[resource].extension[column][1].extension[header].valueString = "Account Number"
* extension[section][7].extension[resource].extension[column][1].extension[field].valueString = "extension.where(url='http://ihris.org/fhir/StructureDefinition/ihris-banking').extension.where(url='accountNumber').valueString"
* extension[section][7].extension[resource].extension[column][2].extension[header].valueString = "Account Type"
* extension[section][7].extension[resource].extension[column][2].extension[field].valueString = "extension.where(url='http://ihris.org/fhir/StructureDefinition/ihris-banking').extension.where(url='accountType').valueCoding.display"
* extension[section][7].extension[resource].extension[column][3].extension[header].valueString = "Bank Name"
* extension[section][7].extension[resource].extension[column][3].extension[field].valueString = "extension.where(url='http://ihris.org/fhir/StructureDefinition/ihris-banking').extension.where(url='bankName').valueString"
* extension[section][7].extension[resource].extension[column][4].extension[header].valueString = "Bank Branch"
* extension[section][7].extension[resource].extension[column][4].extension[field].valueString = "extension.where(url='http://ihris.org/fhir/StructureDefinition/ihris-banking').extension.where(url='bankBranch').valueString"
* extension[section][7].extension[resource].extension[column][5].extension[header].valueString = "Actions"
* extension[section][7].extension[resource].extension[column][5].extension[field].valueString = "_action"
* extension[section][7].extension[resource].extension[action][0].extension[link].valueString = "/questionnaire/ihris-banking/banking?practitioner=FHIRID"
* extension[section][7].extension[resource].extension[action][0].extension[text].valueString = "Add Banking Info"
* extension[section][7].extension[resource].extension[action][0].extension[row].valueBoolean = false
* extension[section][7].extension[resource].extension[action][0].extension[emptyDisplay].valueBoolean = true
* extension[section][7].extension[resource].extension[action][0].extension[class].valueString = "primary"
* extension[section][7].extension[resource].extension[action][1].extension[link].valueString = "/resource/view/banking/ITEMID"
* extension[section][7].extension[resource].extension[action][1].extension[text].valueString = "View"
* extension[section][7].extension[resource].extension[action][1].extension[row].valueBoolean = true
* extension[section][7].extension[resource].extension[action][1].extension[class].valueString = "primary"
* extension[section][7].extension[resource].extension[action][2].extension[link].valueString = "/questionnaire/ihris-banking/banking/ITEMID?practitioner=FHIRID"
* extension[section][7].extension[resource].extension[action][2].extension[text].valueString = "Edit"
* extension[section][7].extension[resource].extension[action][2].extension[row].valueBoolean = true
* extension[section][7].extension[resource].extension[action][2].extension[class].valueString = "primary"