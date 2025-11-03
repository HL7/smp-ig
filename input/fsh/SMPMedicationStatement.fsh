Invariant: smp-medication-required
Severity: #error
Description: "One of basedOn, partOf or medicationReference SHALL be populated"
Expression: "basedOn.exists() or medicationReference.exists() or medicationCodeableConcept.exists() or partOf.exists()"

Profile:        SMPMedicationStatement
Parent:         MedicationStatement
Id:             smp-medicationstatement
Title:          "Standardized Medication Profile - MedicationStatement"
Description:    """
The description of a medication or drug that a patient is taking or prescribed. Or a medication or drug that a patient did take or was prescribed in the past. MedicationStatement can be created from a number of sources and may be anecdotal which can be useful in the recording of non-prescription, over-the-counter items. MedicationRequest and MedicationAdministration are a formal record of medications prescribed and given.

This profile supports the capture of medication adherence information within the MedicationStatement resource. Implementers SHOULD pre-adopt the FHIR MedicationStatement adherence extension as proposed for future FHIR releases.

- The adherence extension SHOULD be included in MedicationStatement resources when information about a patient's adherence to a medication regimen is available.
- The extension enables documentation of adherence status (e.g., 'taking as prescribed', 'not taking as prescribed') and, where applicable, the reason for non-adherence.
- Systems SHOULD support the extension to facilitate interoperability and the exchange of clinically significant adherence data.
"""
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

* note
  * ^definition = "Provides extra information about the medication statement that is not conveyed by the other attributes, e.g. the approximate supply duration available to the patient or a pending shortage."

* medication[x] only CodeableConcept or Reference($smp-medication)

* subject only Reference($us-core-patient)

* informationSource only Reference($us-core-patient or $us-core-practitioner or $us-core-practitionerrole or $us-core-relatedperson)

* effective[x] MS
* effectiveDateTime MS
* effectivePeriod MS
* dateAsserted MS

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

Instance: smp-medstmt-3
InstanceOf: smp-medicationstatement
Usage: #example
Description: "Example of a MedicationStatement resource in a patient's SMP list for Amlodipine"
* meta.versionId = "1"
* meta.lastUpdated = "2023-12-08T06:38:52Z"
* meta.profile = "http://hl7.org/fhir/us/smp/StructureDefinition/smp-medicationstatement"

* status = #active
* medicationCodeableConcept = $rxnorm#197361 "Amlodipine 5 MG Oral Tablet"
* subject.reference = "Patient/example"
* effectiveDateTime = "2024-06-01"
* dateAsserted = "2024-07-03"
* reasonCode = $snomed#38341003 "Hypertensive disorder, systemic arterial (disorder)"
* dosage.sequence = 1
* dosage.text = "po qd"

Instance: smp-medstmt-4
InstanceOf: smp-medicationstatement
Usage: #example
Description: "Example of a MedicationStatement that uses effectivePeriod instead of effectiveDateTime"
* meta.versionId = "1"
* meta.lastUpdated = "2023-12-08T06:38:52Z"
* meta.profile = "http://hl7.org/fhir/us/smp/StructureDefinition/smp-medicationstatement"

* status = #active
* medicationCodeableConcept = $rxnorm#597983 "atorvastatin 40 MG Oral Tablet"
* subject.reference = "Patient/example"
* effectivePeriod.start = "2024-05-01"
* effectivePeriod.end = "2024-06-01"
* dateAsserted = "2024-07-04"
* reasonCode = $snomed#55822004 "Hyperlipidemia"
* dosage.sequence = 1
* dosage.text = "po bid"