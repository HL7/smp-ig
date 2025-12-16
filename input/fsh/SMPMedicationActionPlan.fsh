Profile: SMPMedicationActionPlanBundle
Parent: Bundle
Id: smp-medication-action-plan-bundle
Title: "Standardized Medication Profile - Bundle Medication Action Plan"
Description: "A single package that contains a collection of medication action plans and supporting metadata on the medication reconciliaton review and recommended actions."

* type only code
* type = #document

* entry 1..* MS
* entry ^comment = "The result bundle may contain one or more entries."
* entry ^slicing.discriminator.type = #type
* entry ^slicing.discriminator.path = "resource"
* entry ^slicing.rules = #open
* entry.search 0..0
* entry.search ^mustSupport = false
* entry.request 0..0
* entry.request ^mustSupport = false
* entry.response 0..0
* entry.response ^mustSupport = false
* entry contains
   patient 0..1 MS and
   medicationactionplan 1..* MS and 
   medicationactionplan-document 0..* MS
* entry[patient].resource 1..1 MS
* entry[patient].resource only $us-core-patient
* entry[medicationactionplan].resource only SMPMedicationActionPlan
* entry[medicationactionplan-document].resource only DocumentReference

Profile:        SMPMedicationActionPlan
Parent:         $us-core-care-plan
Id:             smp-medication-action-plan
Title:          "Standardized Medication Profile - Medication Action Plan"
Description:    "A pharmacist-generated care plan that identifies issues and risks as well as recommended interventions and actions. These plans are normally created in response to a comprehensive medication review."

* category 1..1 MS
  * ^short = "Medication Action Plan Category"
  * ^comment = "Category for Medication Action Plan as defined by SMP Implementation Guide"
* category = $snomed#736379008 "Medication management plan (record artifact)"

* supportingInfo 0..* MS
* supportingInfo only Reference(DetectedIssue or DocumentReference or Observation)

