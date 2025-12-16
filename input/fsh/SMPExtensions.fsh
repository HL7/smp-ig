Extension: SMPMedicationActionPlanCategory
Id: smp-medication-action-plan-category
Title: "Medication Action Plan Category"
Description: "The category of the medication action plan."
Context: Bundle
* value[x] only CodeableConcept
* valueCodeableConcept 1..1 MS
* value[x] = $snomed#736379008 "Medication management plan (record artifact)"