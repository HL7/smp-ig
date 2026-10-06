// Standalone published examples for the extemporaneous profiles and their extensions.
// Uses aliases and parent profiles from the SMP FSH tank.
// Synthetic scenario: see extemporaneous-preparations-guide.md.

Instance: extcomp-patient-1
InstanceOf: $us-core-patient
Usage: #example
Title: "Extemporaneous Preparation - Patient (patient-1)"
Description: "Synthetic Patient example supporting the extemporaneous preparation care-transition scenario."
* identifier[0].system = "http://example.org/mrn"
* identifier[0].value = "EX-10001"
* name[0].use = #official
* name[0].family = "Example"
* name[0].given[0] = "Jordan"
* gender = #unknown
* birthDate = "1942-05-14"

Instance: extcomp-requester-1
InstanceOf: $us-core-practitioner
Usage: #example
Title: "Extemporaneous Preparation - Practitioner - requester-1"
Description: "Synthetic Practitioner example supporting the extemporaneous preparation care-transition scenario."
* identifier[0].system = "http://example.org/provider-id"
* identifier[0].value = "P-100"
* name[0].family = "Clinician"
* name[0].given[0] = "Avery"

Instance: extcomp-pharmacy-1
InstanceOf: $us-core-organization
Usage: #example
Title: "Extemporaneous Preparation - Organization - pharmacy-1"
Description: "Synthetic Organization example supporting the extemporaneous preparation care-transition scenario."
* active = true
* identifier[0].system = "http://example.org/org-id"
* identifier[0].value = "PHARM-01"
* name = "Example Compounding Pharmacy"

Instance: extcomp-formula-1
InstanceOf: DocumentReference
Usage: #example
Title: "Extemporaneous Preparation - DocumentReference (formula-1)"
Description: "Synthetic DocumentReference example supporting the extemporaneous preparation care-transition scenario."
* status = #current
* type.text = "Validated compounding formula / monograph"
* masterIdentifier.system = "http://example.org/formula-registry"
* masterIdentifier.value = "OMEP-2-SUSP-REV-3"
* description = "Synthetic pharmacy-controlled formula revision 3; the attachment URL is illustrative and is not a validated manufacturing protocol."
* date = "2026-08-15T09:00:00-04:00"
* author[0] = Reference(extcomp-pharmacist)
* custodian = Reference(extcomp-pharmacy-1)
* content[0].attachment.contentType = #"text/html"
* content[0].attachment.url = "https://example.org/formulas/omeprazole-2mg-ml"
* content[0].attachment.title = "Illustrative omeprazole 2 mg/mL formula reference"

Instance: extcomp-ingredient-api
InstanceOf: SMPExtemporaneousIngredient
Usage: #example
Title: "Extemporaneous Preparation - Substance (ingredient-api)"
Description: "Synthetic Substance example supporting the extemporaneous preparation care-transition scenario."
* identifier[0].system = "http://example.org/ingredient-catalog"
* identifier[0].value = "ING-OMEP"
* code.coding[0].system = $rxnorm
* code.coding[0].code = #7646
* code.coding[0].display = "omeprazole"
* code.text = "omeprazole"
* description = "Active ingredient source material; this instance identifies the source container used for traceability."
* instance[0].identifier.system = "http://example.org/source-lot"
* instance[0].identifier.value = "API-OMEP-2026-042"
* instance[0].expiry = "2027-03-31T23:59:59-04:00"
* instance[0].quantity.value = 5
* instance[0].quantity.unit = "g"
* instance[0].quantity.system = UOM
* instance[0].quantity.code = #g

Instance: extcomp-ingredient-vehicle
InstanceOf: SMPExtemporaneousIngredient
Usage: #example
Title: "Extemporaneous Preparation - Substance (ingredient-vehicle)"
Description: "Synthetic Substance example supporting the extemporaneous preparation care-transition scenario."
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
* instance[0].quantity.code = #mL

Instance: extcomp-compound-med-1
InstanceOf: SMPExtemporaneousMedication
Usage: #example
Title: "Extemporaneous Preparation - Medication (compound-med-1)"
Description: "Synthetic Medication example supporting the extemporaneous preparation care-transition scenario."
* extension[formulaSource].valueReference = Reference(extcomp-formula-1)
* extension[preparationInstructions].valueString = "Use the pharmacy-controlled formula revision identified by formulaSource. The final product is labeled for this patient; detailed preparation steps remain in the pharmacy record."
* extension[storageInstructions].valueString = "Keep in the original labeled container and follow the dispensing pharmacy label for temperature, handling, and discard instructions. Contact the pharmacy if those instructions are missing."
* identifier[0].system = "http://example.org/compound-lot"
* identifier[0].value = "CMP-2026-0901"
* code.coding[0] = http://example.org/compound-catalog#OMEP-2-SUSP "Omeprazole 2 mg/mL oral suspension"
* code.text = "Extemporaneously prepared omeprazole 2 mg/mL oral suspension"
* status = #active
* form.text = "Oral suspension"
* ingredient[0].itemReference = Reference(extcomp-ingredient-api)
* ingredient[0].itemReference.display = "omeprazole"
* ingredient[0].isActive = true
* ingredient[0].strength.numerator.value = 2
* ingredient[0].strength.numerator.unit = "mg"
* ingredient[0].strength.numerator.system = UOM
* ingredient[0].strength.numerator.code = #mg
* ingredient[0].strength.denominator.value = 1
* ingredient[0].strength.denominator.unit = "mL"
* ingredient[0].strength.denominator.system = UOM
* ingredient[0].strength.denominator.code = #mL
* ingredient[1].itemReference = Reference(extcomp-ingredient-vehicle)
* ingredient[1].itemReference.display = "Oral suspension vehicle, sugar-free"
* ingredient[1].isActive = false
* batch.lotNumber = "CMP-2026-0901"
* batch.expirationDate = "2026-10-01T23:59:59-04:00"

Instance: extcomp-request-1
InstanceOf: SMPExtemporaneousMedicationRequest
Usage: #example
Title: "Extemporaneous Preparation - MedicationRequest (request-1)"
Description: "Synthetic MedicationRequest example supporting the extemporaneous preparation care-transition scenario."
* extension[preparationReason].valueCodeableConcept.text = "Unable to swallow solid oral dosage forms"
* status = #active
* intent = #order
* medicationReference = Reference(extcomp-compound-med-1)
* subject = Reference(extcomp-patient-1)
* authoredOn = "2026-08-31"
* requester = Reference(extcomp-requester-1)
* dosageInstruction[0].text = "Take 5 mL by mouth once daily."
* dosageInstruction[0].timing.repeat.frequency = 1
* dosageInstruction[0].timing.repeat.period = 1
* dosageInstruction[0].timing.repeat.periodUnit = #d
* dosageInstruction[0].route.text = "Oral route"
* dosageInstruction[0].doseAndRate[0].doseQuantity.value = 5
* dosageInstruction[0].doseAndRate[0].doseQuantity.unit = "mL"
* dosageInstruction[0].doseAndRate[0].doseQuantity.system = UOM
* dosageInstruction[0].doseAndRate[0].doseQuantity.code = #mL
* dispenseRequest.quantity.value = 120
* dispenseRequest.quantity.unit = "mL"
* dispenseRequest.quantity.system = UOM
* dispenseRequest.quantity.code = #mL
* dispenseRequest.expectedSupplyDuration.value = 24
* dispenseRequest.expectedSupplyDuration.unit = "days"
* dispenseRequest.expectedSupplyDuration.system = UOM
* dispenseRequest.expectedSupplyDuration.code = #d
* dispenseRequest.performer = Reference(extcomp-pharmacy-1)

Instance: extcomp-dispense-1
InstanceOf: SMPExtemporaneousMedicationDispense
Usage: #example
Title: "Extemporaneous Preparation - MedicationDispense (dispense-1)"
Description: "Synthetic MedicationDispense example supporting the extemporaneous preparation care-transition scenario."
* status = #completed
* medicationReference = Reference(extcomp-compound-med-1)
* subject = Reference(extcomp-patient-1)
* performer[0].function.text = "Compounding and dispensing pharmacy"
* performer[0].actor = Reference(extcomp-pharmacy-1)
* location = Reference(extcomp-location)
* performer[1].function.text = "Pharmacist reviewing the prepared product and counseling the patient"
* performer[1].actor = Reference(extcomp-pharmacist)
* authorizingPrescription[0] = Reference(extcomp-request-1)
* quantity.value = 120
* quantity.unit = "mL"
* quantity.system = UOM
* quantity.code = #mL
* whenPrepared = "2026-09-01T09:15:00-04:00"
* whenHandedOver = "2026-09-01T14:30:00-04:00"
* dosageInstruction[0].text = "Take 5 mL by mouth once daily."
* dosageInstruction[0].timing.repeat.frequency = 1
* dosageInstruction[0].timing.repeat.period = 1
* dosageInstruction[0].timing.repeat.periodUnit = #d
* dosageInstruction[0].route.text = "Oral route"
* dosageInstruction[0].doseAndRate[0].doseQuantity.value = 5
* dosageInstruction[0].doseAndRate[0].doseQuantity.unit = "mL"
* dosageInstruction[0].doseAndRate[0].doseQuantity.system = UOM
* dosageInstruction[0].doseAndRate[0].doseQuantity.code = #mL

Instance: extcomp-statement-1
InstanceOf: SMPExtemporaneousMedicationStatement
Usage: #example
Title: "Extemporaneous Preparation - MedicationStatement (statement-1)"
Description: "Synthetic MedicationStatement example supporting the extemporaneous preparation care-transition scenario."
* basedOn[0] = Reference(extcomp-request-1)
* partOf[0] = Reference(extcomp-dispense-1)
* status = #active
* medicationReference = Reference(extcomp-compound-med-1)
* subject = Reference(extcomp-patient-1)
* effectivePeriod.start = "2026-09-01"
* dateAsserted = "2026-09-02T10:00:00-04:00"
* note[0].text = "At care-transition reconciliation, Avery Clinician confirmed the pharmacy label, concentration, dose volume, batch, and discard date with Jordan and the pharmacy. No change to the order was made."
* informationSource = Reference(extcomp-requester-1)
* dosage[0].text = "Take 5 mL by mouth once daily."
* dosage[0].timing.repeat.frequency = 1
* dosage[0].timing.repeat.period = 1
* dosage[0].timing.repeat.periodUnit = #d
* dosage[0].route.text = "Oral route"
* dosage[0].doseAndRate[0].doseQuantity.value = 5
* dosage[0].doseAndRate[0].doseQuantity.unit = "mL"
* dosage[0].doseAndRate[0].doseQuantity.system = UOM
* dosage[0].doseAndRate[0].doseQuantity.code = #mL

Instance: extcomp-pharmacist
InstanceOf: $us-core-practitioner
Usage: #example
Title: "Extemporaneous Preparation - Practitioner (pharmacist)"
Description: "Synthetic Practitioner example supporting the extemporaneous preparation care-transition scenario."
* identifier[0].system = "http://example.org/provider-id"
* identifier[0].value = "PH-200"
* name[0].family = "Pharmacist"
* name[0].given[0] = "Morgan"

Instance: extcomp-location
InstanceOf: Location
Usage: #example
Title: "Extemporaneous Preparation - Location (location)"
Description: "Synthetic Location example supporting the extemporaneous preparation care-transition scenario."
* status = #active
* name = "Example Compounding Pharmacy - preparation and dispensing site"
* managingOrganization = Reference(extcomp-pharmacy-1)
