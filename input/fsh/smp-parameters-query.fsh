Profile: SMPParametersQuery
Parent: Parameters
Id: smp-parameters-query
Title: "SMP Parameters - Query"
Description: "This profile tailors the Parameters resource to convey medication History operation inputs."
* ^extension.url = "http://hl7.org/fhir/StructureDefinition/structuredefinition-wg"
* ^extension.valueCode = #phx
* ^meta.lastUpdated = "2025-01-08T00:00:00-05:00"
* ^version = "1.0.0"
* ^status = #active
* ^experimental = false
* ^date = "2025-01-08T00:00:00-05:00"
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
    patient 1..1 MS and
    list-type 0..1 MS
* parameter[patient].name = "patient" (exactly)
* parameter[patient].name MS
* parameter[patient].value[x] 0..0
* parameter[patient].resource 1..1 MS
* parameter[patient].resource only $us-core-patient
* parameter[list-type].name = "list-type" (exactly)
* parameter[list-type].name MS
* parameter[list-type].value[x] 1..1 MS
* parameter[list-type].value[x] only CodeableConcept
* parameter[list-type].resource 0..0


Instance: smp-history-input-parameters-1
InstanceOf: smp-parameters-query
Usage: #example
Description: "Example of a Parameters resource used to request a patient's medication history"
* parameter[patient].name = "patient"
* parameter[patient].resource.id = "patient-req-1"
* parameter[patient].resource.resourceType = "Patient"
* parameter[patient].resource.meta.profile = $us-core-patient
* parameter[patient].resource.text.status = #generated
* parameter[patient].resource.text.div = "<div xmlns=\"http://www.w3.org/1999/xhtml\">August Samuels</div>"
* parameter[patient].resource.identifier.type = $v2-0203#SS "Social Security number"
* parameter[patient].resource.identifier.system = "http://hl7.org/fhir/sid/us-ssn"
* parameter[patient].resource.identifier.value = "120-35-2435"
* parameter[patient].resource.name.family = "Samuels"
* parameter[patient].resource.name.given = "August"
* parameter[patient].resource.gender = #female
* parameter[patient].resource.birthDate = "1989-03-12"
* parameter[list-type].name = "list-type"
* parameter[list-type].valueCodeableConcept = $loinc#104207-6

