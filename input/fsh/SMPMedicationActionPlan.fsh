Profile: SMPMedicationActionPlanBundle
Parent: Bundle
Id: smp-medication-action-plan-bundle
Title: "Standardized Medication Profile - Bundle Medication Action Plan"
Description: "A single package that contains a collection of medication action plans and supporting metadata on the medication reconciliaton review and recommended actions."

* type only code
* type = #document

// * extension contains 
//    medication-action-plan-category named SMPMedicationActionPlanCategory 0..1 MS

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
   patient 1..1 MS and
   smp-map-composition 1..1 MS

* entry[patient].resource 1..1 MS
* entry[patient].resource only $us-core-patient

* entry[smp-map-composition].resource only SMPMedicationActionPlanComposition


/* ****************************** */

Profile: SMPMedicationActionPlanComposition
Parent: Composition
Id: smp-map-composition
Title: "SMP Composition Medication Action Plan"
Description: "A composition resource that defines the metadata for a medication action plan document."

* type = $loinc#80797-4 "Pharmacology Plan of care note"
* author only Reference($us-core-practitioner or $us-core-practitionerrole)
* attester 1..* MS 
* attester.party only Reference($us-core-practitioner or $us-core-practitionerrole)
* attester.mode = #professional

* section ^slicing.discriminator.type = #pattern 
* section ^slicing.discriminator.path = "code"
* section ^slicing.rules = #open
* section ^slicing.ordered = false   // can be omitted, since false is the default
* section ^slicing.description = "Slice based on $this value"

* section 1..*
* section.text 1..1 MS
* section ^slicing.discriminator.type = #pattern 
* section ^slicing.discriminator.path = "code"
* section ^slicing.rules = #open
* section ^slicing.ordered = false   // can be omitted, since false is the default
* section ^slicing.description = "Slice based on $this value"
* section contains
    map-care-plan 1..* MS and
    map-document 0..* MS

* section[map-care-plan] ^short = "Medication Action Plan Care Plan Section"
* section[map-care-plan].code = $snomed#736378000 "Medication management plan (record artifact)"
* section[map-care-plan].entry only Reference(SMPMedicationActionPlan) // reference to one or more MAP care plans, each which identify detected issues and recommended actions.
* section[map-document] ^short = "Medication Action Plan Document Section"
* section[map-document].code = $loinc#80797-4 "Pharmacology Plan of care note" //  loinc document code
* section[map-document].entry only Reference(DocumentReference)  // The Medication Action Plan document as unstructured data (PDF, scanned image, etc.)  

/* ****************************** */

Profile:        SMPMedicationActionPlan
Parent:         $us-core-care-plan
Id:             smp-medication-action-plan
Title:          "Standardized Medication Profile - Medication Action Plan"
Description:    "A pharmacist-generated care plan that identifies issues and risks as well as recommended interventions and actions. These plans are normally created in response to a comprehensive medication review."

* category 1..* MS
  * ^short = "Medication Action Plan Category"
  * ^comment = "Category for Medication Action Plan as defined by SMP Implementation Guide"

* category ^slicing.discriminator.type = #value
* category ^slicing.discriminator.path = "$this"
* category ^slicing.rules = #open
* category ^slicing.description = "Slice based on the category CodeableConcept pattern"

* category contains
    MedActPlanCategory 1..1 MS

* category[MedActPlanCategory] = $snomed#736378000 "Medication management plan (record artifact)"

* intent = #plan
* subject only Reference($us-core-patient)
* author only Reference($us-core-practitioner or $us-core-practitionerrole)

* supportingInfo 1..* MS
* supportingInfo only Reference(SMPMedicationActionPlanDetectedIssue)


/* ****************************** */

Profile:        SMPMedicationActionPlanDetectedIssue
Parent:         DetectedIssue
Id:             smp-medication-action-plan-detected-issue
Title:          "Standardized Medication Profile - Medication Action Plan Detected Issue"
Description:    "An issues or risk related to a given medication, therapy, or regimen. May include interventions and actions that mitigate the issue."

* author only Reference($us-core-practitioner or $us-core-practitionerrole)
* code 0..1 MS
  * ^short = "Detected Issue Code"
  * ^comment = "Code representing the detected issue or risk."
* detail 0..1 MS
  * ^short = "Detected Issue Detail"
  * ^comment = "Additional information about the detected issue or risk as a string. To be used when a code is not available or sufficient."
* implicated only Reference(MedicationStatement)

/* ****************************** */