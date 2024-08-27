Profile:        IhrisBasicEmergency
Parent:         IhrisPractitionerBasic
Id:             ihris-basic-emergency
Title:          "Emergency Information"
Description:    "iHRIS Profile of the Basic resource for Emergency."
* extension[practitioner].valueReference 1..1 MS
* extension[practitioner].valueReference ^label = "Health Worker"
* extension contains
    IhrisEmergency named emergency 1..1 MS
* extension[emergency] ^label = "Emergency"
* extension[emergency].extension[name] ^label = "Full Name"
* extension[emergency].extension[name].valueString 1..1 MS
* extension[emergency].extension[relation] ^label = "Relationship"
* extension[emergency].extension[relation].valueCoding 1..1 MS
* extension[emergency].extension[phone] ^label = "Home Phone"
* extension[emergency].extension[phone].valueString MS
* extension[emergency].extension[mobile] ^label = "Mobile Phone"
* extension[emergency].extension[mobile].valueString MS
* extension[emergency].extension[email] ^label = "Email"
* extension[emergency].extension[email].valueString MS
* extension[emergency].extension[remark] ^label = "Remark"
* extension[emergency].extension[remark].valueString MS
    
Extension:      IhrisEmergency
Id:             ihris-emergency
Title:          "Emergency details"
* extension contains name 1..1 MS and
    relation 1..1 MS and
    phone 0..1 MS and
    mobile 0..1 MS and
    email 0..1 MS and
    remark 0..1 MS
* extension[name].value[x] only string
* extension[name].valueString 1..1 MS
* extension[name].valueString ^label = "Full Name"
* extension[name].valueString ^constraint[0].key = "ihris-name-check"
* extension[name].valueString ^constraint[0].severity = #error
* extension[name].valueString ^constraint[0].expression = "matches('^[A-Za-z ]*$')"
* extension[name].valueString ^constraint[0].human = "Name must be only text."
* extension[relation].value[x] only Coding
* extension[relation].valueCoding 1..1 MS
* extension[relation].valueCoding ^label = "Relationship"
* extension[relation].valueCoding from IhrisRelationValueSet (required)
* extension[phone].value[x] only string
* extension[phone].valueString 0..1 MS
* extension[phone].valueString ^label = "Home Phone"
* extension[mobile].value[x] only string
* extension[mobile].valueString 1..1 MS
* extension[mobile].valueString ^label = "Mobile Phone"
* extension[email].value[x] only string
* extension[email].valueString 0..1 MS
* extension[email].valueString ^label = "Email"
* extension[remark].value[x] only string
* extension[remark].valueString 0..1 MS
* extension[remark].valueString ^label = "Remark"

Instance:       IhrisPractitionerWorkflowEmergency
InstanceOf:     IhrisQuestionnaire
Usage:          #definition
* title = "iHRIS Emergency Workflow"
* description = "iHRIS workflow to record a Emergency"
* id = "ihris-emergency"
* url = "http://ihris.org/fhir/Questionnaire/ihris-emergency"
* name = "ihris-emergency"
* status = #active
* date = 2020-09-02
* purpose = "Workflow page for recording a Emergency information."

* item[0].linkId = "Basic"
* item[0].definition = "http://ihris.org/fhir/StructureDefinition/ihris-basic-emergency"
* item[0].text = "Next Of Kin"
* item[0].type = #group

* item[0].item[0].linkId = "Basic.extension[0]"
* item[0].item[0].definition = "http://ihris.org/fhir/StructureDefinition/ihris-basic-emergency#Basic.id"
* item[0].item[0].text = "Details"
* item[0].item[0].type = #group

* item[0].item[0].item[0].linkId = "Basic.extension[0].extension[0]"
* item[0].item[0].item[0].definition = "http://ihris.org/fhir/StructureDefinition/ihris-basic-emergency#Basic.extension:emergency.extension:name.value[x]:valueString"
* item[0].item[0].item[0].text = "Full Name"
* item[0].item[0].item[0].type = #string
* item[0].item[0].item[0].required = true
* item[0].item[0].item[0].repeats = false
* item[0].item[0].item[0].extension[constraint].extension[key].valueId = "ihris-given-name-check"
* item[0].item[0].item[0].extension[constraint].extension[severity].valueCode = #error
* item[0].item[0].item[0].extension[constraint].extension[expression].valueString = "matches('^[A-Za-z ]*$')"
* item[0].item[0].item[0].extension[constraint].extension[human].valueString = "Name must be only text."

* item[0].item[0].item[1].linkId = "Basic.extension[0].extension[1]"
* item[0].item[0].item[1].definition = "http://ihris.org/fhir/StructureDefinition/ihris-basic-emergency#Basic.extension:emergency.extension:relation.value[x]:valueCoding"
* item[0].item[0].item[1].text = "Relation"
* item[0].item[0].item[1].type = #choice
* item[0].item[0].item[1].answerValueSet = "http://ihris.org/fhir/ValueSet/ihris-relation-valueset"
* item[0].item[0].item[1].required = true
* item[0].item[0].item[1].repeats = false

* item[0].item[0].item[2].linkId = "Basic.extension[0].extension[2]"
* item[0].item[0].item[2].definition = "http://ihris.org/fhir/StructureDefinition/ihris-basic-emergency#Basic.extension:emergency.extension:phone.value[x]:valueString"
* item[0].item[0].item[2].text = "Home Phone"
* item[0].item[0].item[2].type = #string
* item[0].item[0].item[2].required = false
* item[0].item[0].item[2].repeats = false

* item[0].item[0].item[3].linkId = "Basic.extension[0].extension[3]"
* item[0].item[0].item[3].definition = "http://ihris.org/fhir/StructureDefinition/ihris-basic-emergency#Basic.extension:emergency.extension:mobile.value[x]:valueString"
* item[0].item[0].item[3].text = "Mobile Phone"
* item[0].item[0].item[3].type = #string
* item[0].item[0].item[3].required = false
* item[0].item[0].item[3].repeats = false

* item[0].item[0].item[4].linkId = "Basic.extension[0].extension[5]"
* item[0].item[0].item[4].definition = "http://ihris.org/fhir/StructureDefinition/ihris-basic-emergency#Basic.extension:emergency.extension:email.value[x]:valueString"
* item[0].item[0].item[4].text = "Email"
* item[0].item[0].item[4].type = #string
* item[0].item[0].item[4].required = false
* item[0].item[0].item[4].repeats = false
* item[0].item[0].item[4].extension[constraint].extension[key].valueId = "ihris-work-email-check"
* item[0].item[0].item[4].extension[constraint].extension[severity].valueCode = #error
* item[0].item[0].item[4].extension[constraint].extension[expression].valueString = "matches('^$|^([0-9a-zA-Z_.]+@([0-9a-zA-Z]+[.])+[a-zA-Z]{2,4})$')"
* item[0].item[0].item[4].extension[constraint].extension[human].valueString = "Email Address is not properly formatted."

* item[0].item[0].item[5].linkId = "Basic.extension[0].extension[8]"
* item[0].item[0].item[5].definition = "http://ihris.org/fhir/StructureDefinition/ihris-basic-emergency#Basic.extension:emergency.extension:remark.value[x]:valueString"
* item[0].item[0].item[5].text = "Remark"
* item[0].item[0].item[5].type = #string
* item[0].item[0].item[5].required = false
* item[0].item[0].item[5].repeats = false


Instance:       ihris-page-emergency
InstanceOf:     IhrisPage
Title:          "iHRIS Basic Emergency Page"
Usage:          #example
* code = IhrisResourceCodeSystem#page
* extension[display].extension[resource].valueReference = Reference(StructureDefinition/ihris-basic-emergency)
* extension[display].extension[link][0].extension[field].valueString = "Basic.extension.where(url='http://ihris.org/fhir/StructureDefinition/ihris-practitioner-reference').valueReference.reference"
* extension[display].extension[link][0].extension[text].valueString = "View Health Worker"
* extension[display].extension[link][0].extension[button].valueBoolean = true
* extension[display].extension[link][0].extension[icon].valueString = "mdi-account-arrow-right"
* extension[display].extension[link][0].extension[url].valueUrl = "/resource/view/practitioner/FIELD"
* extension[display].extension[search][0].valueString = "Emergency|extension.where(url='http://ihris.org/fhir/StructureDefinition/ihris-emergency').extension.where(url='name').valueString"
* extension[display].extension[field][0].extension[path].valueString = "Basic.extension:practitioner.value[x]:valueReference"
* extension[display].extension[field][0].extension[readOnlyIfSet].valueBoolean = true
* extension[section][0].extension[title].valueString = "Next Of Kin"
* extension[section][0].extension[description].valueString = "Emergency Contact details"
* extension[section][0].extension[name].valueString = "Basic"
* extension[section][0].extension[field][0].valueString = "Basic.extension:practitioner"
* extension[section][0].extension[field][1].valueString = "Basic.extension:emergency.extension:name.value[x]:valueString"
* extension[section][0].extension[field][2].valueString = "Basic.extension:emergency.extension:relation.value[x]:valueCoding"
* extension[section][0].extension[field][3].valueString = "Basic.extension:emergency.extension:phone.value[x]:valueString"
* extension[section][0].extension[field][4].valueString = "Basic.extension:emergency.extension:mobile.value[x]:valueString"
* extension[section][0].extension[field][5].valueString = "Basic.extension:emergency.extension:email.value[x]:valueString"
* extension[section][0].extension[field][6].valueString = "Basic.extension:emergency.extension:remark.value[x]:valueString"