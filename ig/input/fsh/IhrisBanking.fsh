Profile:        IhrisBasicBanking
Parent:         IhrisPractitionerBasic
Id:             ihris-basic-banking
Title:          "Banking Information"
Description:    "iHRIS Profile of the Basic resource for Banking."
* extension[practitioner].valueReference 1..1 MS
* extension[practitioner].valueReference ^label = "Health Worker"
* extension contains
    IhrisBanking named banking 1..1 MS
* extension[banking] ^label = "Banking Information"
* extension[banking].extension[accountName].valueString 1..1 MS
* extension[banking].extension[accountNumber].valueString 1..1 MS
* extension[banking].extension[accountType].valueCoding 1..1 MS
* extension[banking].extension[bankName].valueString 1..1 MS
* extension[banking].extension[bankBranch].valueString 0..1 MS
    
Extension:      IhrisBanking
Id:             ihris-banking
Title:          "Banking details"
* extension contains accountName 1..1 MS and
    accountNumber 1..1 MS and
    accountType 0..1 MS and
    bankName 1..1 MS and
    bankBranch 0..1 MS
* extension[accountName].value[x] only string
* extension[accountName].valueString 1..1 MS
* extension[accountName].valueString ^label = "Account Name"
* extension[accountNumber].value[x] only string
* extension[accountNumber].valueString 1..1 MS
* extension[accountNumber].valueString ^label = "Account Number"
* extension[accountType].value[x] only Coding
* extension[accountType].valueCoding 1..1 MS
* extension[accountType].valueCoding ^label = "Account Type"
* extension[accountType].valueCoding from IhrisBankAccountTypeValueSet (required)
* extension[bankName].value[x] only string
* extension[bankName].valueString 1..1 MS
* extension[bankName].valueString ^label = "Bank Name"
* extension[bankBranch].value[x] only string
* extension[bankBranch].valueString MS
* extension[bankBranch].valueString ^label = "Bank Branch"

CodeSystem:      IhrisBankAccountTypeCodesystem
Id:              ihris-bank-account-type-codesystem
Title:           "Bank Account Types"
* ^date = "2020-11-10T08:41:04.362Z"
* ^version = "0.3.0"
* #current "Current Account"
* #savings "Savings Account"

ValueSet:         IhrisBankAccountTypeValueSet
Id:               ihris-bank-account-type-valueset
Title:            "iHRIS Bank Account ValueSet"
* ^date = "2020-11-10T08:41:04.362Z"
* ^version = "0.3.0"
* codes from system IhrisBankAccountTypeCodesystem

Instance:       IhrisPractitionerWorkflowBanking
InstanceOf:     IhrisQuestionnaire
Usage:          #definition
* title = "iHRIS Banking Workflow"
* description = "iHRIS workflow to record a Banking"
* id = "ihris-banking"
* url = "http://ihris.org/fhir/Questionnaire/ihris-banking"
* name = "ihris-banking"
* status = #active
* date = 2020-09-02
* purpose = "Workflow page for recording a Banking information."

* item[0].linkId = "Basic"
* item[0].text = "Banking"
* item[0].definition = "http://ihris.org/fhir/StructureDefinition/ihris-basic-banking"
* item[0].type = #group

* item[0].item[0].linkId = "Basic.extension[0]"
* item[0].item[0].definition = "http://ihris.org/fhir/StructureDefinition/ihris-basic-banking#Basic.extension:banking"
* item[0].item[0].text = "Details"
* item[0].item[0].type = #group

* item[0].item[0].item[0].linkId = "Basic.extension[0].extension[0]"
* item[0].item[0].item[0].definition = "http://ihris.org/fhir/StructureDefinition/ihris-basic-banking#Basic.extension:banking.extension:accountName.value[x]:valueString"
* item[0].item[0].item[0].text = "Account Name"
* item[0].item[0].item[0].type = #string
* item[0].item[0].item[0].required = true
* item[0].item[0].item[0].repeats = false

* item[0].item[0].item[1].linkId = "Basic.extension[0].extension[1]"
* item[0].item[0].item[1].definition = "http://ihris.org/fhir/StructureDefinition/ihris-basic-banking#Basic.extension:banking.extension:accountNumber.value[x]:valueString"
* item[0].item[0].item[1].text = "Account Number"
* item[0].item[0].item[1].type = #string
* item[0].item[0].item[1].required = true
* item[0].item[0].item[1].repeats = false

* item[0].item[0].item[2].linkId = "Basic.extension[0].extension[2]"
* item[0].item[0].item[2].definition = "http://ihris.org/fhir/StructureDefinition/ihris-basic-banking#Basic.extension:banking.extension:accountType.value[x]:valueCoding"
* item[0].item[0].item[2].text = "Account Type"
* item[0].item[0].item[2].type = #choice
* item[0].item[0].item[2].answerValueSet = "http://ihris.org/fhir/ValueSet/ihris-bank-account-type-valueset"
* item[0].item[0].item[2].required = false
* item[0].item[0].item[2].repeats = false

* item[0].item[0].item[3].linkId = "Basic.extension[0].extension[3]"
* item[0].item[0].item[3].definition = "http://ihris.org/fhir/StructureDefinition/ihris-basic-banking#Basic.extension:banking.extension:bankName.value[x]:valueString"
* item[0].item[0].item[3].text = "Bank Name"
* item[0].item[0].item[3].type = #string
* item[0].item[0].item[3].required = true
* item[0].item[0].item[3].repeats = false

* item[0].item[0].item[4].linkId = "Basic.extension[0].extension[4]"
* item[0].item[0].item[4].definition = "http://ihris.org/fhir/StructureDefinition/ihris-basic-banking#Basic.extension:banking.extension:bankBranch.value[x]:valueString"
* item[0].item[0].item[4].text = "Bank Branch"
* item[0].item[0].item[4].type = #string
* item[0].item[0].item[4].required = true
* item[0].item[0].item[4].repeats = false

Instance:       ihris-page-banking
InstanceOf:     IhrisPage
Title:          "iHRIS Basic Banking Page"
Usage:          #example
* code = IhrisResourceCodeSystem#page
* extension[display].extension[resource].valueReference = Reference(StructureDefinition/ihris-basic-banking)
* extension[display].extension[link][0].extension[url].valueUrl = "/resource/view/banking/FIELD?edit=true"
* extension[display].extension[link][0].extension[field].valueString = "Basic.id"
* extension[display].extension[link][0].extension[text].valueString = "Edit"
* extension[display].extension[link][0].extension[button].valueBoolean = true
* extension[display].extension[link][0].extension[icon].valueString = "mdi-pencil"
* extension[display].extension[link][0].extension[class].valueString = "secondary"
* extension[display].extension[link][1].extension[field].valueString = "Basic.extension.where(url='http://ihris.org/fhir/StructureDefinition/ihris-practitioner-reference').valueReference.reference"
* extension[display].extension[link][1].extension[text].valueString = "View Health Worker"
* extension[display].extension[link][1].extension[button].valueBoolean = true
* extension[display].extension[link][1].extension[icon].valueString = "mdi-account-arrow-right"
* extension[display].extension[link][1].extension[url].valueUrl = "/resource/view/practitioner/FIELD"
* extension[display].extension[search][0].valueString = "Account Type|extension.where(url='http://ihris.org/fhir/StructureDefinition/ihris-banking').extension.where(url='accountType').valueCoding"
* extension[display].extension[field][0].extension[path].valueString = "Basic.extension:practitioner.value[x]:valueReference"
* extension[display].extension[field][0].extension[readOnlyIfSet].valueBoolean = true
* extension[section][0].extension[title].valueString = "Employee Banking"
* extension[section][0].extension[description].valueString = "Employee Banking details"
* extension[section][0].extension[name].valueString = "Basic"
* extension[section][0].extension[field][0].valueString = "Basic.extension:practitioner"
* extension[section][0].extension[field][1].valueString = "Basic.extension:banking.extension:accountName.value[x]:valueString"
* extension[section][0].extension[field][2].valueString = "Basic.extension:banking.extension:accountNumber.value[x]:valueString"
* extension[section][0].extension[field][3].valueString = "Basic.extension:banking.extension:accountType.value[x]:valueCoding"
* extension[section][0].extension[field][4].valueString = "Basic.extension:banking.extension:bankName.value[x]:valueString"
* extension[section][0].extension[field][5].valueString = "Basic.extension:banking.extension:bankBranch.value[x]:valueString"

Instance:       ihris-page-account-type
InstanceOf:     IhrisPage
Title:          "iHRIS Banking Account Type CodeSystem Page"
Usage:          #example
* code = IhrisResourceCodeSystem#page
* extension[display].extension[resource].valueReference = Reference(CodeSystem/ihris-bank-account-type-codesystem)
* extension[display].extension[search][0].valueString = "Code|code"
* extension[display].extension[search][1].valueString = "Display|display"
* extension[display].extension[field][0].extension[path].valueString = "CodeSystem.code"
* extension[display].extension[field][0].extension[readOnlyIfSet].valueBoolean = true
* extension[section][0].extension[title].valueString = "Banking Account Type"
* extension[section][0].extension[description].valueString = "Banking Account Type"
* extension[section][0].extension[name].valueString = "CodeSystem"
* extension[section][0].extension[field][0].valueString = "CodeSystem.display"
* extension[section][0].extension[field][1].valueString = "CodeSystem.code"
* extension[section][0].extension[field][2].valueString = "CodeSystem.definition"