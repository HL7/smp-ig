// Uses the SMPExtemporaneous profiles in this directory and aliases from SMP input/fsh/aliases.fsh.
// Bundle fullUrls and references use matching UUID URNs; resource IDs remain human-readable.

Instance: extemporaneous-preparation-example
InstanceOf: Bundle
Usage: #example
Title: "Extemporaneous Preparation Example"
Description: "Illustrative extemporaneous medication preparation, order, dispense, and medication statement."
* type = #collection
* timestamp = "2026-09-02T10:00:00-04:00"
* entry[0].fullUrl = "urn:uuid:33d93910-728b-5923-8de9-c9e934dbf17a"
* entry[0].resource = extemp-patient-1
* entry[1].fullUrl = "urn:uuid:6ec57711-29d7-5dd7-9816-acc8e18816bb"
* entry[1].resource = extemp-requester-1
* entry[2].fullUrl = "urn:uuid:2fac4966-90ce-5cb0-9613-1a124d6a010d"
* entry[2].resource = extemp-pharmacy-1
* entry[3].fullUrl = "urn:uuid:6b44f131-fd6a-5df4-867b-d82a19bbc36f"
* entry[3].resource = extemp-formula-1
* entry[4].fullUrl = "urn:uuid:b867cab6-f2f3-5bf7-9e9e-53e93f5361e0"
* entry[4].resource = extemp-ingredient-api
* entry[5].fullUrl = "urn:uuid:1ba7ce2f-b43e-514b-8449-0ad39265bc5e"
* entry[5].resource = extemp-ingredient-vehicle
* entry[6].fullUrl = "urn:uuid:3cdcddab-2398-5ff5-be67-5c97820d4927"
* entry[6].resource = extemp-compound-med-1
* entry[7].fullUrl = "urn:uuid:1c2eb3a2-fd76-5739-b1bc-2de6b274a671"
* entry[7].resource = extemp-request-1
* entry[8].fullUrl = "urn:uuid:30dfa9f3-d580-5738-8e05-911bd59017d9"
* entry[8].resource = extemp-dispense-1
* entry[9].fullUrl = "urn:uuid:bc3fe710-e6a2-5c28-837c-06bd048280ba"
* entry[9].resource = extemp-statement-1

Instance: extemp-patient-1
InstanceOf: $us-core-patient
Usage: #inline
* id = "patient-1"
* identifier[0].system = "http://example.org/mrn"
* identifier[0].value = "EX-10001"
* name[0].use = #"official"
* name[0].family = "Example"
* name[0].given[0] = "Jordan"
* gender = #"unknown"
* birthDate = "1942-05-14"

Instance: extemp-requester-1
InstanceOf: Practitioner
Usage: #inline
* id = "requester-1"
* identifier[0].system = "http://example.org/provider-id"
* identifier[0].value = "P-100"
* name[0].family = "Clinician"
* name[0].given[0] = "Avery"

Instance: extemp-pharmacy-1
InstanceOf: Organization
Usage: #inline
* id = "pharmacy-1"
* active = true
* identifier[0].system = "http://example.org/org-id"
* identifier[0].value = "PHARM-01"
* name = "Example Compounding Pharmacy"

Instance: extemp-formula-1
InstanceOf: DocumentReference
Usage: #inline
* id = "formula-1"
* status = #"current"
* type.text = "Validated compounding formula / monograph"
* description = "Illustrative formula reference; the example intentionally does not include clinical manufacturing instructions."
* content[0].attachment.contentType = #"text/html"
* content[0].attachment.url = "https://example.org/formulas/omeprazole-2mg-ml"
* content[0].attachment.title = "Illustrative omeprazole 2 mg/mL formula reference"

Instance: extemp-ingredient-api
InstanceOf: SMPExtemporaneousIngredient
Usage: #inline
* id = "ingredient-api"
* identifier[0].system = "http://example.org/ingredient-catalog"
* identifier[0].value = "ING-OMEP"
* code.coding[0].system = $rxnorm
* code.coding[0].code = #"7646"
* code.coding[0].display = "omeprazole"
* code.text = "omeprazole"
* instance[0].identifier.system = "http://example.org/source-lot"
* instance[0].identifier.value = "API-OMEP-2026-042"
* instance[0].expiry = "2027-03-31T23:59:59-04:00"
* instance[0].quantity.value = 5
* instance[0].quantity.unit = "g"
* instance[0].quantity.system = UOM
* instance[0].quantity.code = #"g"

Instance: extemp-ingredient-vehicle
InstanceOf: SMPExtemporaneousIngredient
Usage: #inline
* id = "ingredient-vehicle"
* identifier[0].system = "http://example.org/ingredient-catalog"
* identifier[0].value = "ING-VEHICLE-01"
* code.text = "Oral suspension vehicle, sugar-free"
* description = "Inactive vehicle; actual product selection and handling are pharmacy-specific."
* instance[0].identifier.system = "http://example.org/source-lot"
* instance[0].identifier.value = "VEH-2026-118"
* instance[0].expiry = "2027-01-31T23:59:59-05:00"
* instance[0].quantity.value = 500
* instance[0].quantity.unit = "mL"
* instance[0].quantity.system = UOM
* instance[0].quantity.code = #"mL"

Instance: extemp-compound-med-1
InstanceOf: SMPExtemporaneousMedication
Usage: #inline
* id = "compound-med-1"
* extension[formulaSource].valueReference.reference = "urn:uuid:6b44f131-fd6a-5df4-867b-d82a19bbc36f"
* extension[preparationInstructions].valueString = "Prepared according to the pharmacy-validated formula identified by formulaSource; manufacturing steps are intentionally omitted from this example."
* extension[storageInstructions].valueString = "Follow the storage and handling directions on the dispensing pharmacy label."
* identifier[0].system = "http://example.org/compound-lot"
* identifier[0].value = "CMP-2026-0901"
// RxNorm ingredient concept; the compounded strength and form are specified separately.
* code.coding[0] = $rxnorm#7646 "omeprazole"
* code.text = "Extemporaneously prepared omeprazole 2 mg/mL oral suspension"
* status = #"active"
* form.text = "Oral suspension"
* ingredient[0].itemReference.reference = "urn:uuid:b867cab6-f2f3-5bf7-9e9e-53e93f5361e0"
* ingredient[0].itemReference.display = "omeprazole"
* ingredient[0].isActive = true
* ingredient[0].strength.numerator.value = 2
* ingredient[0].strength.numerator.unit = "mg"
* ingredient[0].strength.numerator.system = UOM
* ingredient[0].strength.numerator.code = #"mg"
* ingredient[0].strength.denominator.value = 1
* ingredient[0].strength.denominator.unit = "mL"
* ingredient[0].strength.denominator.system = UOM
* ingredient[0].strength.denominator.code = #"mL"
* ingredient[1].itemReference.reference = "urn:uuid:1ba7ce2f-b43e-514b-8449-0ad39265bc5e"
* ingredient[1].itemReference.display = "Oral suspension vehicle, sugar-free"
* ingredient[1].isActive = false
* batch.lotNumber = "CMP-2026-0901"
* batch.expirationDate = "2026-10-01T23:59:59-04:00"

Instance: extemp-request-1
InstanceOf: SMPExtemporaneousMedicationRequest
Usage: #inline
* id = "request-1"
* extension[preparationReason].valueCodeableConcept.text = "Unable to swallow solid oral dosage forms"
* status = #"active"
* intent = #"order"
* medicationReference.reference = "urn:uuid:3cdcddab-2398-5ff5-be67-5c97820d4927"
* subject.reference = "urn:uuid:33d93910-728b-5923-8de9-c9e934dbf17a"
* authoredOn = "2026-08-31"
* requester.reference = "urn:uuid:6ec57711-29d7-5dd7-9816-acc8e18816bb"
* dosageInstruction[0].text = "Take 5 mL by mouth once daily."
* dosageInstruction[0].timing.repeat.frequency = 1
* dosageInstruction[0].timing.repeat.period = 1
* dosageInstruction[0].timing.repeat.periodUnit = #"d"
* dosageInstruction[0].route.text = "Oral route"
* dosageInstruction[0].doseAndRate[0].doseQuantity.value = 5
* dosageInstruction[0].doseAndRate[0].doseQuantity.unit = "mL"
* dosageInstruction[0].doseAndRate[0].doseQuantity.system = UOM
* dosageInstruction[0].doseAndRate[0].doseQuantity.code = #"mL"
* dispenseRequest.quantity.value = 120
* dispenseRequest.quantity.unit = "mL"
* dispenseRequest.quantity.system = UOM
* dispenseRequest.quantity.code = #"mL"
* dispenseRequest.expectedSupplyDuration.value = 24
* dispenseRequest.expectedSupplyDuration.unit = "days"
* dispenseRequest.expectedSupplyDuration.system = UOM
* dispenseRequest.expectedSupplyDuration.code = #"d"
* dispenseRequest.performer.reference = "urn:uuid:2fac4966-90ce-5cb0-9613-1a124d6a010d"

Instance: extemp-dispense-1
InstanceOf: SMPExtemporaneousMedicationDispense
Usage: #inline
* id = "dispense-1"
* status = #"completed"
* medicationReference.reference = "urn:uuid:3cdcddab-2398-5ff5-be67-5c97820d4927"
* subject.reference = "urn:uuid:33d93910-728b-5923-8de9-c9e934dbf17a"
* performer[0].function.text = "Compounding and dispensing pharmacy"
* performer[0].actor.reference = "urn:uuid:2fac4966-90ce-5cb0-9613-1a124d6a010d"
* authorizingPrescription[0].reference = "urn:uuid:1c2eb3a2-fd76-5739-b1bc-2de6b274a671"
* quantity.value = 120
* quantity.unit = "mL"
* quantity.system = UOM
* quantity.code = #"mL"
* whenPrepared = "2026-09-01T09:15:00-04:00"
* whenHandedOver = "2026-09-01T14:30:00-04:00"
* dosageInstruction[0].text = "Take 5 mL by mouth once daily."

Instance: extemp-statement-1
InstanceOf: SMPExtemporaneousMedicationStatement
Usage: #inline
* id = "statement-1"
* basedOn[0].reference = "urn:uuid:1c2eb3a2-fd76-5739-b1bc-2de6b274a671"
* partOf[0].reference = "urn:uuid:30dfa9f3-d580-5738-8e05-911bd59017d9"
* status = #"active"
* medicationReference.reference = "urn:uuid:3cdcddab-2398-5ff5-be67-5c97820d4927"
* subject.reference = "urn:uuid:33d93910-728b-5923-8de9-c9e934dbf17a"
* effectivePeriod.start = "2026-09-01"
* dateAsserted = "2026-09-02T10:00:00-04:00"
* informationSource.reference = "urn:uuid:6ec57711-29d7-5dd7-9816-acc8e18816bb"
* dosage[0].text = "Take 5 mL by mouth once daily."
