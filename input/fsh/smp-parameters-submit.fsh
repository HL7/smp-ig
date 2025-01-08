Profile: SMPParametersSubmit
Parent: Parameters
Id: smp-parameters-submit
Title: "SMP Parameters - Submit"
Description: "This profile tailors the Parameters resource to convey medication History operation inputs for storage."
* ^extension.url = "http://hl7.org/fhir/StructureDefinition/structuredefinition-wg"
* ^extension.valueCode = #phx
* ^meta.lastUpdated = "2025-01-07T00:00:00-05:00"
* ^version = "1.0.0"
* ^status = #active
* ^experimental = false
* ^date = "2025-01-07T00:00:00-05:00"
* ^publisher = "HL7 International / Pharmacy"
* ^contact[0].name = "HL7 International / Pharmacy"
* ^contact[=].telecom.system = #url
* ^contact[=].telecom.value = "http://www.hl7.org/Special/committees/medication"
* ^contact[+].name = "Andy Stechishin"
* ^contact[=].telecom[0].system = #email
* ^contact[=].telecom[=].value = "andy.stechishin@gmail.com"
* ^jurisdiction = urn:iso:std:iso:3166#US "United States of America"
* parameter MS
* parameter ^slicing.discriminator.type = #value
* parameter ^slicing.discriminator.path = "name"
* parameter ^slicing.ordered = false
* parameter ^slicing.rules = #open
* parameter contains
    smp-medication-data 1..1 MS
* parameter[smp-medication-data].name = "smp-medication-data" (exactly)
* parameter[smp-medication-data].name MS
* parameter[smp-medication-data].value[x] only Reference($smp-bundle-tx)
* parameter[smp-medication-data].value[x] MS


Instance: smp-submit-input-parameters-1
InstanceOf: smp-parameters-submit
Usage: #example
Description: "Example of a Parameters resource used to submit a patient's medication history"
* parameter[smp-medication-data].name = "smp-medication-data"
* parameter[smp-medication-data].resource.id = "smp-parameters-submit-1"
* parameter[smp-medication-data].resource.resourceType = "Bundle"
* parameter[smp-medication-data].resource.meta.profile = $smp-bundle-tx
* parameter[smp-medication-data].resource.type = #transaction

* parameter[smp-medication-data].resource.entry[0].fullUrl = "urn:uuid:9ce2a97b-5cab-4986-814f-4734016e6084"
* parameter[smp-medication-data].resource.entry[=].request.method = #POST
* parameter[smp-medication-data].resource.entry[=].request.url = "List"
* parameter[smp-medication-data].resource.entry[=].resource.id = "smp-medlist-1"
* parameter[smp-medication-data].resource.entry[=].resource.resourceType = "List"
* parameter[smp-medication-data].resource.entry[=].resource.meta.profile = $smp-medicationlist
* parameter[smp-medication-data].resource.entry[=].resource.text.status = #generated
* parameter[smp-medication-data].resource.entry[=].resource.text.div = "<div xmlns=\"http://www.w3.org/1999/xhtml\">A hospital medication administration list for a patient</div>"
* parameter[smp-medication-data].resource.entry[=].resource.status = #current
* parameter[smp-medication-data].resource.entry[=].resource.mode = #working
* parameter[smp-medication-data].resource.entry[=].resource.title = "Hospital Medication Administration List"
* parameter[smp-medication-data].resource.entry[=].resource.code = $loinc#104207-6
* parameter[smp-medication-data].resource.entry[=].resource.subject.reference = "Patient/example"
* parameter[smp-medication-data].resource.entry[=].resource.subject.display = "US Core Example Patient"
* parameter[smp-medication-data].resource.entry[=].resource.date = "2024-07-01"
* parameter[smp-medication-data].resource.entry[=].resource.source.reference = "Practitioner/practitioner-1"
* parameter[smp-medication-data].resource.entry[=].resource.entry[0].date = "2024-07-01"
* parameter[smp-medication-data].resource.entry[=].resource.entry[=].item.reference = "urn:uuid:4359ae5b-2b6d-43e1-83b0-2369a6f82177"

* parameter[smp-medication-data].resource.entry[+].fullUrl = "urn:uuid:4359ae5b-2b6d-43e1-83b0-2369a6f82177"
* parameter[smp-medication-data].resource.entry[=].request.method = #POST
* parameter[smp-medication-data].resource.entry[=].request.url = "MedicationStatement"
* parameter[smp-medication-data].resource.entry[=].resource.id = "smp-medstmt-bundle-1"
* parameter[smp-medication-data].resource.entry[=].resource.resourceType = "MedicationStatement"
* parameter[smp-medication-data].resource.entry[=].resource.meta.profile = $smp-medicationstatement
* parameter[smp-medication-data].resource.entry[=].resource.text.status = #generated
* parameter[smp-medication-data].resource.entry[=].resource.text.div = "<div xmlns=\"http://www.w3.org/1999/xhtml\">A statement of an individual medication the patient is receiving</div>"
* parameter[smp-medication-data].resource.entry[=].resource.status = #active
* parameter[smp-medication-data].resource.entry[=].resource.medicationCodeableConcept = $rxnorm#428759 "metformin 250 MG Oral Tablet"
* parameter[smp-medication-data].resource.entry[=].resource.subject.reference = "Patient/example"
* parameter[smp-medication-data].resource.entry[=].resource.subject.display = "US Core Example Patient"
* parameter[smp-medication-data].resource.entry[=].resource.effectiveDateTime = "2024-06-01"
* parameter[smp-medication-data].resource.entry[=].resource.dateAsserted = "2024-07-01"
* parameter[smp-medication-data].resource.entry[=].resource.reasonCode = $snomed#359642000 "Diabetes mellitus type 2 in nonobese (disorder)"
* parameter[smp-medication-data].resource.entry[=].resource.dosage.sequence = 1
* parameter[smp-medication-data].resource.entry[=].resource.dosage.text = "po daily"
