Instance: smp-client
InstanceOf: CapabilityStatement
Usage: #definition
* extension.url = "http://hl7.org/fhir/StructureDefinition/structuredefinition-wg"
* extension.valueCode = #phx
* url = "http://hl7.org/fhir/us/smp/CapabilityStatement/smp-client"
* version = "1.0.0"
* name = "SMP_Client"
* status = #active
* date = "2024-04-29T00:00:00-06:00"
* publisher = "HL7 International / Pharmacy"
* contact[0].name = "HL7 International / Pharmacy"
* contact[=].telecom.system = #url
* contact[=].telecom.value = "http://www.hl7.org/Special/committees/medication"
* description = "This resource defines the expected capabilities of the SMP Server actor when conforming to the SMP IG and It is expected that it will be used in conjunction with the US Core CapabilityStatement. Together they describe the complete list of actual profiles and RESTful operations supported by SMP clients. SMP Client requirements may also be impacted by the rules of local jurisdictions or other contextual requirements."
* jurisdiction = urn:iso:std:iso:3166#US "United States of America"
* kind = #requirements
* fhirVersion = #4.0.1
* format[0] = #json
* format[+] = #xml
* format[0].extension.url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
* format[=].extension.valueCode = #SHALL
* format[+].extension.url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
* format[=].extension.valueCode = #SHOULD
* rest
  * mode = #client

  * insert CSresource(#List, $smp-medicationlist)
    * insert CSinteraction(#SHALL, #read, [[Allows retrieval medication details.]])
  * insert CSresource(#MedicationStatement, $smp-medicationstatement)
    * insert CSinteraction(#SHALL, #read, [[Allows retrieval medication details.]])
  * insert CSresource(#Medication, $smp-medication)
    * insert CSinteraction(#SHOULD, #read, [[Allows retrieval medication details.  (Support is mandatory if the system supports Medications)]])
  * insert CSresource(#MedicationRequest, $us-core-medicationrequest)
    * insert CSinteraction(#SHOULD, #read, [[Allows retrieval .  (Support is mandatory if the system supports MedicationRequests)]])
  * insert CSresource(#MedicationAdministration, $smp-medicationadministration)
    * insert CSinteraction(#SHOULD, #read, [[Allows retrieval medication details.  (Support is mandatory if the system supports MedicationAdministrations)]])
  * insert CSresource(#Patient, $us-core-patient)
    * insert CSinteraction(#SHALL, #read, [[Required for identification and retrieval of patient medication information]])
  * resource[+]
    * type = #Bundle
    * supportedProfile[0] = $smp-bundle
    * supportedProfile[+] = $smp-bundle-tx
  * insert CSinteraction(#MAY, #read, [[Allows retrieval using extended bundles and submission of new medication list to a repository.]])

