Profile: SMPExtemporaneousMedicationRequest
Parent: $us-core-medicationrequest
Id: smp-extemporaneous-medication-request
Title: "PACIO Extemporaneous Preparation MedicationRequest"
Description: "A proposed profile for ordering an extemporaneously prepared medication. It requires Medication.reference rather than medicationCodeableConcept so the formulation and ingredient details are exchangeable."

// Preserve the draft design identity and metadata from the source StructureDefinition.
// * ^url = "http://example.org/fhir/smp-extemporaneous/StructureDefinition/smp-extemporaneous-medication-request"
// * ^version = "0.1.0"
// * ^status = #draft
// * ^experimental = true
// * ^date = "2026-09-10"
// * ^publisher = "PACIO Project - proposed design (non-normative)"
// * ^fhirVersion = #4.0.1
// * ^abstract = false
// * ^jurisdiction = urn:iso:std:iso:3166#US "United States of America"

* extension contains SMPExtemporaneousPreparationReason named preparationReason 0..1 MS
* medication[x] 1..1 MS
* medication[x] only Reference(SMPExtemporaneousMedication)
* medication[x] ^short = "Reference to the ordered extemporaneous formulation"
* subject MS
* authoredOn MS
* requester MS
* dosageInstruction MS
* dosageInstruction ^short = "Dose, route, frequency, timing, and patient instructions"
* dispenseRequest MS
* dispenseRequest.quantity MS
* dispenseRequest.quantity ^short = "Quantity intended for one dispense/fill"
* dispenseRequest.expectedSupplyDuration MS
* dispenseRequest.performer MS
* dispenseRequest.performer ^short = "Intended dispensing/compounding organization when known"
