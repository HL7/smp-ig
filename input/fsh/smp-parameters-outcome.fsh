Profile: SMPParametersOutcome
Parent: Parameters
Id: smp-parameters-outcome
Title: "SMP Parameters - Outcome"
Description: "This profile tailors the Parameters resource to convey status result of request to store medication history."
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
    outcome 1..1 MS
* parameter[outcome].name = "outcome" (exactly)
* parameter[outcome].name MS
* parameter[outcome].value[x] 0..0
* parameter[outcome].resource 1..1 MS
* parameter[outcome].resource only OperationOutcome


Instance: smp-submit-outcome-parameters-1
InstanceOf: smp-parameters-outcome
Usage: #example
Description: "Example of a Parameters resource used to respond to a submission of a patient's medication history"
* meta.profile = "http://hl7.org/fhir/us/smp/StructureDefinition/smp-parameters-outcome"
* parameter[outcome].name = "outcome"
* parameter[outcome].resource.resourceType = "OperationOutcome"
* parameter[outcome].resource.id = "201"
* parameter[outcome].resource.text.status = #generated
* parameter[outcome].resource.text.div = "<div xmlns=\"http://www.w3.org/1999/xhtml\">Medication history was created for the patient</div>"
* parameter[outcome].resource.issue.severity = #information
* parameter[outcome].resource.issue.code = #informational
