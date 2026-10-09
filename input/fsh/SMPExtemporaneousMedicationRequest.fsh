Profile: SMPCompoundedMedicationRequest
Parent: $us-core-medicationrequest
Id: smp-compounded-medication-request
Title: "PACIO Compounded Preparation MedicationRequest"
Description: "A proposed profile for ordering an compoundedly prepared medication. It requires Medication.reference rather than medicationCodeableConcept so the formulation and ingredient details are exchangeable."

// Preserve the draft design identity and metadata from the source StructureDefinition.
// * ^url = "http://example.org/fhir/smp-compounded/StructureDefinition/smp-compounded-medication-request"
// * ^version = "0.1.0"
// * ^status = #draft
// * ^experimental = true
// * ^date = "2026-09-10"
// * ^publisher = "PACIO Project - proposed design (non-normative)"
// * ^fhirVersion = #4.0.1
// * ^abstract = false
// * ^jurisdiction = urn:iso:std:iso:3166#US "United States of America"

* extension contains SMPCompoundedPreparationReason named preparationReason 0..1 MS
* medication[x] 1..1 MS
* medication[x] only Reference(SMPCompoundedMedication)
* medication[x] ^short = "Reference to the ordered compounded formulation"
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
