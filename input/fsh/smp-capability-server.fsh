Instance: smp-server
InstanceOf: CapabilityStatement
Usage: #definition
* extension.url = "http://hl7.org/fhir/StructureDefinition/structuredefinition-wg"
* extension.valueCode = #phx
* url = "http://hl7.org/fhir/us/smp/CapabilityStatement/smp-server"
* version = "1.0.0"
* name = "SMP_Server"
* status = #active
* date = "2024-04-29T00:00:00-06:00"
* publisher = "HL7 International / Pharmacy"
* contact[0].name = "HL7 International / Pharmacy"
* contact[=].telecom.system = #url
* contact[=].telecom.value = "http://www.hl7.org/Special/committees/medication"
* description = "This resource defines the expected capabilities of the SMP Server actor when conforming to the SMP IG and It is expected that it will be used in conjunction with the US Core CapabilityStatement. Together they describe the complete list of actual profiles and RESTful operations supported by SMP servers. SMP Server requirements may also be impacted by the rules of local jurisdictions or other contextual requirements."
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
  * mode = #server

  * insert CSresource(#List, $smp-medicationlist)
    * insert CSinteraction(#SHALL, #read, [[Allows retrieval of medication list for the various point in time information.]])
    * insert CSinteraction(#SHOULD, #update, [[Allows for the maintenance of the medication lists.]])
    * insert CSinteraction(#SHOULD, #create, [[Allows for the creation of a medication list.]])
    * insert CSsearch(#SHALL, "patient", "http://hl7.org/fhir/SearchParameter/List-subject", #reference, [[Allows retrieving medication lists for the patient]])
    * insert CSsearch(#SHOULD, "code", "http://hl7.org/fhir/SearchParameter/clinical-code", #token, [[Allows retrieving specific kinds of medication lists]])
    * insert CSsearch(#SHALL, "patient+code", "http://hl7.org/fhir/SearchParameter/List-subject", #composite, [[Allows retrieving specific kinds of medication lists for a patient - required to avoid returning too many records]])
  * resource[=].operation[0]
    * extension.url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
    * extension.valueCode = #MAY
    * name = "smp-query"
    * definition = "http://hl7.org/fhir/us/smp/OperationDefinition/smp-operation-retrieve"
    * documentation = "Operation used to retrieve individual patient's medication history"
  * resource[=].operation[+]
    * extension.url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
    * extension.valueCode = #MAY
    * name = "smp-submit"
    * definition = "http://hl7.org/fhir/us/smp/OperationDefinition/smp-operation-submit"
    * documentation = "Operation used to submit individual patient's medication list for storage"
  * insert CSresource(#MedicationStatement, $smp-medicationstatement)
    * insert CSinteraction(#SHALL, #read, [[Allows retrieval of medication details.]])
    * insert CSinteraction(#SHOULD, #update, [[Allows for the maintenance of the medication details.]])
    * insert CSinteraction(#SHOULD, #create, [[Allows for the creation of a medication details. (Mandatory if creation of Medication lists enabled.)]])
    * insert CSsearch(#SHALL, "patient", "http://hl7.org/fhir/SearchParameter/clinical-patient", #reference, [[Allows retrieving medication statements for a patient]])
    * insert CSsearch(#SHOULD, "status", "http://hl7.org/fhir/SearchParameter/medications-status", #token, [[Allows filtering by medication statement status]])
  * insert CSresource(#Medication, $smp-medication)
    * insert CSinteraction(#SHOULD, #read, [[Allows retrieval medication details]])
    * insert CSinteraction(#MAY, #create, [[Allows for the creation of a medication.]])
  * insert CSresource(#MedicationRequest, $us-core-medicationrequest)
    * insert CSinteraction(#SHOULD, #read, [[Allows retrieval of .]])
    * insert CSinteraction(#MAY, #create, [[Allows for the creation of a medication.]])
    * insert CSinteraction(#MAY, #update, [[Allows for the maintenance of a MedicationRequest as required.]])
    * insert CSsearch(#SHALL, "patient", "http://hl7.org/fhir/SearchParameter/clinical-patient", #reference, [[Allows retrieving medication requests for a patient]])
    * insert CSsearch(#SHOULD, "intent", "http://hl7.org/fhir/SearchParameter/MedicationRequest-intent", #token, [[Allows filtering by medication request intent]])
    * insert CSsearch(#SHOULD, "status", "http://hl7.org/fhir/SearchParameter/medications-status", #token, [[Allows filtering by medication request status]])
  * insert CSresource(#MedicationAdministration, $smp-medicationadministration)
    * insert CSinteraction(#SHOULD, #read, [[Allows retrieval medication details.]])
    * insert CSinteraction(#MAY, #create, [[Allows for the creation of a medication.]])
    * insert CSinteraction(#MAY, #update, [[Allows for the maintenance of a MedicationAdministration as required.]])
    * insert CSsearch(#SHALL, "patient", "http://hl7.org/fhir/SearchParameter/clinical-patient", #reference, [[Allows retrieving medication administrations for a patient]])
    * insert CSsearch(#SHOULD, "status", "http://hl7.org/fhir/SearchParameter/medications-status", #token, [[Allows filtering by medication administration status]])
  * insert CSresource(#Patient, $us-core-patient)
    * insert CSinteraction(#SHALL, #read, [[Required for identification and retrieval of patient medication information]])
    * insert CSsearch(#SHALL, "_id", "http://hl7.org/fhir/SearchParameter/Resource-id", #token, [[Allows retrieval of patient by id. Aligns with US Core requirement and FHIR base spec.]])
  * resource[+]
    * type = #Bundle
    * supportedProfile[0] = $smp-bundle
    * supportedProfile[+] = $smp-bundle-tx
  * insert CSinteraction(#MAY, #read, [[Allows retrieval using extended bundles of a medication list from a repository (if the smp-query operation on List is implemented, the Bundle Medication List profile becomes mandatory).]])
  * insert CSinteraction(#MAY, #create, [[Allows submission of new medication list to a repository (if the smp-submit operation on List is implemented, the Bundle Medication List Maintenance profile becomes mandatory).]])
