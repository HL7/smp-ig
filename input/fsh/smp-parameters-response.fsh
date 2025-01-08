Profile: SMPParametersResponse
Parent: Parameters
Id: smp-parameters-response
Title: "SMP Parameters - Response"
Description: "This profile tailors the Parameters resource to convey medication History operation outputs."
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
* parameter 1..4 MS
* parameter ^slicing.discriminator.type = #value
* parameter ^slicing.discriminator.path = "name"
* parameter ^slicing.ordered = false
* parameter ^slicing.rules = #open
* parameter contains
    smp-medication-data 0..1 MS and
    outcome 0..1 MS
* parameter[smp-medication-data].name = "smp-medication-data" (exactly)
* parameter[smp-medication-data].name MS
* parameter[smp-medication-data].value[x] only Reference($smp-bundle)
* parameter[smp-medication-data].value[x] MS
* parameter[outcome].name = "outcome" (exactly)
* parameter[outcome].name MS
* parameter[outcome].value[x] only Reference(OperationOutcome)
* parameter[outcome].value[x] MS


Instance: smp-history-output-parameters-1
InstanceOf: smp-parameters-response
Usage: #example
Description: "Example of a Parameters resource used to respond to a request a patient's medication history"
* parameter[smp-medication-data].name = "smp-medication-data"
* parameter[smp-medication-data].resource.id = "smp-parameters-response-1"
* parameter[smp-medication-data].resource.resourceType = "Bundle"
* parameter[smp-medication-data].resource.meta.profile = $smp-bundle
* parameter[smp-medication-data].resource.type = #collection

* parameter[smp-medication-data].resource.entry[0].fullUrl = "urn:uuid:9ce2a97b-5cab-4986-814f-4734016e6084"
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
* parameter[smp-medication-data].resource.entry[=].resource.entry[=].item.reference = "urn:uuid:23ac0bc6-0959-4181-8af0-6db5e2ef8176"

* parameter[smp-medication-data].resource.entry[+].fullUrl = "urn:uuid:23ac0bc6-0959-4181-8af0-6db5e2ef8176"
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
