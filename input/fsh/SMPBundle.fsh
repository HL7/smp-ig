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
    list 1..1 MS and
    patient 0..1 MS and
    medicationadministration 0..* MS and
    medicationstatement 0..* MS and
    medication 0..* MS and
    medicationrequest 0..* MS and
    medicationdispense 0..* MS and
    practitioner 0..* MS and
    practitionerrole 0..* MS
* entry[patient].resource 1..1 MS
* entry[patient].resource only $us-core-patient
* entry[list].resource 1..1 MS
* entry[list].resource only $smp-medicationlist
* entry[medicationstatement].resource only $smp-medicationstatement

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
