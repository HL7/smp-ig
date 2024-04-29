Profile:        SMPMedicationList
Parent:         List
Id:             smp-medication-list
Title:          "Standardized Medication Profile - Medication List"
Description:    "The primary mechanism to group a related set of MedicationStatements together for a point in time list (Current administration, Discharge List, Discontinued list, ..."
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

* code 1..1 MS
  * ^short = "Medication list type code"
  * ^comment = "A predetermined LOINC code that defines the list of MedicationStatements"
//  * ^requirements = "This would usually be the US Core Patient Resource for which the service was performed, however US Core requires an identifier, and that won't necessarily be available/relevant when coverage is being between payers"

* subject 1..1 MS
* subject only Reference($us-core-patient)

* source 1..1 MS
* source only Reference($us-core-practitioner or $us-core-practitionerrole)

* entry.item only Reference($smp-medicationstatement)