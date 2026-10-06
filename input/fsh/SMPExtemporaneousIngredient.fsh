Profile: SMPExtemporaneousIngredient
Parent: Substance
Id: smp-extemporaneous-ingredient
Title: "PACIO Extemporaneous Preparation Ingredient"
Description: "A proposed profile for an ingredient or constituent used in an extemporaneous preparation. It supports coded ingredient identity and optional source package lot/expiry traceability."

// Preserve the draft design identity and metadata from the source StructureDefinition.
// * ^url = "http://example.org/fhir/smp-extemporaneous/StructureDefinition/smp-extemporaneous-ingredient"
// * ^version = "0.1.0"
// * ^status = #draft
// * ^experimental = true
// * ^date = "2026-09-10"
// * ^publisher = "PACIO Project - proposed design (non-normative)"
// * ^fhirVersion = #4.0.1
// * ^abstract = false
// * ^jurisdiction = urn:iso:std:iso:3166#US "United States of America"

* identifier MS
* identifier ^short = "Identifier for the ingredient kind or source material"
* code 1..1 MS
* code ^short = "Coded or textual identity of the ingredient"
* description MS
* description ^short = "Ingredient description or relevant handling notes"
* instance MS
* instance ^short = "Specific source package/container when traceability is available"
* instance.identifier MS
* instance.identifier ^short = "Source package lot or container identifier"
* instance.expiry MS
* instance.expiry ^short = "Source ingredient package expiration date/time"
* instance.quantity MS
* instance.quantity ^short = "Quantity in the source package/container"
