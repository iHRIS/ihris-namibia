Instance:       IhrisPractitionerQuestionnaire
InstanceOf:     IhrisQuestionnaire
Usage:          #definition
* title = "iHRIS Practitioner Questionnaire"
* description = "iHRIS Practitioner initial data entry questionnaire."
* id = "ihris-practitioner"
* url = "http://ihris.org/fhir/Questionnaire/ihris-practitioner"
* name = "ihris-practitioner"
* status = #active
* date = 2020-06-22
* purpose = "Data entry page for practitioners."

* item[0].linkId = "Practitioner"
* item[0].definition = "http://ihris.org/fhir/StructureDefinition/ihris-practitioner"
* item[0].text = "Health Worker|Primary demographic details"
* item[0].type = #group

* item[0].item[0].linkId = "Practitioner.name[0]"
* item[0].item[0].definition = "http://ihris.org/fhir/StructureDefinition/ihris-practitioner#Practitioner.name"
* item[0].item[0].text = "Name"
* item[0].item[0].type = #group

* item[0].item[0].item[0].linkId = "Practitioner.name.family"
* item[0].item[0].item[0].definition = "http://ihris.org/fhir/StructureDefinition/ihris-practitioner#Practitioner.name.family"
* item[0].item[0].item[0].text = "Surname"
* item[0].item[0].item[0].type = #string
* item[0].item[0].item[0].required = true
* item[0].item[0].item[0].repeats = false

* item[0].item[0].item[1].linkId = "Practitioner.name.given"
* item[0].item[0].item[1].definition = "http://ihris.org/fhir/StructureDefinition/ihris-practitioner#Practitioner.name.given"
* item[0].item[0].item[1].text = "First Name"
* item[0].item[0].item[1].type = #string
* item[0].item[0].item[1].required = true
* item[0].item[0].item[1].repeats = false

* item[0].item[0].item[2].linkId = "Practitioner.name.extension"
* item[0].item[0].item[2].definition = "http://ihris.org/fhir/StructureDefinition/ihris-practitioner#Practitioner.name.extension:otherName.value[x]:valueString"
* item[0].item[0].item[2].text = "Othername"
* item[0].item[0].item[2].type = #string
* item[0].item[0].item[2].required = false
* item[0].item[0].item[2].repeats = false

* item[0].item[1].linkId = "Practitioner.birthDate"
* item[0].item[1].definition = "http://ihris.org/fhir/StructureDefinition/ihris-practitioner#Practitioner.birthDate"
* item[0].item[1].text = "Date of Birth"
* item[0].item[1].type = #date
* item[0].item[1].required = false
* item[0].item[1].repeats = false

* item[0].item[2].linkId = "Practitioner.gender"
* item[0].item[2].definition = "http://ihris.org/fhir/StructureDefinition/ihris-practitioner#Practitioner.gender"
* item[0].item[2].text = "Gender"
* item[0].item[2].type = #choice
* item[0].item[2].answerValueSet = "http://ihris.org/fhir/ValueSet/ihris-gender-valueset"
* item[0].item[2].required = false
* item[0].item[2].repeats = false

* item[0].item[3].linkId = "Practitioner.extension[0]"
* item[0].item[3].definition = "http://ihris.org/fhir/StructureDefinition/ihris-practitioner#Practitioner.extension:nationality.value[x]:valueCoding"
* item[0].item[3].text = "Nationality"
* item[0].item[3].type = #choice
* item[0].item[3].answerValueSet = "http://hl7.org/fhir/ValueSet/iso3166-1-2"
* item[0].item[3].required = false
* item[0].item[3].repeats = false

// * item[0].item[4].linkId = "Practitioner.extension[1]"
// * item[0].item[4].definition = "http://ihris.org/fhir/StructureDefinition/ihris-practitioner#Practitioner.extension:racialGroup.value[x]:valueCoding"
// * item[0].item[4].text = "Racial Group"
// * item[0].item[4].type = #choice
// * item[0].item[4].answerValueSet = "http://ihris.org/fhir/ValueSet/ihris-namibia-racial-group"
// * item[0].item[4].required = false
// * item[0].item[4].repeats = false

* item[0].item[4].linkId = "Practitioner.extension[2]"
* item[0].item[4].definition = "http://ihris.org/fhir/StructureDefinition/ihris-practitioner#Practitioner.extension:maritalStatus.value[x]:valueCoding"
* item[0].item[4].text = "Marital Status"
* item[0].item[4].type = #choice
* item[0].item[4].answerValueSet = "http://ihris.org/fhir/ValueSet/ihris-marital-status-valueset"
* item[0].item[4].required = false
* item[0].item[4].repeats = false

* item[0].item[5].linkId = "Practitioner.extension[3]"
* item[0].item[5].definition = "http://ihris.org/fhir/StructureDefinition/ihris-practitioner#Practitioner.extension:physicalStatus.value[x]:valueCoding"
* item[0].item[5].text = "Person with Disability"
* item[0].item[5].type = #choice
* item[0].item[5].answerValueSet = "http://ihris.org/fhir/ValueSet/ihris-yesno-valueset"
* item[0].item[5].required = false
* item[0].item[5].repeats = false

* item[0].item[6].linkId = "Practitioner.extension[4]"
* item[0].item[6].definition = "http://ihris.org/fhir/StructureDefinition/ihris-practitioner#Practitioner.extension:residence.value[x]:valueReference"
* item[0].item[6].text = "Residence"
* item[0].item[6].type = #reference
* item[0].item[6].required = false
* item[0].item[6].repeats = false

* item[0].item[7].linkId = "Practitioner.extension[5]"
* item[0].item[7].definition = "http://ihris.org/fhir/StructureDefinition/ihris-practitioner#Practitioner.extension:language.value[x]:valueCoding"
* item[0].item[7].text = "Languages"
* item[0].item[7].type = #choice
* item[0].item[7].answerValueSet = "http://ihris.org/fhir/ValueSet/ihris-languages-valueset"
* item[0].item[7].required = false
* item[0].item[7].repeats = true

* item[0].item[8].linkId = "Practitioner.active"
* item[0].item[8].definition = "http://ihris.org/fhir/StructureDefinition/ihris-practitioner#Practitioner.active"
* item[0].item[8].text = "Active"
* item[0].item[8].type = #boolean
* item[0].item[8].required = true

* item[1].linkId = "__Practitioner:contact"
* item[1].definition = "http://ihris.org/fhir/StructureDefinition/ihris-practitioner"
* item[1].text = "Contact Details|email, phone numbers"
* item[1].type = #group

* item[1].item[0].linkId = "Practitioner.telecom[0].system"
* item[1].item[0].definition = "http://ihris.org/fhir/StructureDefinition/ihris-practitioner#Practitioner.telecom.system"
* item[1].item[0].text = "Type"
* item[1].item[0].type = #choice
* item[1].item[0].required = true
* item[1].item[0].repeats = false
* item[1].item[0].readOnly = true
* item[1].item[0].answerOption.valueCoding = http://hl7.org/fhir/contact-point-system#phone
* item[1].item[0].answerOption.initialSelected = true

* item[1].item[1].linkId = "Practitioner.telecom[0].value"
* item[1].item[1].definition = "http://ihris.org/fhir/StructureDefinition/ihris-practitioner#Practitioner.telecom.value"
* item[1].item[1].text = "Telehone"
* item[1].item[1].type = #string
* item[1].item[1].required = false
* item[1].item[1].repeats = false

* item[1].item[2].linkId = "Practitioner.telecom[1].system"
* item[1].item[2].definition = "http://ihris.org/fhir/StructureDefinition/ihris-practitioner#Practitioner.telecom.system"
* item[1].item[2].text = "Type"
* item[1].item[2].type = #choice
* item[1].item[2].required = true
* item[1].item[2].repeats = false
* item[1].item[2].readOnly = true
* item[1].item[2].answerOption.valueCoding = http://hl7.org/fhir/contact-point-system#sms
* item[1].item[2].answerOption.initialSelected = true

* item[1].item[3].linkId = "Practitioner.telecom[1].value"
* item[1].item[3].definition = "http://ihris.org/fhir/StructureDefinition/ihris-practitioner#Practitioner.telecom.value"
* item[1].item[3].text = "Mobile Phone"
* item[1].item[3].type = #string
* item[1].item[3].required = false
* item[1].item[3].repeats = false

* item[1].item[4].linkId = "Practitioner.telecom[1].system"
* item[1].item[4].definition = "http://ihris.org/fhir/StructureDefinition/ihris-practitioner#Practitioner.telecom.system"
* item[1].item[4].text = "Telecom System"
* item[1].item[4].type = #choice
* item[1].item[4].required = true
* item[1].item[4].repeats = false
* item[1].item[4].readOnly = true
* item[1].item[4].answerOption.valueCoding = http://hl7.org/fhir/contact-point-system#email
* item[1].item[4].answerOption.initialSelected = true

* item[1].item[5].linkId = "Practitioner.telecom[1].value"
* item[1].item[5].definition = "http://ihris.org/fhir/StructureDefinition/ihris-practitioner#Practitioner.telecom.value"
* item[1].item[5].text = "Email"
* item[1].item[5].type = #string
* item[1].item[5].required = false
* item[1].item[5].repeats = false

* item[2].linkId = "PractitionerRole"
* item[2].definition = "http://ihris.org/fhir/StructureDefinition/ihris-practitioner-role"
* item[2].text = "Position|Position the person holds"
* item[2].type = #group
* item[2].extension[constraint][0].extension[key].valueId = "ihris-start-end-date"
* item[2].extension[constraint][0].extension[severity].valueCode = #error
* item[2].extension[constraint][0].extension[expression].valueString = "where(linkId='PractitionerRole.period.end').answer.first().valueDateTime.empty() or where(linkId='PractitionerRole.period.end').answer.first().valueDateTime >= where(linkId='PractitionerRole.period.start').answer.first().valueDateTime"
* item[2].extension[constraint][0].extension[human].valueString = "The end date must be after the start date."

* item[2].item[0].linkId = "PractitionerRole.practitioner"
* item[2].item[0].definition = "http://ihris.org/fhir/StructureDefinition/ihris-practitioner-role#PractitionerRole.practitioner"
* item[2].item[0].text = "Practitioner"
* item[2].item[0].type = #string
* item[2].item[0].required = true
* item[2].item[0].repeats = false
* item[2].item[0].readOnly = true
* item[2].item[0].answerOption.valueString = "__REPLACE__Practitioner"
* item[2].item[0].answerOption.initialSelected = true

* item[2].item[1].linkId = "PractitionerRole.code"
* item[2].item[1].definition = "http://ihris.org/fhir/StructureDefinition/ihris-practitioner-role#PractitionerRole.code"
* item[2].item[1].text = "Job Title"
* item[2].item[1].type = #choice
* item[2].item[1].answerValueSet = "http://ihris.org/fhir/ValueSet/ihris-job-namibia"
* item[2].item[1].required = true
* item[2].item[1].repeats = false

* item[2].item[2].linkId = "PractitionerRole.period.start"
* item[2].item[2].definition = "http://ihris.org/fhir/StructureDefinition/ihris-practitioner-role#PractitionerRole.period.start"
* item[2].item[2].text = "Start Date"
* item[2].item[2].type = #dateTime
* item[2].item[2].required = true
* item[2].item[2].repeats = false

* item[2].item[3].linkId = "PractitionerRole.period.end"
* item[2].item[3].definition = "http://ihris.org/fhir/StructureDefinition/ihris-practitioner-role#PractitionerRole.period.end"
* item[2].item[3].text = "End Date"
* item[2].item[3].type = #dateTime
* item[2].item[3].required = false
* item[2].item[3].repeats = false

* item[2].item[4].linkId = "PractitionerRole.location"
* item[2].item[4].definition = "http://ihris.org/fhir/StructureDefinition/ihris-practitioner-role#PractitionerRole.location"
* item[2].item[4].text = "Location/Facility"
* item[2].item[4].type = #reference
* item[2].item[4].required = true
* item[2].item[4].repeats = false

* item[2].item[5].linkId = "PractitionerRole.extension[0]"
* item[2].item[5].definition = "http://ihris.org/fhir/StructureDefinition/ihris-practitioner-role#PractitionerRole.extension:employmentTerms.value[x]:valueCoding"
* item[2].item[5].text = "Employment Terms"
* item[2].item[5].type = #choice
* item[2].item[5].answerValueSet = "http://ihris.org/fhir/ValueSet/ihris-employment-terms-valueset"
* item[2].item[5].required = true
* item[2].item[5].repeats = false

* item[2].item[6].linkId = "PractitionerRole.extension[1]"
* item[2].item[6].definition = "http://ihris.org/fhir/StructureDefinition/ihris-practitioner-role#PractitionerRole.extension:supervisor.value[x]:valueCoding"
* item[2].item[6].text = "Supervisor"
* item[2].item[6].type = #choice
* item[2].item[6].answerValueSet = "http://ihris.org/fhir/ValueSet/ihris-job-namibia"
* item[2].item[6].required = false
* item[2].item[6].repeats = false

* item[2].item[7].linkId = "PractitionerRole.extension[2]"
* item[2].item[7].definition = "http://ihris.org/fhir/StructureDefinition/ihris-practitioner-role#PractitionerRole.extension:recruitmentEntity.value[x]:valueCoding"
* item[2].item[7].text = "Recruitment Entity/Organization"
* item[2].item[7].type = #choice
* item[2].item[7].answerValueSet = "http://ihris.org/fhir/ValueSet/ihris-organization-valueset"
* item[2].item[7].required = true
* item[2].item[7].repeats = false

* item[3].linkId = "Practitioner.identifier"
* item[3].definition = "http://ihris.org/fhir/StructureDefinition/ihris-practitioner#Practitioner.identifier"
* item[3].text = "Identifiers|Identifiers for the practitioner"
* item[3].type = #group

/* item[3].item[0].linkId = "Practitioner.identifier[0]"
* item[3].item[0].definition = "http://ihris.org/fhir/StructureDefinition/ihris-practitioner#Practitioner.identifier"
* item[3].item[0].text = "Employee Number"
* item[3].item[0].type = #group
* item[3].item[0].repeats = false
* item[3].item[0].required = true

* item[3].item[0].item[0].linkId = "Practitioner.identifier[0].system"
* item[3].item[0].item[0].definition = "http://ihris.org/fhir/StructureDefinition/ihris-practitioner#Practitioner.identifier.system"
* item[3].item[0].item[0].text = "System"
* item[3].item[0].item[0].type = #string
* item[3].item[0].item[0].repeats = false
* item[3].item[0].item[0].required = true

* item[3].item[0].item[1].linkId = "Practitioner.identifier[0].value"
* item[3].item[0].item[1].definition = "http://ihris.org/fhir/StructureDefinition/ihris-practitioner#Practitioner.identifier.value"
* item[3].item[0].item[1].text = "Employee Number"
* item[3].item[0].item[1].type = #string
* item[3].item[0].item[1].repeats = false
* item[3].item[0].item[1].required = true

* item[3].item[0].item[2].linkId = "Practitioner.identifier[0].type"
* item[3].item[0].item[2].definition = "http://ihris.org/fhir/StructureDefinition/ihris-practitioner#Practitioner.identifier.type"
* item[3].item[0].item[2].text = "ID Type"
* item[3].item[0].item[2].type = #choice
* item[3].item[0].item[2].answerValueSet = "http://hl7.org/fhir/ValueSet/identifier-type"
* item[3].item[0].item[2].repeats = false
* item[3].item[0].item[2].required = true*/

* item[3].item[0].linkId = "Practitioner.identifier[0]"
* item[3].item[0].definition = "http://ihris.org/fhir/StructureDefinition/ihris-practitioner#Practitioner.identifier"
* item[3].item[0].text = "National ID Number"
* item[3].item[0].type = #group

* item[3].item[0].item[0].linkId = "Practitioner.identifier[0].value"
* item[3].item[0].item[0].definition = "http://ihris.org/fhir/StructureDefinition/ihris-practitioner#Practitioner.identifier.value"
* item[3].item[0].item[0].text = "National ID Number"
* item[3].item[0].item[0].type = #string
* item[3].item[0].item[0].repeats = false
* item[3].item[0].item[0].required = true

* item[3].item[0].item[1].linkId = "Practitioner.identifier[0].type"
* item[3].item[0].item[1].definition = "http://ihris.org/fhir/StructureDefinition/ihris-practitioner#Practitioner.identifier.type"
* item[3].item[0].item[1].text = "ID Type"
* item[3].item[0].item[1].type = #choice
* item[3].item[0].item[1].repeats = false
* item[3].item[0].item[1].readOnly = true
* item[3].item[0].item[1].required = false
* item[3].item[0].item[1].answerOption.valueCoding = http://ihris.org/fhir/CodeSystem/ihris-namibia-identifier#nationalIN
* item[3].item[0].item[1].answerOption.initialSelected = true

* item[3].item[1].linkId = "Practitioner.identifier[1]"
* item[3].item[1].definition = "http://ihris.org/fhir/StructureDefinition/ihris-practitioner#Practitioner.identifier"
* item[3].item[1].text = "Passport Number"
* item[3].item[1].type = #group

* item[3].item[1].item[0].linkId = "Practitioner.identifier[1].value"
* item[3].item[1].item[0].definition = "http://ihris.org/fhir/StructureDefinition/ihris-practitioner#Practitioner.identifier.value"
* item[3].item[1].item[0].text = "Passport No"
* item[3].item[1].item[0].type = #string
* item[3].item[1].item[0].repeats = false
* item[3].item[1].item[0].required = false

* item[3].item[1].item[1].linkId = "Practitioner.identifier[1].type"
* item[3].item[1].item[1].definition = "http://ihris.org/fhir/StructureDefinition/ihris-practitioner#Practitioner.identifier.type"
* item[3].item[1].item[1].text = "ID Type"
* item[3].item[1].item[1].type = #choice
* item[3].item[1].item[1].repeats = false
* item[3].item[1].item[1].readOnly = true
* item[3].item[1].item[1].required = false
* item[3].item[1].item[1].answerOption.valueCoding = http://ihris.org/fhir/CodeSystem/ihris-namibia-identifier#passport
* item[3].item[1].item[1].answerOption.initialSelected = true