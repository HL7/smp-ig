Profile:        SMPMedicationStatement
Parent:         MedicationStatement
Id:             smp-medicationstatement
Title:          "Standardized Medication Profile - MedicationStatement"
Description:    "The focal resource within the MedicationList that defines a patient's use of a drug or compound"
* ^extension[0].url = "http://hl7.org/fhir/StructureDefinition/structuredefinition-wg"
* ^extension[0].valueCode = #phx
* ^status = #active
* ^publisher = "HL7 International / Pharmacy"
* ^contact[0].name = "HL7 International / Pharmacy"
* ^contact[=].telecom.system = #url
* ^contact[=].telecom.value = "http://www.hl7.org/Special/committees/medication"
* ^jurisdiction = urn:iso:std:iso:3166#US "United States of America"
* ^date = "2024-03-22T08:00:00-04:00"
/*****
****/

* basedOn only Reference($us-core-medicationrequest)

* partOf only Reference($us-core-medicationdispense or $smp-medicationadminitration)

* medicationReference only Reference($smp-medication)

* subject only Reference($us-core-patient)

* informationSource only Reference($us-core-patient or $us-core-practitioner or $us-core-practitionerrole or $us-core-relatedperson)
