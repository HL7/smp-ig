Profile: SMPBundleTransaction
Parent: Bundle
Id: smp-bundle-transaction
Title: "Standardized Medication Profile - Bundle Medication List Maintenance"
Description: "A way to define and create a specific kind of medication list and the various medications that are on the list in a single transaction."
* ^extension.url = "http://hl7.org/fhir/StructureDefinition/structuredefinition-wg"
* ^extension.valueCode = #phx
* ^version = "1.0.0"
* ^experimental = false
* ^date = "2024-07-20T01:00:00-05:00"
* ^publisher = "HL7 International - Pharmacy"
* ^contact[0].name = "HL7 International - Pharmacy"
* ^contact[=].telecom.system = #url
* ^contact[=].telecom.value = "http://www.hl7.org/Special/committees/medication"
* ^jurisdiction = urn:iso:std:iso:3166#US "United States of America"
* ^purpose = "Constrained Bundle that supplies only the MedicationList profiled List resource and the SMP profiled MedicationStatement and other supporting resources. A mechanism to allow for the creation of a new medication list or an updated version of a list (full replacement) with the supporting MedicationStatement resources"
* type only code
* type = #transaction (exactly)
* type MS
* total MS
* entry 1..* MS
* entry ^comment = "The result bundle may contain one or more entries."
* entry ^slicing.discriminator.type = #type
* entry ^slicing.discriminator.path = "resource"
* entry ^slicing.rules = #open
* entry.search 0..0
* entry.search ^mustSupport = false
* entry.request 1..1
* entry.request ^mustSupport = true
* entry.response 0..0
* entry.response ^mustSupport = false
* entry contains
    list 1..* MS and
    patient 0..1 MS and
    medicationstatement 0..* MS and
    medication 0..* MS and
    medicationrequest 0..* MS and
    medicationdispense 0..* MS and
    medicationadministration 0..* MS
* entry[patient].resource only $us-core-patient
* entry[list].resource only $smp-medicationlist
* entry[medicationstatement].resource only $smp-medicationstatement

Instance: smp-bundle-tx-1
InstanceOf: smp-bundle-transaction
Usage: #example
Description: "Example of a Bundle resource used to create a medication list with a single entry"
* meta.profile = $smp-bundle-tx
* type = #transaction

* entry[0].fullUrl = "urn:uuid:9ce2a97b-5cab-4986-814f-4734016e6084"
* entry[=].request.method = #POST
* entry[=].request.url = "List"
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
* entry[=].resource.entry[=].item.reference = "urn:uuid:4359ae5b-2b6d-43e1-83b0-2369a6f82177"

* entry[+].fullUrl = "urn:uuid:4359ae5b-2b6d-43e1-83b0-2369a6f82177"
* entry[=].request.method = #POST
* entry[=].request.url = "MedicationStatement"
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

Instance: smp-bundle-tx-2
InstanceOf: smp-bundle-transaction
Usage: #example
Description: "Example of a Bundle resource used to create multiple medication lists (hospital admission and discharge lists) in a single transaction"
* meta.profile = $smp-bundle-tx
* type = #transaction

// Hospital Admission Medication List
* entry[0].fullUrl = "urn:uuid:1a2b3c4d-5e6f-7a8b-9c0d-1e2f3a4b5c6d"
* entry[=].request.method = #POST
* entry[=].request.url = "List"
* entry[=].resource.id = "smp-medlist-admission"
* entry[=].resource.resourceType = "List"
* entry[=].resource.meta.profile = $smp-medicationlist
* entry[=].resource.text.status = #generated
* entry[=].resource.text.div = "<div xmlns=\"http://www.w3.org/1999/xhtml\">Hospital admission medication list</div>"
* entry[=].resource.status = #current
* entry[=].resource.mode = #working
* entry[=].resource.title = "Hospital Admission Medication List"
* entry[=].resource.code = $loinc#104207-6 "Hospital admission medication list"
* entry[=].resource.subject.reference = "Patient/example"
* entry[=].resource.subject.display = "US Core Example Patient"
* entry[=].resource.date = "2024-07-01"
* entry[=].resource.source.reference = "Practitioner/practitioner-1"
* entry[=].resource.entry[0].date = "2024-07-01"
* entry[=].resource.entry[=].item.reference = "urn:uuid:7b8c9d0e-1f2a-3b4c-5d6e-7f8a9b0c1d2e"

// MedicationStatement for admission list
* entry[+].fullUrl = "urn:uuid:7b8c9d0e-1f2a-3b4c-5d6e-7f8a9b0c1d2e"
* entry[=].request.method = #POST
* entry[=].request.url = "MedicationStatement"
* entry[=].resource.id = "smp-medstmt-admission-1"
* entry[=].resource.resourceType = "MedicationStatement"
* entry[=].resource.meta.profile = $smp-medicationstatement
* entry[=].resource.text.status = #generated
* entry[=].resource.text.div = "<div xmlns=\"http://www.w3.org/1999/xhtml\">Metformin from admission list</div>"
* entry[=].resource.status = #active
* entry[=].resource.medicationCodeableConcept = $rxnorm#428759 "metformin 250 MG Oral Tablet"
* entry[=].resource.subject.reference = "Patient/example"
* entry[=].resource.subject.display = "US Core Example Patient"
* entry[=].resource.effectiveDateTime = "2024-06-01"
* entry[=].resource.dateAsserted = "2024-07-01"
* entry[=].resource.reasonCode = $snomed#359642000 "Diabetes mellitus type 2 in nonobese (disorder)"
* entry[=].resource.dosage.sequence = 1
* entry[=].resource.dosage.text = "po daily"

// Hospital Discharge Medication List
* entry[+].fullUrl = "urn:uuid:8c9d0e1f-2a3b-4c5d-6e7f-8a9b0c1d2e3f"
* entry[=].request.method = #POST
* entry[=].request.url = "List"
* entry[=].resource.id = "smp-medlist-discharge"
* entry[=].resource.resourceType = "List"
* entry[=].resource.meta.profile = $smp-medicationlist
* entry[=].resource.text.status = #generated
* entry[=].resource.text.div = "<div xmlns=\"http://www.w3.org/1999/xhtml\">Hospital discharge medication list</div>"
* entry[=].resource.status = #current
* entry[=].resource.mode = #working
* entry[=].resource.title = "Hospital Discharge Medication List"
* entry[=].resource.code = $loinc#104208-4 "Hospital discharge medication list"
* entry[=].resource.subject.reference = "Patient/example"
* entry[=].resource.subject.display = "US Core Example Patient"
* entry[=].resource.date = "2024-07-10"
* entry[=].resource.source.reference = "Practitioner/practitioner-1"
* entry[=].resource.entry[0].date = "2024-07-10"
* entry[=].resource.entry[=].item.reference = "urn:uuid:9d0e1f2a-3b4c-5d6e-7f8a-9b0c1d2e3f4a"
* entry[=].resource.entry[+].date = "2024-07-10"
* entry[=].resource.entry[=].item.reference = "urn:uuid:0e1f2a3b-4c5d-6e7f-8a9b-0c1d2e3f4a5b"

// MedicationStatement for discharge list - metformin continued
* entry[+].fullUrl = "urn:uuid:9d0e1f2a-3b4c-5d6e-7f8a-9b0c1d2e3f4a"
* entry[=].request.method = #POST
* entry[=].request.url = "MedicationStatement"
* entry[=].resource.id = "smp-medstmt-discharge-1"
* entry[=].resource.resourceType = "MedicationStatement"
* entry[=].resource.meta.profile = $smp-medicationstatement
* entry[=].resource.text.status = #generated
* entry[=].resource.text.div = "<div xmlns=\"http://www.w3.org/1999/xhtml\">Metformin continued on discharge</div>"
* entry[=].resource.status = #active
* entry[=].resource.medicationCodeableConcept = $rxnorm#428759 "metformin 250 MG Oral Tablet"
* entry[=].resource.subject.reference = "Patient/example"
* entry[=].resource.subject.display = "US Core Example Patient"
* entry[=].resource.effectiveDateTime = "2024-06-01"
* entry[=].resource.dateAsserted = "2024-07-10"
* entry[=].resource.reasonCode = $snomed#359642000 "Diabetes mellitus type 2 in nonobese (disorder)"
* entry[=].resource.dosage.sequence = 1
* entry[=].resource.dosage.text = "po daily"

// MedicationStatement for discharge list - new medication added
* entry[+].fullUrl = "urn:uuid:0e1f2a3b-4c5d-6e7f-8a9b-0c1d2e3f4a5b"
* entry[=].request.method = #POST
* entry[=].request.url = "MedicationStatement"
* entry[=].resource.id = "smp-medstmt-discharge-2"
* entry[=].resource.resourceType = "MedicationStatement"
* entry[=].resource.meta.profile = $smp-medicationstatement
* entry[=].resource.text.status = #generated
* entry[=].resource.text.div = "<div xmlns=\"http://www.w3.org/1999/xhtml\">Atorvastatin added on discharge</div>"
* entry[=].resource.status = #active
* entry[=].resource.medicationCodeableConcept = $rxnorm#597983 "atorvastatin 40 MG Oral Tablet"
* entry[=].resource.subject.reference = "Patient/example"
* entry[=].resource.subject.display = "US Core Example Patient"
* entry[=].resource.effectiveDateTime = "2024-07-10"
* entry[=].resource.dateAsserted = "2024-07-10"
* entry[=].resource.reasonCode = $snomed#55822004 "Hyperlipidemia (disorder)"
* entry[=].resource.dosage.sequence = 1
* entry[=].resource.dosage.text = "po qd"
