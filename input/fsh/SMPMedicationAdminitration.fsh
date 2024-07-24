Profile:        SMPMedicationAdministration
Parent:         MedicationAdministration
Id:             smp-medicationadministration
Title:          "Standardized Medication Profile - MedicationAdministration"
Description:    "The resource referenced from a MedicationStatement that defines the actual giving of a drug or compound to a patient. A profile was necessary for SMP to ensure the use of SMP and US Core profiles."
* ^extension[0].url = "http://hl7.org/fhir/StructureDefinition/structuredefinition-wg"
* ^extension[0].valueCode = #phx
* ^status = #active
* ^publisher = "HL7 International / Pharmacy"
* ^contact[0].name = "HL7 International / Pharmacy"
* ^contact[=].telecom.system = #url
* ^contact[=].telecom.value = "http://www.hl7.org/Special/committees/medication"
* ^jurisdiction = urn:iso:std:iso:3166#US "United States of America"
* ^date = "2024-03-22T08:00:00-04:00"

* medication[x] only CodeableConcept or Reference($smp-medication)

* subject only Reference($us-core-patient)

* performer.actor only Reference($us-core-practitioner or $us-core-practitionerrole)

Instance: smp-medadm-1
InstanceOf: smp-medicationadministration
Usage: #example
Description: "Example of a MedicationAdministration resource for a patient's SMP list"
* meta.versionId = "1"
* meta.lastUpdated = "2024-07-08T06:38:52Z"
* meta.profile = "http://hl7.org/fhir/us/smp/StructureDefinition/smp-medicationadministration"

* status = #in-progress
* medicationCodeableConcept = $rxnorm#1545658
* subject.reference = "Patient/example"
* effectiveDateTime = "2024-06-01"
* reasonCode = $snomed#359642000
* dosage.text = "po qd"
* dosage.dose.value = 10
* dosage.dose.system = "http://unitsofmeasure.org"
* dosage.dose.code = #mg