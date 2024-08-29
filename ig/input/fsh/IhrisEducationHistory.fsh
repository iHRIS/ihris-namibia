Profile:        IhrisBasicEducationHistory
Parent:         IhrisPractitionerBasic
Id:             ihris-basic-education-history
Title:          "Education History Information"
Description:    "iHRIS Profile of the Basic resource for Education History."
* extension[practitioner].valueReference 1..1 MS
* extension[practitioner].valueReference ^label = "Health Worker"
* extension contains
    IhrisEducationHistory named educationHistory 1..1 MS
* extension[educationHistory].extension[institution] ^label = "Institution"
* extension[educationHistory].extension[institution].valueString 1..1 MS
* extension[educationHistory].extension[institution].valueString ^label = "Institution"
* extension[educationHistory].extension[level] ^label = "Qualification Level"
* extension[educationHistory].extension[level].valueCoding ^label = "Qualification Level"
* extension[educationHistory].extension[level].valueCoding 1..1 MS
* extension[educationHistory].extension[qualification] ^label = "Qualification Name"
* extension[educationHistory].extension[qualification].valueString ^label = "Qualification Name"
* extension[educationHistory].extension[qualification].valueString 0..1 MS
* extension[educationHistory].extension[year] ^label = "Year Of Graduation"
* extension[educationHistory].extension[year].valueDate ^label = "Year Of Graduation"
* extension[educationHistory].extension[year].valueDate 0..1 MS
    
Extension:      IhrisEducationHistory
Id:             ihris-education-history
Title:          "Education History details"
* extension contains
      institution 1..1 MS and
      level 1..1 MS and
      qualification 0..1 MS and
      year 0..1 MS
* extension[institution].value[x] only string
//* extension[institution].valueCoding from IhrisInstitutionValueSet
* extension[institution].valueString ^label = "Institution"
* extension[level].value[x] only Coding
* extension[level].valueCoding ^label = "Qualification Level"
* extension[level].valueCoding from IhrisEducationLevelValueSet (required)
* extension[qualification].value[x] only string
* extension[qualification].valueString ^label = "Qualification Name"
* extension[year].value[x] only date
* extension[year].valueDate ^label = "Year Of Graduation"

CodeSystem:      IhrisEducationLevel
Id:              ihris-education-level
Title:           "Education Level"
* ^date = "2023-12-29T08:41:04.362Z"
* ^version = "0.7.0"
* #Cerifiticate "Cerifiticate" "Cerifiticate"
* #Diploma "Diploma" "Diploma"
* #Bachelor "Bachelor" "Bachelor"
* #Undergrad "Undergraduate" "Undergraduate"
* #PGrad "Post Graduate" "Post Graduate"
* #Masters "Masters" "Masters"
* #PHD "PHD" "PHD"
* #G12 "Grade 12" "Grade 12"
* #Others "Others" "Others"

ValueSet:         IhrisEducationLevelValueSet
Id:               ihris-education-level-valueset
Title:            "iHRIS Education Level ValueSet"
* ^date = "2023-12-29T08:41:04.362Z"
* ^version = "0.7.0"
* codes from system IhrisEducationLevel

/*CodeSystem:      IhrisInstitution
Id:              ihris-institution
Title:           "Institution"
* ^date = "2020-11-10T08:41:04.362Z"
* ^version = "0.3.0"

ValueSet:         IhrisInstitutionValueSet
Id:               ihris-institution-valueset
Title:            "iHRIS Institution Value Set"
* ^date = "2020-11-10T08:41:04.362Z"
* ^version = "0.3.0"
* codes from system IhrisInstitution


Profile:        IhrisInstitution
Parent:         Location
Id:             ihris-institution
Title:          "Education Institution"
Description:    "iHRIS profile of Education Institution."
* identifier 0..0 
* status 1..1 MS
* status ^label = "Status"
* operationalStatus 0..0
* hoursOfOperation 0..0
* physicalType 0..0
* type 0..0
* mode 0..0
* name 1..1 MS
* name ^label = "Institution Name"
* telecom 0..* MS
* telecom ^label = "Institution Contact"
* telecom.system MS
* telecom.system ^label = "Type"
* telecom.value MS
* telecom.value ^label = "Value"
* telecom.use MS
* telecom.use ^label = "Use"
* address 0..1 MS
* address ^label = "Institution Address"
* address.type MS
* address.type ^label = "Address Type"
* address.use MS
* address.use ^label = "Use"
* address.line 0..1 MS
* address.line ^label = "Street name, number & P.O. Box etc."
* address.city MS
* address.city ^label = "Name of city, town etc"
* address.district MS
* address.district ^label = "District"
* address.country MS
* address.country ^label = "Country"
* partOf 0..1 MS
* partOf ^label = "Institution Location"
* extension contains
    IhrisInstitutionType named institutionType 1..1 MS 
* extension[institutionType].valueCoding MS
* extension[institutionType] ^label = "Institution Type"

Extension:      IhrisInstitutionType
Id:             ihris-institution-type
Title:          "Institution Type"
Description:    "iHRIS extension for Institution Type."
* ^context.type = #element
* ^context.expression = "Location"
* value[x] only Coding
* valueCoding 1..1 MS
* valueCoding ^label = "Type"
* valueCoding from IhrisInstitutionTypeValueSet (required)

CodeSystem:      IhrisInstitutionType
Id:              ihris-institution-type
Title:           "Institution Type"
* #university "University" "University"
* #technical "Technical Institute" "Technical Institute"
* #college "College" "College"
* #other "other" "other"

ValueSet:         IhrisInstitutionTypeValueSet
Id:               ihris-institution-type-valueset
Title:            "iHRIS Institution Type Value Set"
* codes from system IhrisInstitutionType*/

Instance:       IhrisPractitionerWorkflowEducationHistory
InstanceOf:      Questionnaire
Usage:          #definition
* title = "iHRIS Education History Workflow"
* description = "iHRIS workflow to record a Education History"
* id = "ihris-education-history"
* url = "http://ihris.org/fhir/Questionnaire/ihris-education-history"
* name = "ihris-education-history"
* status = #active
* date = 2020-08-27
* purpose = "Workflow page for recording a Education History information."

* item[0].linkId = "Basic"
* item[0].definition = "http://ihris.org/fhir/StructureDefinition/ihris-basic-education-history#Basic.id"
* item[0].text = "Qualification/Education History"
* item[0].type = #group

* item[0].item[0].linkId = "Basic.extension[0]"
* item[0].item[0].definition = "http://ihris.org/fhir/StructureDefinition/ihris-basic-education-history#Basic.id"
* item[0].item[0].text = "Details"
* item[0].item[0].type = #group

* item[0].item[0].item[0].linkId = "Basic.extension[0].extension[0]"
* item[0].item[0].item[0].definition = "http://ihris.org/fhir/StructureDefinition/ihris-basic-education-history#Basic.extension:educationHistory.extension:institution.value[x]:valueString"
* item[0].item[0].item[0].text = "Institution"
* item[0].item[0].item[0].type = #string
* item[0].item[0].item[0].required = true
* item[0].item[0].item[0].repeats = false

* item[0].item[0].item[1].linkId = "Basic.extension[0].extension[1]"
* item[0].item[0].item[1].definition = "http://ihris.org/fhir/StructureDefinition/ihris-basic-education-history#Basic.extension:educationHistory.extension:level.value[x]:valueCoding"
* item[0].item[0].item[1].text = "Qualification Level"
* item[0].item[0].item[1].type = #choice
* item[0].item[0].item[1].answerValueSet = "http://ihris.org/fhir/ValueSet/ihris-education-level-valueset"
* item[0].item[0].item[1].required = true
* item[0].item[0].item[1].repeats = false

* item[0].item[0].item[2].linkId = "Basic.extension[0].extension[2]"
* item[0].item[0].item[2].definition = "http://ihris.org/fhir/StructureDefinition/ihris-basic-education-history#Basic.extension:educationHistory.extension:qualification.value[x]:valueString"
* item[0].item[0].item[2].text = "Qualification Name"
* item[0].item[0].item[2].type = #string
* item[0].item[0].item[2].required = true
* item[0].item[0].item[2].repeats = false

* item[0].item[0].item[3].linkId = "Basic.extension[0].extension[4]#year"
* item[0].item[0].item[3].definition = "http://ihris.org/fhir/StructureDefinition/ihris-basic-education-history#Basic.extension:educationHistory.extension:year.value[x]:valueDate"
* item[0].item[0].item[3].text = "Year Of Graduation"
* item[0].item[0].item[3].type = #date
* item[0].item[0].item[3].required = false
* item[0].item[0].item[3].repeats = false

Instance:       ihris-page-basic-education-history
InstanceOf:     IhrisPage
Title:          "Education History"
Usage:          #example
* code = IhrisResourceCodeSystem#page
* extension[display].extension[resource].valueReference = Reference(StructureDefinition/ihris-basic-education-history)
* extension[display].extension[link][0].extension[field].valueString = "Basic.extension.where(url='http://ihris.org/fhir/StructureDefinition/ihris-practitioner-reference').valueReference.reference"
* extension[display].extension[link][0].extension[text].valueString = "View Health Worker"
* extension[display].extension[link][0].extension[button].valueBoolean = true
* extension[display].extension[link][0].extension[icon].valueString = "mdi-account-arrow-right"
* extension[display].extension[link][0].extension[url].valueUrl = "/resource/view/practitioner/FIELD"
* extension[display].extension[link][1].extension[field].valueString = "Basic.extension.where(url='http://ihris.org/fhir/StructureDefinition/ihris-practitioner-reference').valueReference.reference"
* extension[display].extension[link][1].extension[text].valueString = "Add Another"
* extension[display].extension[link][1].extension[button].valueBoolean = true
* extension[display].extension[link][1].extension[icon].valueString = "mdi-account-arrow-right"
* extension[display].extension[link][1].extension[url].valueUrl = "/questionnaire/ihris-education-history/basic-education-history?practitioner=FIELD"
* extension[display].extension[search][0].valueString = "Practitioner|extension.where(url='http://ihris.org/fhir/StructureDefinition/ihris-practitioner-reference').valueReference.reference"
* extension[display].extension[search][1].valueString = "Institution|extension.where(url='http://ihris.org/fhir/StructureDefinition/ihris-education-history').extension.where(url='institution').valueString"
* extension[display].extension[search][2].valueString = "Level|extension.where(url='http://ihris.org/fhir/StructureDefinition/ihris-education-history').extension.where(url='level').valueCoding.display"
* extension[display].extension[search][3].valueString = "Educational Major|extension.where(url='http://ihris.org/fhir/StructureDefinition/ihris-education-history').extension.where(url='qualification').valueString"
* extension[display].extension[search][4].valueString = "Year|extension.where(url='http://ihris.org/fhir/StructureDefinition/ihris-education-history').extension.where(url='year').valueDate"
* extension[display].extension[field][0].extension[path].valueString = "Basic.extension:practitioner.value[x]:valueReference"
* extension[display].extension[field][0].extension[readOnlyIfSet].valueBoolean = true
* extension[display].extension[field][1].extension[path].valueString = "Basic.extension:educationHistory.extension:year.value[x]:valueDate"
* extension[display].extension[field][1].extension[type].valueString = "year"
* extension[section][0].extension[title].valueString = "Education History"
* extension[section][0].extension[description].valueString = "Education History details"
* extension[section][0].extension[name].valueString = "Basic"
* extension[section][0].extension[field][0].valueString = "extension:practitioner"
* extension[section][0].extension[field][1].valueString = "extension:educationHistory.extension:institution.value[x]:valueString"
* extension[section][0].extension[field][2].valueString = "extension:educationHistory.extension:level.value[x]:valueCoding"
* extension[section][0].extension[field][3].valueString = "extension:educationHistory.extension:qualification.value[x]:valueString"
* extension[section][0].extension[field][4].valueString = "extension:educationHistory.extension:year.value[x]:valueDate"


Instance:       ihris-page-education-level
InstanceOf:     IhrisPage
Title:          "iHRIS Education Level CodeSystem Page"
Usage:          #example
* code = IhrisResourceCodeSystem#page
* extension[display].extension[resource].valueReference = Reference(CodeSystem/ihris-education-level)
* extension[display].extension[search][0].valueString = "Code|code"
* extension[display].extension[search][1].valueString = "Display|display"
* extension[display].extension[field][0].extension[path].valueString = "CodeSystem.code"
* extension[display].extension[field][0].extension[readOnlyIfSet].valueBoolean = true
* extension[section][0].extension[title].valueString = "Degree"
* extension[section][0].extension[description].valueString = "Degree"
* extension[section][0].extension[name].valueString = "CodeSystem"
* extension[section][0].extension[field][0].valueString = "CodeSystem.display"
* extension[section][0].extension[field][1].valueString = "CodeSystem.code"
* extension[section][0].extension[field][2].valueString = "CodeSystem.definition"

