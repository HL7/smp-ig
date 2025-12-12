Instance: smp-operation-submit
InstanceOf: OperationDefinition
Usage: #definition
* extension.url = "http://hl7.org/fhir/StructureDefinition/structuredefinition-wg"
* extension.valueCode = #phx
* version = "1.0.0"
* name = "SMPOperationSubmit"
* title = "SMP Operation Submit"
* status = #active
* kind = #operation
* date = "2025-01-07T00:00:00-05:00"
* publisher = "HL7 International / Pharmacy"
* contact[0].name = "HL7 International / Pharmacy"
* contact[=].telecom.system = #url
* contact[=].telecom.value = "http://www.hl7.org/Special/committees/medication"
* contact[+].name = "Andy Stechishin"
* contact[=].telecom[0].system = #email
* contact[=].telecom[=].value = "andy.stechishin@gmail.com"
* description = "Optional operation to submit an individual patient's medication history list for storage"
* jurisdiction = urn:iso:std:iso:3166#US "United States of America"
* affectsState = false
* code = #smp-submit
* system = true
* type = false
* instance = false
* inputProfile = "http://hl7.org/fhir/us/smp/StructureDefinition/smp-parameters-submit"
* outputProfile = "http://hl7.org/fhir/us/smp/StructureDefinition/smp-parameters-outcome"
* parameter[+].name = #smp-medication-data
* parameter[=].use = #in
* parameter[=].min = 1
* parameter[=].max = "1"
* parameter[=].documentation = "A Bundle of type 'transaction' that contains medication information for the specified patient"
* parameter[=].type = #Bundle
* parameter[+].name = #outcome
* parameter[=].use = #out
* parameter[=].min = 1
* parameter[=].max = "1"
* parameter[=].documentation = "An OperationOutcome resource containing processing information associated with the operation response, including error, warning and/or informational information"
* parameter[=].type = #OperationOutcome