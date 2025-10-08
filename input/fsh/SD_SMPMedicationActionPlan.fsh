Profile:        SMPMedicationActionPlan
Parent:         $us-core-careplan
Id:             smp-map
Title:          "Standardized Medication Profile - Medication Action Plan"
Description:    "A recommended care plan generated from a medication reconciliation event. It may contain specific triggers about a prescribed medication, risks, recommended interventions, and actions taken. It is important to note that the care plan are recommendations and not specific orders. They most commonly result from pharmacist review and recommendations and sent to a provider to evaluate and decide on subsequent actions."

* subject 1..1 MS

* category ^slicing.discriminator.type = #value
* category ^slicing.discriminator.path = "$this"
* category ^slicing.rules = #open
* category ^slicing.ordered = false   // can be omitted, since false is the default
* category ^slicing.description = "Slice based on $this value"
* category contains
    medication_action_plan 1..1 MS
* category[medication_action_plan] = $snomed#736378000 "Medication management plan" // must contain at least the MAP category code
* created 1..1 MS


Profile:        SMPMedicationActionPlanDetectedIssue
Parent:         DetectedIssue
Id:             smp-map-detectedissue
Title:          "Standardized Medication Profile - Medication Action Plan Detected Issue"
Description:    "An identified issue that was related to the medication reconciliation of a given medication or therapy. It may reference triggers such as allergies or adverse events, and conditions."

* patient 1..1 MS
* code from http://terminology.hl7.org/CodeSystem/v3-ActCode (extensible)
* author 1..1 MS
* severity 0..1 MS
* implicated 0..1 MS
* detail 0..1 MS