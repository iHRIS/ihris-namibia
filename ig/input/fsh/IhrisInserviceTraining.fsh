Profile:        IhrisTraining
Parent:         Basic
Id:             ihris-training
Title:          "Training"
Description:    "iHRIS Profile of the Basic resource to training."
* code = IhrisResourceCodeSystem#resourcedata
* extension contains
    IhrisBasicName named name 1..1 MS and
    IhrisTrainingClassification named classification 0..1 MS and
    IhrisTrainingCategory named category 0..1 MS
* extension[name].valueString 1..1 MS
* extension[name] ^label = "Training name"
* extension[classification].valueReference 0..1 MS
* extension[classification] ^label = "Training"
* extension[category].valueCoding 0..1 MS
* extension[category] ^label = "Training Category"

Extension:      IhrisTrainingClassification
Id:             ihris-training-classification
Title:          "Training Classification"
* ^context.type = #element
* ^context.expression = "Basic"
* value[x] only Reference
* valueReference 0..1 MS
* valueReference ^label = "Training"
* valueReference only Reference(IhrisTraining)

Extension:     IhrisTrainingCategory
Id:            ihris-training-category
Title:         "Training Category"
* ^context.type = #element
* ^context.expression = "Basic"
* value[x] only Coding
* valueCoding 0..1 MS
* valueCoding ^label = "Training Category"
* valueCoding from IhrisTrainingValueSet

Instance: trainingByCategory-search
InstanceOf: SearchParameter
Usage: #definition
* url = "http://ihris.org/fhir/SearchParameter/trainingByCategory-search"
* name = "Search Parameter for a manage training By Category"
* status = #active
* description = "Search for manage training By Category"
* code = #trainingByCategory
* base = #Basic
* type = #token
* expression = "Basic.extension.where(url = 'http://ihris.org/fhir/StructureDefinition/ihris-training-category')"
* xpath = "f:Basic/f:extension[@url='http://ihris.org/fhir/StructureDefinition/ihris-training-category']"
* xpathUsage = #normal

Instance:       ihris-page-training
InstanceOf:     IhrisPage
Title:          "iHRIS Training Page"
Usage:          #example
* code = IhrisResourceCodeSystem#page
* extension[display].extension[resource].valueReference = Reference(StructureDefinition/ihris-training)
* extension[display].extension[link][0].extension[url].valueUrl = "/resource/view/training/FIELD?edit=true"
* extension[display].extension[link][0].extension[text].valueString = "Edit"
* extension[display].extension[link][0].extension[field].valueString = "Basic.id"
* extension[display].extension[link][0].extension[button].valueBoolean = true
* extension[display].extension[link][0].extension[icon].valueString = "mdi-pencil"
* extension[display].extension[link][0].extension[class].valueString = "secondary"
* extension[display].extension[link][1].extension[url].valueUrl = "/questionnaire/ihris-training/training"
* extension[display].extension[link][1].extension[icon].valueString = "mdi-plus-circle-outline"
* extension[display].extension[link][1].extension[text].valueString = "Add Another"
* extension[display].extension[link][1].extension[button].valueBoolean = true
* extension[display].extension[link][1].extension[class].valueString = "secondary"
* extension[display].extension[add].extension[url].valueUrl = "/questionnaire/ihris-training/training"
* extension[display].extension[add].extension[icon].valueString = "mdi-account-plus"
* extension[display].extension[add].extension[class].valueString = "accent"
* extension[display].extension[search][0].valueString = "Training Title|Basic.extension.where(url='http://ihris.org/fhir/StructureDefinition/ihris-basic-name').valueString"
* extension[display].extension[search][1].valueString = "Part Of|Basic.extension.where(url = 'http://ihris.org/fhir/StructureDefinition/ihris-training-classification').valueReference"
* extension[display].extension[search][2].valueString = "Category|Basic.extension.where(url = 'http://ihris.org/fhir/StructureDefinition/ihris-training-category').valueCoding.display"
* extension[display].extension[filter][0].valueString = "Training Title|name:contains"
* extension[display].extension[filter][1].valueString = "Catergory|trainingByCategory|http://ihris.org/fhir/ValueSet/ihris-training-valueset"
* extension[section][0].extension[title].valueString = "Training"
* extension[section][0].extension[description].valueString = "Training"
* extension[section][0].extension[name].valueString = "Basic"
* extension[section][0].extension[field][0].valueString = "Basic.extension:name"
* extension[section][0].extension[field][1].valueString = "Basic.extension:classification"
* extension[section][0].extension[field][2].valueString = "Basic.extension:category"

Instance:       IhrisTrainingWorkflow
InstanceOf:     IhrisQuestionnaire
Usage:          #definition
* title = "iHRIS Manage Position Workflow"
* description = "iHRIS workflow to manage Position"
* id = "ihris-training"
* url = "http://ihris.org/fhir/Questionnaire/ihris-training"
* name = "ihris-training"
* status = #active
* date = 2022-08-23
* purpose = "Workflow page for recording a training."

* item[0].linkId = "Basic"
* item[0].definition = "http://ihris.org/fhir/StructureDefinition/ihris-training"
* item[0].text = "Add Training"
* item[0].type = #group

* item[0].item[0].linkId = "Basic.extension[0]"
* item[0].item[0].definition = "http://ihris.org/fhir/StructureDefinition/ihris-training#Basic.extension:name.value[x]:valueString"
* item[0].item[0].text = "Training Title"
* item[0].item[0].type = #string
* item[0].item[0].required = true
* item[0].item[0].repeats = false

* item[0].item[1].linkId = "Basic.extension[1]"
* item[0].item[1].definition = "http://ihris.org/fhir/StructureDefinition/ihris-training#Basic.extension:category.value[x]:valueCoding"
* item[0].item[1].text = "Category"
* item[0].item[1].type = #choice
* item[0].item[1].answerValueSet = "http://ihris.org/fhir/ValueSet/ihris-training-valueset"
* item[0].item[1].required = false
* item[0].item[1].repeats = false

* item[0].item[2].linkId = "Basic.extension[2]#tree"
* item[0].item[2].definition = "http://ihris.org/fhir/StructureDefinition/ihris-training#Basic.extension:classification.value[x]:valueReference"
* item[0].item[2].text = "Classification"
* item[0].item[2].type = #reference
* item[0].item[2].required = false
* item[0].item[2].repeats = false


Profile:        IhrisBasicInServiceTraining
Parent:         IhrisPractitionerBasic
Id:             ihris-basic-inservice-training
Title:          "iHRIS In-Service Training"
Description:    "iHRIS Profile of the Basic resource for a Training."
* extension[practitioner].valueReference 1..1 MS
* extension[practitioner].valueReference ^label = "Health Worker"
* extension contains
    IhrisInServiceTraining named inservicetraining 0..1 MS
* extension[inservicetraining].extension[provider] ^label = "Training Organization" 
* extension[inservicetraining].extension[provider].valueString 0..1 MS
* extension[inservicetraining].extension[provider].valueString ^label = "Training Organization" 
* extension[inservicetraining].extension[training] ^label = "Training Type"
* extension[inservicetraining].extension[training].valueReference 0..1 MS
* extension[inservicetraining].extension[training].valueReference ^label = "Training"
* extension[inservicetraining].extension[courseName] ^label = "Training Course Name"
* extension[inservicetraining].extension[courseName].valueString 1..1 MS
* extension[inservicetraining].extension[courseName].valueString ^label = "Training Course Name"
* extension[inservicetraining].extension[startDate] ^label = "Start Date"
* extension[inservicetraining].extension[startDate].valueDate 1..1 MS
* extension[inservicetraining].extension[startDate].valueDate ^label = "Start Date"
* extension[inservicetraining].extension[endDate] ^label = "End Date"
* extension[inservicetraining].extension[endDate].valueDate 0..1 MS
* extension[inservicetraining].extension[endDate].valueDate ^label = "End Date"


Extension:      IhrisInServiceTraining
Id:             ihris-inservice-training
Title:          "Training details"
* extension contains
   provider 0..1 MS and
   training 0..1 MS and
   courseName 0..1 MS and
   startDate 0..1 MS and
   endDate 0..1 MS 
* extension[provider].value[x] only string
* extension[provider].valueString 0..1 MS
* extension[provider].valueString ^label = "Training Organization" 
* extension[training].value[x] only Reference
* extension[training].valueReference 0..1 MS
* extension[training].valueReference only Reference(IhrisTraining)
* extension[training].valueReference ^label = "Training"
* extension[courseName].value[x] only string
* extension[courseName].valueString 0..1 MS
* extension[courseName].valueString ^label = "Training Course Name"
* extension[startDate].value[x] only date
* extension[startDate].valueDate 0..1 MS
* extension[startDate].valueDate ^label = "Start Date"
* extension[endDate].value[x] only date
* extension[endDate].valueDate 0..1 MS
* extension[endDate].valueDate ^label = "End Date" 


Instance:       ihris-page-inservice-training
InstanceOf:     IhrisPage
Title:          "iHRIS Basic In-Service Training Page"
Usage:          #example
* code = IhrisResourceCodeSystem#page
* extension[display].extension[resource].valueReference = Reference(StructureDefinition/ihris-basic-inservice-training)
* extension[display].extension[link][0].extension[field].valueString = "Basic.extension.where(url='http://ihris.org/fhir/StructureDefinition/ihris-practitioner-reference').valueReference.reference"
* extension[display].extension[link][0].extension[text].valueString = "View Health Worker"
* extension[display].extension[link][0].extension[button].valueBoolean = true
* extension[display].extension[link][0].extension[icon].valueString = "mdi-account-arrow-right"
* extension[display].extension[link][0].extension[url].valueUrl = "/resource/view/practitioner/FIELD"
* extension[display].extension[search][0].valueString = "Organization|extension.where(url='http://ihris.org/fhir/StructureDefinition/ihris-inservice-training').extension.where(url='provider').valueString"
* extension[display].extension[search][1].valueString = "Training|extension.where(url='http://ihris.org/fhir/StructureDefinition/ihris-inservice-training').extension.where(url='training').valueReference.reference"
* extension[display].extension[search][2].valueString = "Course Name|extension.where(url='http://ihris.org/fhir/StructureDefinition/ihris-inservice-training').extension.where(url='courseName').valueString"
* extension[display].extension[search][3].valueString = "Practitioner|extension.where(url='http://ihris.org/fhir/StructureDefinition/ihris-practitioner-reference').valueReference.reference"
* extension[display].extension[search][4].valueString = "Start Date|extension.where(url='http://ihris.org/fhir/StructureDefinition/ihris-inservice-training').extension.where(url='startDate').valueDate"
* extension[display].extension[search][5].valueString = "End Date|extension.where(url='http://ihris.org/fhir/StructureDefinition/ihris-inservice-training').extension.where(url='endDate').valueDate"
* extension[display].extension[field][0].extension[path].valueString = "Basic.extension:training.value[x]:valueReference"
* extension[display].extension[field][0].extension[readOnlyIfSet].valueBoolean = true
* extension[section][0].extension[title].valueString = "Training"
* extension[section][0].extension[description].valueString = "Training details"
* extension[section][0].extension[name].valueString = "Basic"
* extension[section][0].extension[field][0].valueString = "Basic.extension:practitioner"
* extension[section][0].extension[field][1].valueString = "Basic.extension:inservicetraining.extension:provider.value[x]:valueString"
* extension[section][0].extension[field][2].valueString = "Basic.extension:inservicetraining.extension:training.value[x]:valueReference"
* extension[section][0].extension[field][3].valueString = "Basic.extension:inservicetraining.extension:courseName.value[x]:valueString"
* extension[section][0].extension[field][4].valueString = "Basic.extension:inservicetraining.extension:startDate.value[x]:valueDate"
* extension[section][0].extension[field][5].valueString = "Basic.extension:inservicetraining.extension:endDate.value[x]:valueDate"

Instance:       ihris-page-trainingtype
InstanceOf:     IhrisPage
Title:          "iHRIS Training CodeSystem Page"
Usage:          #example
* code = IhrisResourceCodeSystem#page
* extension[display].extension[resource].valueReference = Reference(CodeSystem/ihris-training-codesystem)
* extension[display].extension[search][0].valueString = "Code|code"
* extension[display].extension[search][1].valueString = "Display|display"
* extension[section][0].extension[title].valueString = "In-Service Training Type"
* extension[section][0].extension[description].valueString = "In-Service Training"
* extension[section][0].extension[name].valueString = "CodeSystem"
* extension[section][0].extension[field][0].valueString = "CodeSystem.display"
* extension[section][0].extension[field][1].valueString = "CodeSystem.code"
* extension[section][0].extension[field][2].valueString = "CodeSystem.definition"

CodeSystem:      IhrisTrainingCodeSystem
Id:              ihris-training-codesystem
Title:           "In-Service Training"
* ^date = "2023-10-29T08:41:04.362Z"
* ^version = "0.5.0"
* #TB "TB"
* #HIV "HIV"
* #Nutrition "Nutrition"
* #Malaria "Malaria"

ValueSet:         IhrisTrainingValueSet
Id:               ihris-training-valueset
Title:            "iHRIS In-Service Training ValueSet"
* ^date = "2023-10-29T08:41:04.362Z"
* ^version = "0.5.0"
* codes from system IhrisTrainingCodeSystem

Instance:       IhrisPractitionerWorkflowInServiceTraining
InstanceOf:     Questionnaire
Usage:          #definition
* title = "iHRIS In-Service Training Workflow"
* description = "iHRIS workflow to record a Training"
* id = "ihris-inservice-training"
* url = "http://ihris.org/fhir/Questionnaire/ihris-inservice-training"
* name = "ihris-inservice-training"
* status = #active
* date = 2020-08-27
* purpose = "Workflow page for recording a Training Information."

* item[0].linkId = "Basic"
* item[0].definition = "http://ihris.org/fhir/StructureDefinition/ihris-basic-inservice-training#Basic.id"
* item[0].text = "Training Information"
* item[0].type = #group

* item[0].item[0].linkId = "Basic.extension[0]"
* item[0].item[0].definition = "http://ihris.org/fhir/StructureDefinition/ihris-basic-inservice-training#Basic.id"
* item[0].item[0].text = "Training Information"
* item[0].item[0].type = #group

* item[0].item[0].item[0].linkId = "Basic.extension[0].extension[0]"
* item[0].item[0].item[0].definition = "http://ihris.org/fhir/StructureDefinition/ihris-basic-inservice-training#Basic.extension:inservicetraining.extension:provider.value[x]:valueString"
* item[0].item[0].item[0].text = "Training Organization"
* item[0].item[0].item[0].type = #string
* item[0].item[0].item[0].required = true
* item[0].item[0].item[0].repeats = false

* item[0].item[0].item[1].linkId = "Basic.extension[0].extension[1]#tree"
* item[0].item[0].item[1].definition = "http://ihris.org/fhir/StructureDefinition/ihris-basic-inservice-training#Basic.extension:inservicetraining.extension:training.value[x]:valueReference"
* item[0].item[0].item[1].text = "Training"
* item[0].item[0].item[1].type = #reference
* item[0].item[0].item[1].required = true
* item[0].item[0].item[1].repeats = false

* item[0].item[0].item[2].linkId = "Basic.extension[0].extension[2]"
* item[0].item[0].item[2].definition = "http://ihris.org/fhir/StructureDefinition/ihris-basic-inservice-training#Basic.extension:inservicetraining.extension:courseName.value[x]:valueString"
* item[0].item[0].item[2].text = "Training Course Name"
* item[0].item[0].item[2].type = #string
* item[0].item[0].item[2].required = true
* item[0].item[0].item[2].repeats = false

* item[0].item[0].item[3].linkId = "Basic.extension[0].extension[3]"
* item[0].item[0].item[3].definition = "http://ihris.org/fhir/StructureDefinition/ihris-basic-inservice-training#Basic.extension:inservicetraining.extension:startDate.value[x]:valueDate"
* item[0].item[0].item[3].text = "Start Date"
* item[0].item[0].item[3].type = #date
* item[0].item[0].item[3].required = true
* item[0].item[0].item[3].repeats = false

* item[0].item[0].item[4].linkId = "Basic.extension[0].extension[4]"
* item[0].item[0].item[4].definition = "http://ihris.org/fhir/StructureDefinition/ihris-basic-inservice-training#Basic.extension:inservicetraining.extension:endDate.value[x]:valueDate"
* item[0].item[0].item[4].text = "End Date"
* item[0].item[0].item[4].type = #date
* item[0].item[0].item[4].required = true
* item[0].item[0].item[4].repeats = false
