Instance: smp-operation-retrieve
InstanceOf: OperationDefinition
Usage: #definition
* extension.url = "http://hl7.org/fhir/StructureDefinition/structuredefinition-wg"
* extension.valueCode = #phx
* version = "1.0.0"
* name = "SMPOperationRetrieve"
* title = "SMP Operation Retrieve"
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
* description = "Optional operation to request an individual patient's medication history"
* jurisdiction = urn:iso:std:iso:3166#US "United States of America"
* affectsState = false
* code = #smp-query
* system = true
* type = false
* instance = false
* inputProfile = "http://hl7.org/fhir/us/smp/StructureDefinition/smp-parameters-query"
* outputProfile = "http://hl7.org/fhir/us/smp/StructureDefinition/smp-parameters-response"
* parameter[0].name = #patient
* parameter[=].use = #in
* parameter[=].min = 1
* parameter[=].max = "1"
* parameter[=].documentation = "The patient whose medication history is desired"
* parameter[=].type = #Patient
* parameter[+].name = #list-type
* parameter[=].use = #in
* parameter[=].min = 0
* parameter[=].max = "1"
* parameter[=].documentation = "Optional parameter to define the type of medication list to be retrieved"
* parameter[=].type = #CodeableConcept
* parameter[+].name = #smp-medication-data
* parameter[=].use = #out
* parameter[=].min = 0
* parameter[=].max = "1"
* parameter[=].documentation = "A Bundle of type 'collection' that contains medication  information for the requested patient (if found)"
* parameter[=].type = #Bundle
* parameter[+].name = #outcome
* parameter[=].use = #out
* parameter[=].min = 0
* parameter[=].max = "1"
* parameter[=].documentation = "An OperationOutcome resource containing processing information associated with the operation response, including error, warning and/or informational information"
* parameter[=].type = #OperationOutcome