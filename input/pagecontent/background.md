
### Systems
The SMP implementation guide defines the responsibilities for the exchange of Standardized Medication Profiles.

### Underlying Technologies
This guide is based on the [HL7 FHIR]({{site.data.fhir.path}}index.html) standard.  Implementers of this specification therefore need to understand some basic information about these specifications.

#### FHIR
This implementation guide uses terminology, notations and design principles that are
specific to FHIR.  Before reading this implementation guide, it's important to be familiar with some of the basic principles of FHIR, as well as general guidance on how to read FHIR specifications.  Readers who are unfamiliar with FHIR are encouraged to read (or at least skim) the following prior to reading the rest of this implementation guide.

* [FHIR Overview]({{site.data.fhir.path}}overview.html)
* [Developer's Introduction]({{site.data.fhir.path}}overview-dev.html) (or [Clinical Introduction]({{site.data.fhir.path}}overview-clinical.html))
* [FHIR Data Types]({{site.data.fhir.path}}datatypes.html)
* [Using Codes]({{site.data.fhir.path}}terminologies.html)
* [References between Resources]({{site.data.fhir.path}}references.html)
* [How to Read Resource & Profile Definitions]({{site.data.fhir.path}}formats.html)
* [Base Resource]({{site.data.fhir.path}}resource.html)
* [RESTful Exchanges in FHIR]({{site.data.fhir.path}}http.html)

This implementation guide supports the [R4]({{site.data.fhir.path}}index.html) version of the FHIR standard.

This implementation guide also builds on the [US Core IG 6.1.0](https://hl7.org/fhir/us/core/STU6.1/index.html) Implementation Guide and implementers need to familiarize themselves with the profiles in that IG.

This implementation guide works in alignment with the US CDI release 7.0.

##### Must Support
The Profile elements consist of both Mandatory and Must Support elements. Mandatory elements are elements with a minimum cardinality of 1 (min=1). The base [FHIR Must Support]({{site.data.fhir.path}}profiling.html#mustsupport) guidance requires specifications to define the support expected for profile elements labeled Must Support.  Along with those expectations, the following rules on MustSupport are also required:

* Intermediary Systems **SHALL** be capable of processing all data elements that are marked as Must Support.  They **SHALL** not generate an error or cause the application to fail due the presence of any data element marked as Must Support.
* Intermediary Systems **SHALL** be capable of returning resource instances containing any of the data elements that are marked as Must Support.
* Client Systems **SHALL** be capable of receiving all data elements that are marked as Must Support.  They **SHALL** not generate an error or cause the application to fail when receiving any data element that is marked as Must Support.

### Companion Implementation Guides

This guide focuses on the exchange of medication information during the transitions of care that occur on the patient journey through the health system. There are a number of other guide that deal with other data exchange aspects during transitions of care including Standard Determinants of Health (SDOH) and Personal Functioning and Engagement (PFE). All of these guide including this guide are being grouped and referenced together as part of the PACIO Transitions of Care (ToC) FHIR Implementation Guide.