/**********
NOTE: Aliases are defined in GlobalAliasList.fsh
**********/
Profile:        SMPMedication
Parent:         USCoreMedicationProfile
Id:             smp-medication
Title:          "Standardized Medication Profile - Medication"
Description:    "Used ."
* ^extension[0].url = "http://hl7.org/fhir/StructureDefinition/structuredefinition-wg"
* ^extension[0].valueCode = #phx
* ^status = #active
* ^publisher = "HL7 Internation / Pharmacy"
* ^contact[0].name = "HL7 International / Pharmacy"
* ^contact[=].telecom.system = #url
* ^contact[=].telecom.value = "http://www.hl7.org/Special/committees/medication"
* ^jurisdiction = urn:iso:std:iso:3166#US "United States of America"
* ^date = "2023-10-16T01:00:00-04:00"
/*****
****/

* code 1..1 MS
* status 1..1 MS


Instance: smp-med-1
InstanceOf: smp-medication
Usage: #example

* meta.versionId = "1"
* meta.lastUpdated = "2023-12-08T06:38:52Z"
* meta.profile = "http://hl7.org/fhir/us/smp/StructureDefinition/smp-medication"
* code = $snomed#10632007
* status = #active
