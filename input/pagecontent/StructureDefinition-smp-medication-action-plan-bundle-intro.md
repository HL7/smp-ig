**Usage Notes**
* The Medication Action Plan is a pharmacist-authored document. Consequently, the FHIR bundle is of type _document_.
* The medication action plan bundle will contain at minimum the recommended medication list based on the pharmacist's evaluation. This will be referenced as a url in the `Bundle.link` element. It is not required to include the provenance of all of the curated medication lists used to make this determination.
