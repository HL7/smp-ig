Profile: SMPBundle
Parent: Bundle
Id: smp-bundle
Title: "SMP Bundle - Medication List"
Description: "This profile constrains a Bundle resource to carry the MedicationList and the associated supporting resources"
* ^extension.url = "http://hl7.org/fhir/StructureDefinition/structuredefinition-wg"
* ^extension.valueCode = #phx
* ^version = "1.0.0"
* ^experimental = false
* ^date = "2024-04-01T00:00:00-05:00"
* ^publisher = "HL7 International - Pharmacy"
* ^contact[0].name = "HL7 International - Pharmacy"
* ^contact[=].telecom.system = #url
* ^contact[=].telecom.value = "http://www.hl7.org/Special/committees/medication"
* ^jurisdiction = urn:iso:std:iso:3166#US "United States of America"
* type only code
* type = #collection (exactly)
* type MS
* total MS
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
    list 1..1 MS and
    patient 1..* MS and
    medicationadministration 0..* MS and
    medicationstatement 0..* MS and
    pharmacy 0..* MS and
    medication 0..* MS and
    medicationrequest 0..* MS and
    practitioner 0..* MS and
    practitionerrole 0..* MS
* entry[patient].resource 1..1 MS
* entry[patient].resource only $us-core-patient
