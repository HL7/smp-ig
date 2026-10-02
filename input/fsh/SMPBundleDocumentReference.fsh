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
// * meta.profile = "http://hl7.org/fhir/us/smp/StructureDefinition/smp-bundle-documentreference"
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

Instance: patient-betsysmith-johnson01
InstanceOf: Patient
Usage: #example
Description: "Betsy Smith-Johnson's patient record, #female born on 1958-11-01."

* meta.lastUpdated = "2021-03-29T14:25:34.001-05:00"
* meta.profile = "http://hl7.org/fhir/us/core/StructureDefinition/us-core-patient"
* language = #en-US
* extension.extension[0].url = "ombCategory"
* extension.extension[=].valueCoding = urn:oid:2.16.840.1.113883.6.238#2106-3 "White"
* extension.extension[+].url = "text"
* extension.extension[=].valueString = "White"
* extension.url = "http://hl7.org/fhir/us/core/StructureDefinition/us-core-race"
* identifier[0].use = #usual
* identifier[=].type = $v2-0203#MR "Medical Record Number"
* identifier[=].type.text = "Medical Record Number"
* identifier[=].system = "http://hospital.smarthealthit.org"
* identifier[=].value = "1032702"
* identifier[+].system = "http://hl7.org/fhir/sid/us-medicare"
* identifier[=].value = "1PA3D58WH16"
* identifier[=].assigner.display = "Medicare"
* identifier[+].system = "http://hl7.org/fhir/sid/us-ssn"
* identifier[=].value = $v2-0203#SS "123-45-9999"

* active = true
* name.use = #usual
* name.text = "Smith-Johnson, Betsy"
* name.family = "Smith-Johnson"
* name.given = "Betsy"
* gender = #female
* birthDate = "1950-11-15"
* telecom[0].system = #phone
* telecom[=].use = #mobile
* telecom[=].value = "555-555-1111"
* telecom[+].system = #email
* telecom[=].value = "mmoen+betsysmithjohnson@mydirectives.com"
* address.line = "17040 E Warren Avenue"
* address.city = "Detroit"
* address.state = "MI"
* address.postalCode = "48224"
* address.country = "US"
* address.period.start = "2016-12-06"
* address.text = "17040 E Warren Avenue, Detroit, MI 48224"
* maritalStatus = $v3-NullFlavor#UNK
* contact[0].relationship = $v3-RoleCode#SONC
* contact[=].name.text = "Charles Johnson"
* contact[=].address.text = "17040 E Warren Avenue, Detroit, MI 48224"
* contact[=].telecom.system = #phone
* telecom[=].use = #mobile
* contact[=].telecom.value = "(555) 555-2222"
* contact[+].relationship = $v3-RoleCode#DAUINLAW
* contact[=].name.text = "Lisa Johnson"
* contact[=].telecom.system = #phone
* telecom[=].use = #mobile
* contact[=].telecom.value = "(555) 555-3333"
* contact[=].address.text = "17040 E Warren Avenue, Detroit, MI 48224"
* communication.language = urn:ietf:bcp:47#en "English"
* communication.preferred = true

Instance: org-ED-Metro-Hospital
InstanceOf: Organization
Usage: #example
Description: "Metro Hospital Emergency Department organization."
* active = true
* name = "Metro Hospital Emergency Department"
* telecom.system = #phone
* telecom.value = "(555) 384-4444"
* address.line = "22327 Moross Rd, Detroit, MI 48236"
* address.city = "Detroit"
* address.state = "MI"
* address.postalCode = "48236"
* address.country = "US"
* address.text = "22327 Moross Rd, Detroit, MI 48236"