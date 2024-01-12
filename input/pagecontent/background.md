
### Systems
The SMP implementation guide defines the responsibilities for the exchange of XXX

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

This implementation guide supports the [R4]({{site.data.fhir.path}}index.html) version of the FHIR standard.

This implementation guide also builds on the [US Core (STU3 - R4 based)]({{site.data.fhir.hl7_fhir_us_core}}) Implementation Guide and implementers need to familiarize themselves with the profiles in that IG.

##### Must Support
The Profile elements consist of both Mandatory and Must Support elements. Mandatory elements are elements with a minimum cardinality of 1 (min=1). The base [FHIR Must Support]({{site.data.fhir.path}}profiling.html#mustsupport) guidance requires specifications to define the support expected for profile elements labeled Must Support.  Along with those expectations, the following rules on MustSupport are also required:

* Intermediary Systems **SHALL** be capable of processing all data elements that are marked as Must Support on the XXXXXX.  They **SHALL** not generate an error or cause the application to fail due the presence of any data element marked as Must Support.
* Intermediary Systems **SHALL** be capable of returning resource instances containing any of the data elements that are marked as Must Support on the XXXXX.
* Client Systems **SHALL** be capable of receiving all data elements that are marked as Must Support on the XXXXXXXXXXX.  They **SHALL** not generate an error or cause the application to fail when receiving any data element that is marked as Must Support.
* Client Systems **SHOULD NOT** send any data elements that are not marked as Must Support.  If these data elements are included in a XXXXXXXX, the receiving Intermediary System **MAY** ignore those elements.
