Instance:       nam-hr-manager
InstanceOf:     IhrisRole
Title:          "Manager"
Usage:          #example
* extension[name].valueString = "Manager"
* extension[primary].valueBoolean = true
* extension[task][0].valueReference = Reference(Basic/ihris-task-read-questionnaire-resource)
* extension[task][1].valueReference = Reference(Basic/ihris-task-navigation-password)
* extension[task][2].valueReference = Reference(Basic/ihris-task-read-ihris-page-practitioner)
* extension[task][3].valueReference = Reference(Basic/ihris-task-read-ihris-page-practitioner-role)
* extension[task][4].valueReference = Reference(Basic/ihris-task-read-code-system)
* extension[task][5].valueReference = Reference(Basic/ihris-task-read-value-set)
* extension[task][6].valueReference = Reference(Basic/ihris-task-read-location-resource)
* extension[task][7].valueReference = Reference(Basic/ihris-task-read-practitioner-resource)
* extension[task][8].valueReference = Reference(Basic/ihris-task-read-practitioner-role-resource)
* extension[task][9].valueReference = Reference(Basic/ihris-task-read-questionnaire-response-resource)
* extension[task][10].valueReference = Reference(Basic/ihris-task-read-basic-resource)
* extension[task][11].valueReference = Reference(Basic/ihris-task-write-questionnaire-response-resource)
* extension[task][12].valueReference = Reference(Basic/ihris-task-write-practitioner-resource)
* extension[task][13].valueReference = Reference(Basic/ihris-task-write-practitioner-role-resource)
* extension[task][14].valueReference = Reference(Basic/ihris-task-all-permissions-to-everything)
* extension[role][0].valueReference = Reference(Basic/ihris-role-open)

Instance:       nam-hr-staff
InstanceOf:     IhrisRole
Title:          "Data Entrant"
Usage:          #example

* extension[name].valueString = "Data Entrant"
* extension[primary].valueBoolean = true
* extension[task][0].valueReference = Reference(Basic/ihris-task-read-questionnaire-resource)
* extension[task][1].valueReference = Reference(Basic/ihris-task-navigation-password)
* extension[task][2].valueReference = Reference(Basic/ihris-task-read-ihris-page-practitioner)
* extension[task][3].valueReference = Reference(Basic/ihris-task-read-ihris-page-practitioner-role)
* extension[task][4].valueReference = Reference(Basic/ihris-task-read-code-system)
* extension[task][5].valueReference = Reference(Basic/ihris-task-read-value-set)
* extension[task][6].valueReference = Reference(Basic/ihris-task-read-location-resource)
* extension[task][7].valueReference = Reference(Basic/ihris-task-read-practitioner-resource)
* extension[task][8].valueReference = Reference(Basic/ihris-task-read-practitioner-role-resource)
* extension[task][9].valueReference = Reference(Basic/ihris-task-read-questionnaire-response-resource)
* extension[task][10].valueReference = Reference(Basic/ihris-task-read-basic-resource)
* extension[task][11].valueReference = Reference(Basic/ihris-task-write-questionnaire-response-resource)
* extension[task][12].valueReference = Reference(Basic/ihris-task-write-practitioner-resource)
* extension[task][13].valueReference = Reference(Basic/ihris-task-write-practitioner-role-resource)
* extension[task][14].valueReference = Reference(Basic/ihris-task-all-permissions-to-everything)

Instance:       ihris-task-add-scanned-document
InstanceOf:     IhrisTask
Usage:          #example
Title:          "Add Scanned Document"
* code = IhrisResourceCodeSystem#task
* extension[name].valueString = "add-scanned-document"
* extension[attributes][0].extension[permission].valueCode = IhrisTaskPermissionCodeSystem#special
* extension[attributes][0].extension[resource].valueCode = IhrisTaskResourceCodeSystem#special
* extension[attributes][0].extension[instance].valueId = "add-scanned-document"

Instance:       ihris-task-view-scanned-document
InstanceOf:     IhrisTask
Usage:          #example
Title:          "View Scanned Document"
* code = IhrisResourceCodeSystem#task
* extension[name].valueString = "view-scanned-document"
* extension[attributes][0].extension[permission].valueCode = IhrisTaskPermissionCodeSystem#special
* extension[attributes][0].extension[resource].valueCode = IhrisTaskResourceCodeSystem#special
* extension[attributes][0].extension[instance].valueId = "view-scanned-document"

Instance:       ihris-task-edit-scanned-document
InstanceOf:     IhrisTask
Usage:          #example
Title:          "Edit Scanned Document"
* code = IhrisResourceCodeSystem#task
* extension[name].valueString = "edit-scanned-document"
* extension[attributes][0].extension[permission].valueCode = IhrisTaskPermissionCodeSystem#special
* extension[attributes][0].extension[resource].valueCode = IhrisTaskResourceCodeSystem#special
* extension[attributes][0].extension[instance].valueId = "edit-scanned-document"

Instance:       ihris-task-add-emergency
InstanceOf:     IhrisTask
Usage:          #example
Title:          "Add Emergency"
* code = IhrisResourceCodeSystem#task
* extension[name].valueString = "add-emergency"
* extension[attributes][0].extension[permission].valueCode = IhrisTaskPermissionCodeSystem#special
* extension[attributes][0].extension[resource].valueCode = IhrisTaskResourceCodeSystem#special
* extension[attributes][0].extension[instance].valueId = "add-emergency"

Instance:       ihris-task-edit-emergency
InstanceOf:     IhrisTask
Usage:          #example
Title:          "Edit Emergency"
* code = IhrisResourceCodeSystem#task
* extension[name].valueString = "edit-emergency"
* extension[attributes][0].extension[permission].valueCode = IhrisTaskPermissionCodeSystem#special
* extension[attributes][0].extension[resource].valueCode = IhrisTaskResourceCodeSystem#special
* extension[attributes][0].extension[instance].valueId = "edit-emergency"

Instance:       ihris-task-view-emergency
InstanceOf:     IhrisTask
Usage:          #example
Title:          "View Emergency"
* code = IhrisResourceCodeSystem#task
* extension[name].valueString = "view-emergency"
* extension[attributes][0].extension[permission].valueCode = IhrisTaskPermissionCodeSystem#special
* extension[attributes][0].extension[resource].valueCode = IhrisTaskResourceCodeSystem#special
* extension[attributes][0].extension[instance].valueId = "view-emergency"

Instance:       ihris-task-add-education-history
InstanceOf:     IhrisTask
Usage:          #example
Title:          "Add Education"
* code = IhrisResourceCodeSystem#task
* extension[name].valueString = "add-education-history"
* extension[attributes][0].extension[permission].valueCode = IhrisTaskPermissionCodeSystem#special
* extension[attributes][0].extension[resource].valueCode = IhrisTaskResourceCodeSystem#special
* extension[attributes][0].extension[instance].valueId = "add-education-history"

Instance:       ihris-task-edit-education-history
InstanceOf:     IhrisTask
Usage:          #example
Title:          "Edit Education History"
* code = IhrisResourceCodeSystem#task
* extension[name].valueString = "edit-education-history"
* extension[attributes][0].extension[permission].valueCode = IhrisTaskPermissionCodeSystem#special
* extension[attributes][0].extension[resource].valueCode = IhrisTaskResourceCodeSystem#special
* extension[attributes][0].extension[instance].valueId = "edit-education-history"

Instance:       ihris-task-view-education-history
InstanceOf:     IhrisTask
Usage:          #example
Title:          "View Education History"
* code = IhrisResourceCodeSystem#task
* extension[name].valueString = "view-education-history"
* extension[attributes][0].extension[permission].valueCode = IhrisTaskPermissionCodeSystem#special
* extension[attributes][0].extension[resource].valueCode = IhrisTaskResourceCodeSystem#special
* extension[attributes][0].extension[instance].valueId = "view-education-history"

Instance:       ihris-task-add-inservice-training
InstanceOf:     IhrisTask
Usage:          #example
Title:          "Add Education"
* code = IhrisResourceCodeSystem#task
* extension[name].valueString = "add-inservice-training"
* extension[attributes][0].extension[permission].valueCode = IhrisTaskPermissionCodeSystem#special
* extension[attributes][0].extension[resource].valueCode = IhrisTaskResourceCodeSystem#special
* extension[attributes][0].extension[instance].valueId = "add-inservice-training"

Instance:       ihris-task-edit-inservice-training
InstanceOf:     IhrisTask
Usage:          #example
Title:          "Edit Inservice Training"
* code = IhrisResourceCodeSystem#task
* extension[name].valueString = "edit-inservice-training"
* extension[attributes][0].extension[permission].valueCode = IhrisTaskPermissionCodeSystem#special
* extension[attributes][0].extension[resource].valueCode = IhrisTaskResourceCodeSystem#special
* extension[attributes][0].extension[instance].valueId = "edit-inservice-training"

Instance:       ihris-task-view-inservice-training
InstanceOf:     IhrisTask
Usage:          #example
Title:          "View Inservice Training"
* code = IhrisResourceCodeSystem#task
* extension[name].valueString = "view-inservice-training"
* extension[attributes][0].extension[permission].valueCode = IhrisTaskPermissionCodeSystem#special
* extension[attributes][0].extension[resource].valueCode = IhrisTaskResourceCodeSystem#special
* extension[attributes][0].extension[instance].valueId = "view-inservice-training"


Instance:       ihris-task-section-inservice-training
InstanceOf:     IhrisTask
Usage:          #example
Title:          "See Inservice Training Section"
* code = IhrisResourceCodeSystem#task
* extension[name].valueString = "inservice-training"
* extension[attributes][0].extension[permission].valueCode = IhrisTaskPermissionCodeSystem#special
* extension[attributes][0].extension[resource].valueCode = IhrisTaskResourceCodeSystem#section
* extension[attributes][0].extension[instance].valueId = "inservice-training"

Instance:       ihris-task-section-education-history
InstanceOf:     IhrisTask
Usage:          #example
Title:          "See Education History Section"
* code = IhrisResourceCodeSystem#task
* extension[name].valueString = "education-history"
* extension[attributes][0].extension[permission].valueCode = IhrisTaskPermissionCodeSystem#special
* extension[attributes][0].extension[resource].valueCode = IhrisTaskResourceCodeSystem#section
* extension[attributes][0].extension[instance].valueId = "education-history"

Instance:       ihris-task-section-emergency
InstanceOf:     IhrisTask
Usage:          #example
Title:          "See Emergency Section"
* code = IhrisResourceCodeSystem#task
* extension[name].valueString = "emergency"
* extension[attributes][0].extension[permission].valueCode = IhrisTaskPermissionCodeSystem#special
* extension[attributes][0].extension[resource].valueCode = IhrisTaskResourceCodeSystem#section
* extension[attributes][0].extension[instance].valueId = "emergency"

Instance:       ihris-task-section-banking
InstanceOf:     IhrisTask
Usage:          #example
Title:          "See Banking Section"
* code = IhrisResourceCodeSystem#task
* extension[name].valueString = "banking"
* extension[attributes][0].extension[permission].valueCode = IhrisTaskPermissionCodeSystem#special
* extension[attributes][0].extension[resource].valueCode = IhrisTaskResourceCodeSystem#section
* extension[attributes][0].extension[instance].valueId = "banking"

Instance:       ihris-task-section-scanned-document
InstanceOf:     IhrisTask
Usage:          #example
Title:          "See Scanned Document Section"
* code = IhrisResourceCodeSystem#task
* extension[name].valueString = "scanned-document"
* extension[attributes][0].extension[permission].valueCode = IhrisTaskPermissionCodeSystem#special
* extension[attributes][0].extension[resource].valueCode = IhrisTaskResourceCodeSystem#section
* extension[attributes][0].extension[instance].valueId = "scanned-document"

