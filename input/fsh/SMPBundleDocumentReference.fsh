Profile: SMPBundleDocumentReference
Parent: $us-core-documentreference
Id: smp-bundle-documentreference
Title: "Standardized Medication Profile - Bundle DocumentReference"
Description: "A US Core DocumentReference constrained for references to SMP collection bundles by fixing the document type to LOINC 70006-2 Medication Management Note and limiting the subject to a US Core Patient."
* ^extension[0].url = "http://hl7.org/fhir/StructureDefinition/structuredefinition-wg"
* ^extension[0].valueCode = #phx
* ^status = #active
* ^publisher = "HL7 International / Pharmacy"
* ^contact[0].name = "HL7 International / Pharmacy"
* ^contact[=].telecom.system = #url
* ^contact[=].telecom.value = "http://www.hl7.org/Special/committees/medication"
* ^jurisdiction = urn:iso:std:iso:3166#US "United States of America"
* ^date = "2026-04-27"
* ^purpose = "Supports searching SMP medication collection bundles through a consistent DocumentReference type code and a US Core Patient subject."

* identifier MS
* identifier ^short = "Contains a specialized identifier for the setId used to identify a specific logical document."
* status MS
* type 1..1 MS
* type = $loinc#70006-2 "Medication Management Note"
* date 1..1 MS
* subject 1..1 MS
* subject only Reference($us-core-patient)
* author MS
* author only Reference($us-core-practitionerrole or $us-core-organization or $us-core-patient)
* custodian MS
* custodian only Reference($us-core-organization)
* content MS
* content.attachment MS
* content.attachment.contentType 1..1 MS    // this should be the SMP Bundle content type
* content.attachment.url MS 
* content.attachment.creation 1..1 MS
* content.format MS

Instance: smp-bundle-documentreference-example
InstanceOf: SMPBundleDocumentReference
Usage: #example
Description: "Example DocumentReference for an SMP medication collection bundle."
* meta.profile = "http://hl7.org/fhir/us/smp/StructureDefinition/smp-bundle-documentreference"
* identifier.system = "urn:ietf:rfc:3986"
* identifier.value = "urn:uuid:7b47e07a-8f95-4eb6-a0a5-ef3f5c6518b1"
* status = #current
* category = http://hl7.org/fhir/us/core/CodeSystem/us-core-documentreference-category#clinical-note "Clinical Note"
* type = $loinc#70006-2 "Medication Management Note"
* subject = Reference(patient-betsysmith-johnson01)
* date = "2026-04-27T14:30:00Z"
* author = Reference(org-ED-Metro-Hospital)
* content.attachment.contentType = #application/fhir+json
* content.attachment.url = "https://example.org/fhir/Bundle/smp-bundle-1"
* content.attachment.title = "SMP Medication Collection Bundle"
* content.attachment.creation = "2026-04-27T14:30:00Z"
* description = "Pointer to an SMP collection Bundle for medication profile search and retrieval."