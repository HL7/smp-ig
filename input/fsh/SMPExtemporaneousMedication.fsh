Profile: SMPCompoundedMedication
Parent: $smp-medication
Id: smp-compounded-medication
Title: "PACIO Compounded Preparation Medication"
Description: "A proposed PACIO profile for an compoundedly prepared medication. It extends the Standardized Medication Profile (SMP) Medication profile to make composition, dosage form, and preparation-specific information interoperable in FHIR R4."

// Preserve the draft design identity and metadata from the source StructureDefinition.
// * ^url = "http://example.org/fhir/smp-compounded/StructureDefinition/smp-compounded-medication"
// * ^version = "0.1.0"
// * ^status = #draft
// * ^experimental = true
// * ^date = "2026-09-10"
// * ^publisher = "PACIO Project - proposed design (non-normative)"
// * ^fhirVersion = #4.0.1
// * ^abstract = false
// * ^jurisdiction = urn:iso:std:iso:3166#US "United States of America"

* . obeys smp-extemp-1
* extension contains SMPCompoundedFormulaSource named formulaSource 0..1 MS
* extension contains SMPCompoundedPreparationInstructions named preparationInstructions 0..1 MS
* extension contains SMPCompoundedStorageInstructions named storageInstructions 0..1 MS
* identifier MS
* identifier ^short = "Business or local identifier for the formulation or prepared product"
* code 1..1 MS
* code ^short = "Medication code and/or text describing the compound"
* status 1..1 MS
* form 1..1 MS
* form ^short = "Final dose form of the prepared medication"
* ingredient 1..* MS
* ingredient ^short = "Active and inactive ingredients/constituents"
* ingredient.item[x] 1..1 MS
* ingredient.item[x] only CodeableConcept or Reference(SMPCompoundedIngredient or $smp-medication)
* ingredient.isActive 1..1 MS
* ingredient.isActive ^short = "Explicitly identify active versus inactive constituent"
* ingredient.strength MS
* ingredient.strength ^short = "Strength/concentration contributed by this ingredient when expressible as a ratio"
* batch MS
* batch ^short = "Specific prepared batch information, when this Medication represents a prepared product"
* batch.lotNumber MS
* batch.lotNumber ^short = "Compound lot/batch identifier"
* batch.expirationDate MS
* batch.expirationDate ^short = "Beyond-use or expiration date/time for the specific prepared batch"

Invariant: smp-extemp-1
Description: "At least one ingredient SHALL be marked as active."
Severity: #error
Expression: "ingredient.where(isActive = true).exists()"
