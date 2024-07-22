Profile:        SMPMedicationList
Parent:         List
Id:             smp-medication-list
Title:          "Standardized Medication Profile - Medication List"
Description:    "The primary mechanism to group a related set of MedicationStatements together for a point in time list (Current administration, Discharge List, Discontinued list). "
* ^extension[0].url = "http://hl7.org/fhir/StructureDefinition/structuredefinition-wg"
* ^extension[0].valueCode = #phx
* ^status = #active
* ^publisher = "HL7 International / Pharmacy"
* ^contact[0].name = "HL7 International / Pharmacy"
* ^contact[=].telecom.system = #url
* ^contact[=].telecom.value = "http://www.hl7.org/Special/committees/medication"
* ^jurisdiction = urn:iso:std:iso:3166#US "United States of America"
* ^date = "2024-02-01T01:00:00-04:00"
/*****
****/

* code from https://cts.nlm.nih.gov/fhir/ValueSet/2.16.840.1.113762.1.4.1096.240 (extensible)
* code 1..1 MS
  * ^short = "Medication list type code"
  * ^comment = "A predetermined LOINC code that defines the list of MedicationStatements"
  * ^binding.description = "The Value Set for the medication list types is maintained at the National Library of Medicine Value Set Authority Center (VSAC)."
//  * ^requirements = "This "

* subject 1..1 MS
* subject only Reference($us-core-patient)
  * ^short = "Patient"
  * ^comment = "The patient the is or has received the medications identified"

* source 1..1 MS
* source only Reference($us-core-practitioner or $us-core-practitionerrole)

* entry.item only Reference($smp-medicationstatement)
  * ^short = "Medication details"
