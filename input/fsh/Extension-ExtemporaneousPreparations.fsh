Extension: SMPCompoundedFormulaSource
Id: compounded-formula-source
Title: "Compounded Formula Source"
Description: "Reference to the controlled formula, monograph, or other source used to define the compounded formulation. The referenced artifact should identify the authoritative formula; this extension is not a substitute for pharmacy quality documentation."
Context: Medication

// Preserve the draft design identity and metadata from the source StructureDefinition.
// * ^url = "http://example.org/fhir/smp-compounded/StructureDefinition/compounded-formula-source"
// * ^version = "0.1.0"
// * ^status = #draft
// * ^experimental = true
// * ^date = "2026-09-10"
// * ^publisher = "PACIO Project - proposed design (non-normative)"
// * ^fhirVersion = #4.0.1
// * ^abstract = false
// * ^jurisdiction = urn:iso:std:iso:3166#US "United States of America"

* . ^short = "Compounded Formula Source"
* . ^definition = "Reference to the controlled formula, monograph, or other source used to define the compounded formulation. The referenced artifact should identify the authoritative formula; this extension is not a substitute for pharmacy quality documentation."
* extension 0..0
// * url = "http://example.org/fhir/smp-compounded/StructureDefinition/compounded-formula-source" (exactly)
* value[x] 1..1
* value[x] only Reference(DocumentReference)

// *********************************************

Extension: SMPCompoundedPreparationInstructions
Id: compounded-preparation-instructions
Title: "Compounded Preparation Instructions"
Description: "Human-readable preparation notes needed to identify or reproduce the formulation. For transition-of-care exchange, implementations should prefer a formula source reference and use this element only for concise supplementary instructions."
Context: Medication

// Preserve the draft design identity and metadata from the source StructureDefinition.
// * ^url = "http://example.org/fhir/smp-compounded/StructureDefinition/compounded-preparation-instructions"
// * ^version = "0.1.0"
// * ^status = #draft
// * ^experimental = true
// * ^date = "2026-09-10"
// * ^publisher = "PACIO Project - proposed design (non-normative)"
// * ^fhirVersion = #4.0.1
// * ^abstract = false
// * ^jurisdiction = urn:iso:std:iso:3166#US "United States of America"

* . ^short = "Compounded Preparation Instructions"
* . ^definition = "Human-readable preparation notes needed to identify or reproduce the formulation. For transition-of-care exchange, implementations should prefer a formula source reference and use this element only for concise supplementary instructions."
* extension 0..0
// *url = "http://example.org/fhir/smp-compounded/StructureDefinition/compounded-preparation-instructions" (exactly)
* value[x] 1..1
* value[x] only string

// *********************************************

Extension: SMPCompoundedPreparationReason
Id: compounded-preparation-reason
Title: "Compounded Preparation Reason"
Description: "Reason the prescribed medication requires compounded preparation, such as inability to swallow a solid dosage form, need to omit an excipient, or need for a non-commercial concentration or dosage form."
Context: MedicationRequest

// Preserve the draft design identity and metadata from the source StructureDefinition.
// * ^url = "http://example.org/fhir/smp-compounded/StructureDefinition/compounded-preparation-reason"
// * ^version = "0.1.0"
// * ^status = #draft
// * ^experimental = true
// * ^date = "2026-09-10"
// * ^publisher = "PACIO Project - proposed design (non-normative)"
// * ^fhirVersion = #4.0.1
// * ^abstract = false
// * ^jurisdiction = urn:iso:std:iso:3166#US "United States of America"

* . ^short = "Compounded Preparation Reason"
* . ^definition = "Reason the prescribed medication requires compounded preparation, such as inability to swallow a solid dosage form, need to omit an excipient, or need for a non-commercial concentration or dosage form."
* extension 0..0
// *url = "http://example.org/fhir/smp-compounded/StructureDefinition/compounded-preparation-reason" (exactly)
* value[x] 1..1
* value[x] only CodeableConcept

// *********************************************

Extension: SMPCompoundedStorageInstructions
Id: compounded-storage-instructions
Title: "Compounded Storage Instructions"
Description: "Storage and handling instructions specific to the prepared medication, such as temperature, light protection, or agitation requirements, when these are relevant to safe continuation of therapy."
Context: Medication

// Preserve the draft design identity and metadata from the source StructureDefinition.
// * ^url = "http://example.org/fhir/smp-compounded/StructureDefinition/compounded-storage-instructions"
// * ^version = "0.1.0"
// * ^status = #draft
// * ^experimental = true
// * ^date = "2026-09-10"
// * ^publisher = "PACIO Project - proposed design (non-normative)"
// * ^fhirVersion = #4.0.1
// * ^abstract = false
// * ^jurisdiction = urn:iso:std:iso:3166#US "United States of America"

* . ^short = "Compounded Storage Instructions"
* . ^definition = "Storage and handling instructions specific to the prepared medication, such as temperature, light protection, or agitation requirements, when these are relevant to safe continuation of therapy."
* extension 0..0
// *url = "http://example.org/fhir/smp-compounded/StructureDefinition/compounded-storage-instructions" (exactly)
* value[x] 1..1
* value[x] only string

// *********************************************
