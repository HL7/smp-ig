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
- MedicationStatement.status remains the required R4 medication-use state and SHALL NOT be replaced by the adherence extension.
- The adherence extension qualifies whether the medication use, non-use, hold, or stop aligns with the applicable instructions for the same period represented by MedicationStatement.effective[x].
- Implementers SHOULD avoid contradictory status/adherence combinations, such as status = active with adherence = not-taking, status = not-taken with adherence = taking-as-directed, or status = entered-in-error with any adherence value.
- Recommended reconciliation guidance: active may be paired with taking, taking-as-directed, taking-not-as-directed, or unknown; completed may be paired with historical taking-* adherence; not-taken with not-taking; on-hold with on-hold, on-hold-as-directed, or on-hold-not-as-directed; stopped with stopped, stopped-as-directed, or stopped-not-as-directed; intended should normally omit adherence unless adherence is explicitly unknown; entered-in-error should omit adherence.
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

* extension contains $r5-medstatement-adherence named adherence 0..1 MS
* extension[adherence].extension[code] MS
* extension[adherence].extension[code].valueCodeableConcept MS
* extension[adherence].extension[reason] 0..1 MS
* extension[adherence].extension[reason].valueCodeableConcept MS

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
* extension[adherence].extension[code].valueCodeableConcept = $snomed#1156699004 "Adheres to medication regime"
* extension[adherence].extension[code].valueCodeableConcept.text = "taking-as-directed"
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
* medicationCodeableConcept = $rxnorm#597983 "atorvastatin 40 MG"
* subject.reference = "Patient/example"
* effectivePeriod.start = "2024-05-01"
* effectivePeriod.end = "2024-06-01"
* dateAsserted = "2024-07-04"
* reasonCode = $snomed#55822004 "Hyperlipidemia"
* dosage.sequence = 1
* dosage.text = "po bid"

Instance: smp-medstmt-5
InstanceOf: smp-medicationstatement
Usage: #example
Description: "Example of a MedicationStatement for a medication the patient reports not taking"
* meta.versionId = "1"
* meta.lastUpdated = "2023-12-08T06:38:52Z"
* meta.profile = "http://hl7.org/fhir/us/smp/StructureDefinition/smp-medicationstatement"

* status = #not-taken
* medicationCodeableConcept = $rxnorm#597983 "atorvastatin 40 MG"
* subject.reference = "Patient/example"
* effectiveDateTime = "2024-06-01"
* dateAsserted = "2024-07-05"
* reasonCode = $snomed#55822004 "Hyperlipidemia"
* extension[adherence].extension[code].valueCodeableConcept = $snomed#275927006 "Drugs - total non-compliance"
* extension[adherence].extension[code].valueCodeableConcept.text = "not-taking"
* extension[adherence].extension[reason].valueCodeableConcept.text = "Patient reports not taking medication because of side effects."
* dosage.sequence = 1
* dosage.text = "po daily"
