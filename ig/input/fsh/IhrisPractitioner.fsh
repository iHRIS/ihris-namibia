Invariant:      ihris-age-18
Description:    "birthDate must be more than 18 years ago."
Expression:     "birthDate < today() - 18 years"
Severity:       #error


Profile:        IhrisPractitioner
Parent:         Practitioner
Id:             ihris-practitioner
Title:          "iHRIS Practitioner"
Description:    "iHRIS profile of Practitioner."
* identifier 0..* MS
* identifier ^label = "Identifier"
* identifier ^constraint[0].key = "ihris-search-identifier"
* identifier ^constraint[0].severity = #error
* identifier ^constraint[0].expression = "'Practitioner' | 'identifier' | iif(system.exists(), system & '|' & value, value)"
* identifier ^constraint[0].human = "The identifier must be unique and another record has this identifier"
* identifier.use 0..0
* identifier.type MS
* identifier.type ^label = "Type"
* identifier.type.coding 1..1 MS
* identifier.type.coding ^label = "Type"
* identifier.type.coding from IhrisNamibiaIdentifierValueSet
* identifier.type from IhrisNamibiaIdentifierValueSet
* identifier.system 0..0
* identifier.value MS
* identifier.value ^label = "Value"
* name 1..1 MS
* name ^label = "Name"
* name.use 0..0
* name.use ^label = "Use"
* name.family 1..1 MS
* name.family ^label = "Surname"
* name.family ^constraint[0].key = "ihris-name-check"
* name.family ^constraint[0].severity = #error
* name.family ^constraint[0].expression = "matches('^[A-Za-z ]*$')"
* name.family ^constraint[0].human = "Name must be only text."
* name.given 1..1 MS
* name.given ^label = "First Name"
* name.given ^constraint[0].key = "ihris-name-check"
* name.given ^constraint[0].severity = #error
* name.given ^constraint[0].expression = "matches('^[A-Za-z ]*$')"
* name.given ^constraint[0].human = "Name must be only text."
* name.extension contains IhrisPractitionerOtherName named otherName 0..1 MS
* name.extension[otherName].valueString MS
* name.extension[otherName] ^label = "Othername"
* name.prefix 0..0
* name.prefix ^label = "Prefix"
* name.suffix 0..0
* name.suffix ^label = "Suffix"
* telecom 0..* MS
* telecom ^label = "Telecom"
* telecom.system MS
* telecom.system ^label = "Contact Type"
* telecom.use 0..0
* telecom.use ^label = "Use"
* telecom.value MS
* telecom.value ^label = "Value"
* telecom ^constraint[0].key = "ihris-search-phone"
* telecom ^constraint[0].severity = #error
* telecom ^constraint[0].expression = "'Practitioner' | 'phonenumber' | iif(value.exists(), system & '|' & value, value)"
* telecom ^constraint[0].human = "The Telecom must be unique and another record has this Telecom"
* address 0..0 MS
* gender 1..1 MS
* gender ^label = "Gender"
* gender from IhrisNamibiaGenderValueSet (required)
* birthDate MS
* birthDate ^label = "Birth Date"
* birthDate obeys ihris-age-18
* birthDate ^minValueQuantity.system = "http://unitsofmeasure.org/"
* birthDate ^minValueQuantity.code = #a
* birthDate ^minValueQuantity.value = 100
* birthDate ^maxValueQuantity.system = "http://unitsofmeasure.org/"
* birthDate ^maxValueQuantity.code = #a
* birthDate ^maxValueQuantity.value = -18
* photo 0..1 MS
* photo ^label = "Photo"
* communication 0..0
* extension contains
    IhrisPractitionerResidence named residence 0..1 MS and
    IhrisPractitionerNationality named nationality 0..1 and
    IhrisPractitionerMaritalStatus named maritalStatus 0..1 and
    IhrisPractitionerRacialGroup named racialGroup 0..1 and
    IhrisPractitionerPhysicalStatus named physicalStatus 0..1 MS and
    IhrisPractitionerLanguage named language 0..* MS
* extension[residence] ^label = "Residence"
* extension[residence].valueReference.reference MS
* extension[nationality]  ^label = "Nationality"
* extension[nationality].valueCoding MS
* extension[maritalStatus]  ^label = "Marital Status"
* extension[maritalStatus].valueCoding MS
* extension[racialGroup]  ^label = "Racial Group"
* extension[racialGroup].valueCoding MS
* extension[physicalStatus].valueCoding MS
* extension[physicalStatus] ^label = "Person with Disability"
* extension[language] ^label = "Language"
* extension[language].valueCoding MS
* active 1..1 MS
* active ^label = "Active"

Extension:      IhrisPractitionerLanguage
Id:             ihris-practitioner-language
Title:          "iHRIS Practitioner Language"
Description:    "iHRIS extension for Practitioner language."
* ^context.type = #element
* ^context.expression = "Practitioner"
* value[x] only Coding
* valueCoding 1..1 MS
* valueCoding ^label = "Language"
* valueCoding from IhrisNamibiaLanguagesValueSet (required)

CodeSystem:      IhrisNamibiaLanguagesCodesystem
Id:              ihris-languages-codesystem
Title:           "Languages"
* ^date = "2020-09-29T08:41:04.362Z"
* ^version = "0.2.0"
* #english "English" "English"
* #afrikaans "Afrikaans" "Afrikaans"
* #german "German" "German"
* #portuguese "Portuguese" "Portuguese"
* #french "French" "French"
* #otjiherero "Otjiherero" "Otjiherero"
* #khoekhoegowab "Khoekhoegowab" "Khoekhoegow"
* #oshiwambo "Oshiwambo" "Oshiwambo"
* #ruKwangali "RuKwangali" "RuKwangali"
* #setswana "Setswana" "Setswana"
* #siLozi "siLozi" "siLozi"

ValueSet:         IhrisNamibiaLanguagesValueSet
Id:               ihris-languages-valueset
Title:            "iHRIS Languages ValueSet"
* ^date = "2020-09-29T08:41:04.362Z"
* ^version = "0.2.0"
* codes from system IhrisNamibiaLanguagesCodesystem

Extension:      IhrisPractitionerOtherName
Id:             ihris-practitioner-othername
Title:          "iHRIS Practitioner Othername"
Description:    "iHRIS extension for Practitioner Othername."
* ^context.type = #element
* ^context.expression = "Practitioner"
* value[x] only string
* valueString 0..1 MS
* valueString ^label = "Othername"

Extension:      IhrisPractitionerResidence
Id:             ihris-practitioner-residence
Title:          "iHRIS Practitioner Residence"
Description:    "iHRIS extension for Practitioner residence."
* ^context.type = #element
* ^context.expression = "Practitioner"
* value[x] only Reference
* valueReference 1..1 MS
* valueReference ^label = "Residence"
* valueReference ^constraint[0].key = "ihris-location-residence"
* valueReference ^constraint[0].severity = #warning
* valueReference ^constraint[0].expression = "reference.matches('^Location/')"
* valueReference ^constraint[0].human = "Must be a location"
* valueReference only Reference(IhrisJurisdiction)
* valueReference.reference 1..1 MS
* valueReference.reference ^label = "Location"
* valueReference.type 0..0
* valueReference.identifier 0..0
* valueReference.display 0..0


Extension:      IhrisPractitionerNationality
Id:             ihris-practitioner-nationality
Title:          "iHRIS Practitioner Nationality"
Description:    "iHRIS extension for Practitioner nationality."
* ^context.type = #element
* ^context.expression = "Practitioner"
* value[x] only Coding
* valueCoding 1..1 MS
* valueCoding ^label = "Nationality"
* valueCoding from http://hl7.org/fhir/ValueSet/iso3166-1-2 (required)

CodeSystem:      IhrisNamibiaGenderCodesystem
Id:              ihris-gender-codesystem
Title:           "Gender"
* ^date = "2023-06-29T08:41:04.362Z"
* ^version = "0.3.0"
* #male "Male" "Male"
* #female "Female" "Female"

ValueSet:         IhrisNamibiaGenderValueSet
Id:               ihris-gender-valueset
Title:            "iHRIS Gender ValueSet"
* ^date = "2023-06-29T08:41:04.362Z"
* ^version = "0.3.0"
* codes from system IhrisNamibiaGenderCodesystem

Extension:      IhrisPractitionerMaritalStatus
Id:             ihris-practitioner-marital-status
Title:          "iHRIS Practitioner Marital Status"
Description:    "iHRIS extension for Practitioner marital status."
* ^context.type = #element
* ^context.expression = "Practitioner"
* value[x] only Coding
* valueCoding 1..1 MS
* valueCoding ^label = "Marital Status"
* valueCoding from IhrisNamibiaMaritalStatusValueSet (required)

CodeSystem:      IhrisNamibiaMaritalStatusCodeSystem
Id:              ihris-marital-status-codesystem
Title:           "Marital Status"
* ^date = "2023-07-14T08:41:04.362Z"
* ^version = "0.4.0"
* #single "Single"
* #married "Married"
* #divorced "Divorced"
* #widowed "Widowed"
* #separated  "Separated"

ValueSet:         IhrisNamibiaMaritalStatusValueSet
Id:               ihris-marital-status-valueset
Title:            "iHRIS Marital ValueSet"
* ^date = "2023-07-14T08:41:04.362Z"
* ^version = "0.4.0"
* codes from system IhrisNamibiaMaritalStatusCodeSystem

Extension:      IhrisPractitionerPhysicalStatus
Id:             ihris-practitioner-physical-status
Title:          "iHRIS Practitioner Physical Status"
Description:    "iHRIS extension for Practitioner Physical Status."
* ^context.type = #element
* ^context.expression = "Practitioner"
* value[x] only Coding
* valueCoding 1..1 MS
* valueCoding ^label = "Person with Disability"
* valueCoding from IhrisYesNoValueSet (required)

CodeSystem:      IhrisYesNo
Id:              ihris-yesno
Title:           "Frequency"
* ^date = "2020-09-29T08:41:04.362Z"
* #yes "Yes" "Yes"
* #no "No" "No"

ValueSet:         IhrisYesNoValueSet
Id:               ihris-yesno-valueset
Title:            "iHRIS Payment ValueSet"
* ^date = "2020-09-29T08:41:04.362Z"
* ^version = "0.2.0"
* codes from system IhrisYesNo

Extension: IhrisPractitionerRacialGroup
Id: ihris-practitioner-racial-group
Title: "iHRIS Practitioner Racial Group"
Description: "iHRIS extension for Practitioner Racial Group."
* ^context.type = #element
* ^context.expression = "Practitioner"
* value[x] only Coding
* valueCoding 1..1 MS
* valueCoding ^label = "Racial Group"
* valueCoding from IhrisNamibiaRacialGroupValueSet (required)

CodeSystem:      IhrisNamibiaRacialGroupCodeSystem
Id:              ihris-namibia-racial-group-codesystem
Title:           "Racial Group"
* ^date = "2023-12-14T08:41:04.362Z"
* ^version = "0.7.0"
* #african "African"
* #white "White"
* #colored "Colored"

ValueSet:         IhrisNamibiaRacialGroupValueSet
Id:               ihris-namibia-racial-group
Title:            "iHRIS Racial Group ValueSet"
* ^date = "2023-12-14T08:41:04.362Z"
* ^version = "0.7.0"
* codes from system IhrisNamibiaRacialGroupCodeSystem

CodeSystem:      IhrisRelationCodesystem
Id:              ihris-relation-codesystem
Title:           "Relationship"
* ^date = "2020-10-29T08:41:04.362Z"
* ^version = "0.2.0"
* #spouse "Spouse" "Spouse"
* #mother "Mother" "Mother"
* #father "Father" "Father"
* #adoptedchild "Adopted Child" "Adopted Child"
* #bilogicalChild "Biological Child" "Biological Child"
* #other "other" "other"

ValueSet:         IhrisRelationValueSet
Id:               ihris-relation-valueset
Title:            "iHRIS Relationship ValueSet"
* ^date = "2020-10-29T08:41:04.362Z"
* ^version = "0.2.0"
* codes from system IhrisRelationCodesystem

Instance:       ihris-page-relation
InstanceOf:     IhrisPage
Title:          "iHRIS relationship type CodeSystem Page"
Usage:          #example
* code = IhrisResourceCodeSystem#page
* extension[display].extension[resource].valueReference = Reference(CodeSystem/ihris-relation-codesystem)
* extension[display].extension[search][0].valueString = "Code|code"
* extension[display].extension[search][1].valueString = "Display|display"
* extension[display].extension[field][0].extension[path].valueString = "CodeSystem.code"
* extension[display].extension[field][0].extension[readOnlyIfSet].valueBoolean = true
* extension[section][0].extension[title].valueString = "Relationship Type"
* extension[section][0].extension[description].valueString = "Relationship Type"
* extension[section][0].extension[name].valueString = "CodeSystem"
* extension[section][0].extension[field][0].valueString = "CodeSystem.display"
* extension[section][0].extension[field][1].valueString = "CodeSystem.code"
* extension[section][0].extension[field][2].valueString = "CodeSystem.definition"

Instance:      ihris-page-languages
InstanceOf:    IhrisPage
Title:         "iHRIS Languages CodeSystem Page"
Usage:         #example
* code = IhrisResourceCodeSystem#page
* extension[display].extension[resource].valueReference = Reference(CodeSystem/ihris-languages-codesystem)
* extension[display].extension[search][0].valueString = "Code|code"
* extension[display].extension[search][1].valueString = "Display|display"
* extension[display].extension[field][0].extension[path].valueString = "CodeSystem.code"
* extension[display].extension[field][0].extension[readOnlyIfSet].valueBoolean = true
* extension[section][0].extension[title].valueString = "Languages"
* extension[section][0].extension[description].valueString = "Languages"
* extension[section][0].extension[name].valueString = "CodeSystem"
* extension[section][0].extension[field][0].valueString = "CodeSystem.display"
* extension[section][0].extension[field][1].valueString = "CodeSystem.code"
* extension[section][0].extension[field][2].valueString = "CodeSystem.definition"

/*CodeSystem:      IhrisNamibiaPhysicalStatusCodeSystem
Id:              ihris-physical-status-codesystem
Title:           "Marital Status"
* ^date = "2023-09-14T08:41:04.362Z"
* ^version = "0.5.0"
* #ableBodied "Able Bodied"
* #disabled "Disabled"

ValueSet:         IhrisNamibiaPhysicalStatusValueSet
Id:               ihris-physical-status-valueset
Title:            "iHRIS Physical Status ValueSet"
* ^date = "2023-09-14T08:41:04.362Z"
* ^version = "0.5.0"
* codes from system IhrisNamibiaPhysicalStatusCodeSystem*/

ValueSet:         IhrisNamibiaIdentifierValueSet
Id:               ihris-namibia-identifier-valueset
Title:            "iHRIS Namibia Identifier ValueSet"
* ^date = "2024-06-24T08:41:04.362Z"
* ^version = "0.5.0"
* codes from system IhrisNamibiaIdentifierCodeSystem

CodeSystem:       IhrisNamibiaIdentifierCodeSystem
Id:               ihris-namibia-identifier
Title:            "Identifier Type"
* ^date = "2024-06-24T08:41:04.362Z"
* ^version = "0.5.0"
* #employeeId "Employee Id"
* #nationalIN "National Identification Number"
* #tinNumber "Tin Number"
* #licenseId "License Id"
* #fileNo "File No"
* #passport "Passport No"

Instance:       ihris-page-identifier
InstanceOf:     IhrisPage
Title:          "iHRIS Identifier type CodeSystem Page"
Usage:          #example
* code = IhrisResourceCodeSystem#page
* extension[display].extension[resource].valueReference = Reference(CodeSystem/ihris-namibia-identifier)
* extension[display].extension[search][0].valueString = "Code|code"
* extension[display].extension[search][1].valueString = "Display|display"
* extension[display].extension[field][0].extension[path].valueString = "CodeSystem.code"
* extension[display].extension[field][0].extension[readOnlyIfSet].valueBoolean = true
* extension[section][0].extension[title].valueString = "Identifier Types"
* extension[section][0].extension[description].valueString = "Identifier Types"
* extension[section][0].extension[name].valueString = "CodeSystem"
* extension[section][0].extension[field][0].valueString = "CodeSystem.display"
* extension[section][0].extension[field][1].valueString = "CodeSystem.code"
* extension[section][0].extension[field][2].valueString = "CodeSystem.definition"

Instance:       ihris-page-racialgroup
InstanceOf:     IhrisPage
Title:          "iHRIS Racial Group CodeSystem Page"
Usage:          #example
* code = IhrisResourceCodeSystem#page
* extension[display].extension[resource].valueReference = Reference(CodeSystem/ihris-namibia-racial-group-codesystem)
* extension[display].extension[search][0].valueString = "Code|code"
* extension[display].extension[search][1].valueString = "Display|display"
* extension[display].extension[field][0].extension[path].valueString = "CodeSystem.code"
* extension[display].extension[field][0].extension[readOnlyIfSet].valueBoolean = true
* extension[section][0].extension[title].valueString = "Racial Group"
* extension[section][0].extension[description].valueString = "Racial Group"
* extension[section][0].extension[name].valueString = "CodeSystem"
* extension[section][0].extension[field][0].valueString = "CodeSystem.display"
* extension[section][0].extension[field][1].valueString = "CodeSystem.code"
* extension[section][0].extension[field][2].valueString = "CodeSystem.definition"

Instance: practitioner-employeeid
InstanceOf: SearchParameter
Usage: #definition
* url = "http://ihris.org/fhir/SearchParameter/practitioner-employeeid"
* name = "Search Parameter on  employee id for practitioner"
* status = #active
* description = "Search by employee ID for a practitioner resource."
* code = #employeeid
* base = #Practitioner
* type = #string
* expression = "Practitioner.identifier.where(type.coding.code='employeeId').value"
* xpathUsage = #normal

Instance: practitioner-nationalid
InstanceOf: SearchParameter
Usage: #definition
* url = "http://ihris.org/fhir/SearchParameter/practitioner-nationalid"
* name = "Search Parameter on  National id for practitioner"
* status = #active
* description = "Search by National ID for a practitioner resource."
* code = #nationalid
* base = #Practitioner
* type = #string
* expression = "Practitioner.identifier.where(type.coding.code='nationalIN').value"
* xpathUsage = #normal