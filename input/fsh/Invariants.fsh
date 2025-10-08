Invariant: smp-medication-required
Severity: #error
Description: "One of basedOn, partOf or medicationReference SHALL be populated"
Expression: "basedOn.exists() or medicationReference.exists() or medicationCodeableConcept.exists() or partOf.exists()"