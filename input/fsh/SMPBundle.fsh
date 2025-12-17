Profile: SMPBundle
Parent: Bundle
Id: smp-bundle
Title: "Standardized Medication Profile - Bundle Medication List"
Description: "A single package that contains a specific kind of medication list with all supporting MedicationStatements and possibly other supporting resources."
* ^extension.url = "http://hl7.org/fhir/StructureDefinition/structuredefinition-wg"
* ^extension.valueCode = #phx
* ^version = "1.0.0"
* ^experimental = false
* ^date = "2024-04-25T01:00:00-05:00"
* ^publisher = "HL7 International - Pharmacy"
* ^contact[0].name = "HL7 International - Pharmacy"
* ^contact[=].telecom.system = #url
* ^contact[=].telecom.value = "http://www.hl7.org/Special/committees/medication"
* ^jurisdiction = urn:iso:std:iso:3166#US "United States of America"
* ^purpose = "Constrained Bundle that supplies only the MedicationList profiled List resource and the SMP profiled MedicationStatement and other supporting resources. A mechanism to allow for the retrieval in a single package of all of the details for a specific medication list."
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
    List 1..* MS and
    Patient 0..1 MS and
    MedicationAdministration 0..* MS and
    MedicationStatement 0..* MS and
    Medication 0..* MS and
    MedicationRequest 0..* MS and
    MedicationDispense 0..* MS and
    Practitioner 0..* MS and
    PractitionerRole 0..* MS
* entry[Patient].resource 1..1 MS
* entry[Patient].resource only $us-core-patient
* entry[List].resource 1..1 MS
* entry[List].resource only $smp-medicationlist
* entry[MedicationAdministration].resource only MedicationAdministration
* entry[MedicationStatement].resource only $smp-medicationstatement
* entry[Medication].resource only Medication
* entry[MedicationRequest].resource only MedicationRequest
* entry[MedicationDispense].resource only MedicationDispense
* entry[Practitioner].resource only Practitioner
* entry[PractitionerRole].resource only PractitionerRole

Instance: smp-bundle-1
InstanceOf: smp-bundle
Usage: #example
Description: "Example of a Bundle resource used to transmit a patient's SMP medication list and contents"
* meta.profile = $smp-bundle
* type = #collection

* entry[0].fullUrl = "urn:uuid:9ce2a97b-5cab-4986-814f-4734016e6084"
* entry[=].resource.id = "smp-medlist-1"
* entry[=].resource.resourceType = "List"
* entry[=].resource.meta.profile = $smp-medicationlist
* entry[=].resource.text.status = #generated
* entry[=].resource.text.div = "<div xmlns=\"http://www.w3.org/1999/xhtml\">A hospital medication administration list for a patient</div>"
* entry[=].resource.status = #current
* entry[=].resource.mode = #working
* entry[=].resource.title = "Hospital Medication Administration List"
* entry[=].resource.code = $loinc#104207-6
* entry[=].resource.subject.reference = "Patient/example"
* entry[=].resource.subject.display = "US Core Example Patient"
* entry[=].resource.date = "2024-07-01"
* entry[=].resource.source.reference = "Practitioner/practitioner-1"
* entry[=].resource.entry[0].date = "2024-07-01"
* entry[=].resource.entry[=].item.reference = "urn:uuid:23ac0bc6-0959-4181-8af0-6db5e2ef8176"

* entry[+].fullUrl = "urn:uuid:23ac0bc6-0959-4181-8af0-6db5e2ef8176"
* entry[=].resource.id = "smp-medstmt-bundle-1"
* entry[=].resource.resourceType = "MedicationStatement"
* entry[=].resource.meta.profile = $smp-medicationstatement
* entry[=].resource.text.status = #generated
* entry[=].resource.text.div = "<div xmlns=\"http://www.w3.org/1999/xhtml\">A statement of an individual medication the patient is receiving</div>"
* entry[=].resource.status = #active
* entry[=].resource.medicationCodeableConcept = $rxnorm#428759 "metformin 250 MG Oral Tablet"
* entry[=].resource.subject.reference = "Patient/example"
* entry[=].resource.subject.display = "US Core Example Patient"
* entry[=].resource.effectiveDateTime = "2024-06-01"
* entry[=].resource.dateAsserted = "2024-07-01"
* entry[=].resource.reasonCode = $snomed#359642000 "Diabetes mellitus type 2 in nonobese (disorder)"
* entry[=].resource.dosage.sequence = 1
* entry[=].resource.dosage.text = "po daily"

// Primary Care Medication List
* entry[+].fullUrl = "urn:uuid:2f7e3c44-8e1c-4b2b-9b7e-0b3f0e6d1a2a"
* entry[=].resource.id = "smp-medlist-2"
* entry[=].resource.resourceType = "List"
* entry[=].resource.meta.profile = $smp-medicationlist
* entry[=].resource.text.status = #generated
* entry[=].resource.text.div = "<div xmlns=\"http://www.w3.org/1999/xhtml\">A primary care medication list for a patient</div>"
* entry[=].resource.status = #current
* entry[=].resource.mode = #working
* entry[=].resource.title = "Primary Care Medication List"
* entry[=].resource.code = $loinc#10160-0
* entry[=].resource.subject.reference = "Patient/example"
* entry[=].resource.subject.display = "US Core Example Patient"
* entry[=].resource.date = "2024-07-01"
* entry[=].resource.source.reference = "Practitioner/practitioner-2"
* entry[=].resource.entry[+].date = "2024-07-01"
* entry[=].resource.entry[=].item.reference = "urn:uuid:bb2e8f9c-9c3a-4e2d-b5b2-8f9c9c3a4e2d"

// MedicationStatement referenced by smp-medlist-2
* entry[+].fullUrl = "urn:uuid:bb2e8f9c-9c3a-4e2d-b5b2-8f9c9c3a4e2d"
* entry[=].resource.id = "smp-medstmt-3"
* entry[=].resource.resourceType = "MedicationStatement"
* entry[=].resource.meta.profile = "http://hl7.org/fhir/us/smp/StructureDefinition/smp-medicationstatement"
* entry[=].resource.status = #active
* entry[=].resource.medicationCodeableConcept = $rxnorm#197361 "Amlodipine 5 MG Oral Tablet"
* entry[=].resource.subject.reference = "Patient/example"
* entry[=].resource.effectiveDateTime = "2024-06-01"
* entry[=].resource.dateAsserted = "2024-07-03"
* entry[=].resource.reasonCode = $snomed#38341003 "Hypertensive disorder, systemic arterial (disorder)"
* entry[=].resource.dosage.sequence = 1
* entry[=].resource.dosage.text = "po qd"