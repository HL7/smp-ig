Profile: SMPCompoundedMedicationDispense
Parent: $us-core-medicationdispense
Id: smp-compounded-medication-dispense
Title: "PACIO Compounded Preparation MedicationDispense"
Description: "A proposed profile for the preparation and dispensing event for an compounded medication, including the prepared product reference, performer, preparation timestamp, and dispensed quantity."

// Preserve the draft design identity and metadata from the source StructureDefinition.
// * ^url = "http://example.org/fhir/smp-compounded/StructureDefinition/smp-compounded-medication-dispense"
// * ^version = "0.1.0"
// * ^status = #draft
// * ^experimental = true
// * ^date = "2026-09-10"
// * ^publisher = "PACIO Project - proposed design (non-normative)"
// * ^fhirVersion = #4.0.1
// * ^abstract = false
// * ^jurisdiction = urn:iso:std:iso:3166#US "United States of America"

* medication[x] 1..1 MS
* medication[x] only Reference(SMPCompoundedMedication)
* medication[x] ^short = "Reference to the prepared compounded medication"
* subject MS
* performer MS
* performer ^short = "Compounder and/or dispenser participation"
* performer.function MS
* performer.function ^short = "Role performed, e.g., compounding or dispensing"
* performer.actor MS
* location MS
* authorizingPrescription MS
* authorizingPrescription only Reference(SMPCompoundedMedicationRequest)
* authorizingPrescription ^short = "Order authorizing preparation/dispense"
* quantity MS
* quantity ^short = "Final amount dispensed"
* whenPrepared MS
* whenPrepared ^short = "When the product was prepared/packaged and reviewed"
* whenHandedOver MS
* dosageInstruction MS
