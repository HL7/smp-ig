Profile: SMPExtemporaneousMedicationStatement
Parent: $smp-medicationstatement
Id: smp-extemporaneous-medication-statement
Title: "PACIO Extemporaneous Preparation MedicationStatement"
Description: "A proposed specialization of the SMP MedicationStatement for representing a patient-reported, reconciled, or otherwise asserted current/past extemporaneous medication on a PACIO medication list."

// Preserve the draft design identity and metadata from the source StructureDefinition.
// * ^url = "http://example.org/fhir/smp-extemporaneous/StructureDefinition/smp-extemporaneous-medication-statement"
// * ^version = "0.1.0"
// * ^status = #draft
// * ^experimental = true
// * ^date = "2026-09-10"
// * ^publisher = "PACIO Project - proposed design (non-normative)"
// * ^fhirVersion = #4.0.1
// * ^abstract = false
// * ^jurisdiction = urn:iso:std:iso:3166#US "United States of America"

* basedOn MS
* basedOn only Reference(SMPExtemporaneousMedicationRequest)
* basedOn ^short = "Extemporaneous medication order when known"
* medication[x] 1..1 MS
* medication[x] only Reference(SMPExtemporaneousMedication)
* medication[x] ^short = "Reference to the extemporaneous medication"
* subject MS
* effective[x] MS
* dateAsserted MS
* informationSource MS
* dosage MS
