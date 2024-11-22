Invariant: smp-medication-required
Severity: #error
Description: "One of basedOn, partOf or medicationReference SHALL be populated"
Expression: "basedOn.exists() or medicationReference.exists() or medicationCodeableConcept.exists() or partOf.exists()"

Profile:        SMPMedicationStatement
Parent:         MedicationStatement
Id:             smp-medicationstatement
Title:          "Standardized Medication Profile - MedicationStatement"
Description:    "The description of a medication or drug that a patient is taking or prescribed. Or a medication or drug that a patient did take or was prescribed in the past."
* ^extension[0].url = "http://hl7.org/fhir/StructureDefinition/structuredefinition-wg"
* ^extension[0].valueCode = #phx
* ^status = #active
* ^publisher = "HL7 International / Pharmacy"
* ^contact[0].name = "HL7 International / Pharmacy"
* ^contact[=].telecom.system = #url
* ^contact[=].telecom.value = "http://www.hl7.org/Special/committees/medication"
* ^jurisdiction = urn:iso:std:iso:3166#US "United States of America"
* ^date = "2024-03-22T08:00:00-04:00"
* ^purpose = "The focal resource within the MedicationList profile of List"

/*****
****/

* basedOn only Reference($us-core-medicationrequest)

* partOf only Reference($us-core-medicationdispense or $smp-medicationadministration)

* medication[x] only CodeableConcept or Reference($smp-medication)

* subject only Reference($us-core-patient)

* informationSource only Reference($us-core-patient or $us-core-practitioner or $us-core-practitionerrole or $us-core-relatedperson)

* dosage MS

Instance: smp-medstmt-1
InstanceOf: smp-medicationstatement
Usage: #example
Description: "Example of a MedicationStatement resource in a patient's SMP list"
* meta.versionId = "1"
* meta.lastUpdated = "2023-12-08T06:38:52Z"
* meta.profile = "http://hl7.org/fhir/us/smp/StructureDefinition/smp-medicationstatement"

* status = #active
* medicationCodeableConcept = $rxnorm#428759
* subject.reference = "Patient/example"
* effectiveDateTime = "2024-06-01"
* dateAsserted = "2024-07-01"
* reasonCode = $snomed#359642000
* dosage.sequence = 1
* dosage.text = "po daily"

Instance: smp-medstmt-2
InstanceOf: smp-medicationstatement
Usage: #example
Description: "Example of a MedicationStatement resource in a patient's SMP list with a reference to a MedicationAdministration"
* meta.versionId = "1"
* meta.lastUpdated = "2023-12-08T06:38:52Z"
* meta.profile = "http://hl7.org/fhir/us/smp/StructureDefinition/smp-medicationstatement"
* partOf.reference = "MedicationAdministration/smp-medadm-1"
* status = #active
* medicationCodeableConcept = $rxnorm#1545658
* subject.reference = "Patient/example"
* effectiveDateTime = "2024-06-01"
* dateAsserted = "2024-07-02"
* reasonCode = $snomed#359642000
* dosage.sequence = 1
* dosage.text = "po qd"
