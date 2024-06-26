This section of the implementation guide defines the specific conformance requirements for systems wishing to conform to Standardized Medication Profile implementation guide.  The RESTful exchanges of resources is the primary means of information exchange but in some situations, a Bundle containing the primary Medication List resources and all of the reference SMP Medication Statements may optimize the exchange.

### Context

#### Pre-reading
Before reading this formal specification, implementers should first familiarize themselves with two other key portions of the specification:

* The [Use Cases & Overview](usecases.html) page provides context for what this formal specification is trying to accomplish and will give a sense of both the business context and general process flow enabled by the formal specification below.

* The [Technical Background](background.html) page provides information about the underlying specifications and indicates what portions of them should be read and understood to have the necessary foundation to understand the constraints and usage guidance described here.


#### Conventions
This implementation guide uses specific terminology to flag statements that have relevance for the evaluation of conformance with the guide:

* **SHALL** indicates requirements that must be met to be conformant with the specification.

* **SHOULD** indicates behaviors that are strongly recommended (and which may result in interoperability issues or sub-optimal behavior if not adhered to), but which do not, for this version of the specification, affect the determination of specification conformance.

* **MAY** describes optional behaviors that are free to consider but where there is no recommendation for or against adoption.


#### Systems

This implementation guide sets expectations for both clients and servers during the transition of care and the exchange of Standardized Medication Profiles. In a transition of care, one FHIR Server for an organization may act as a client to a FHIR Server for a second organization (with additional system configurations and intermediaries possible). For the use case where the organization responsible for patient following the transition is known, the pre-transition organization may push information to the destination. In all cases, the pre-transition organization must be able to support queries for previous medication lists. 


#### Profiles
This specification makes significant use of [FHIR profiles]({{site.data.fhir.path}}profiling.html) and terminology artifacts to describe the content to be shared as part of prior authorization requests and responses.

The full set of profiles defined in this implementation guide can be found by following the links on the [Artifacts](fhirArtifacts.html) page.

#### Integration with other Implementation Guides
* Along with the profiles defined in the SMP implementation guide, implementations **SHALL** also support the US Core R4 profiles for Patient, Practitioner, PractitionerRole, Condition, and Allergy.  They **SHOULD** support any other profiles relevant to the transition process. (*need reference to PFE and Allergy lists @@@*)

### Detailed Requirements

#### Summary

The primary interaction supported by this implementation guide is POST and GET

This Bundle will then be sent as the sole payload of a


The Bundle **SHALL** be encoded in JSON.  The first entry in the Bundle **SHALL** be a XXXXX resource complying with the XXX defined in this IG to ensure the content is sufficient to appropriately populate a .  Additional Bundle entries **SHALL** be populated with any resources referenced by the XXXXX resource (and any resources referenced by *those* resources, fully traversing all references and complying with all identified profiles).  Note that even if a given resource instance is referenced multiple times, it **SHALL** only appear in the Bundle once.  E.g., if the same Practitioner information is referenced in multiple places, only one Practitioner instance should be created - referenced from multiple places as appropriate.  Bundle.entry.fullUrl values **SHALL** be:

* the URL at which the resource is available from the EHR if exposed via the client's REST interface; or
* the form "urn:uuid:[some guid]"  
 
All GUIDs used **SHALL** be unique, including across independent prior authorization submissions - with the exception that the same resource instance being referenced in distinct prior authorization request Bundles can have the same GUID.

All resources **SHALL** comply with their respective profiles.  FHIR elements not marked as 'must support' **MAY** be included in resources, but client systems should have no expectation of such elements being processed.

This IG treats everything that happens beyond the defined operations endpoint receiving the FHIR bundle as a black box.  This black box includes any business associate(s), clearinghouse(s), payers, contracted review entities,  and other intermediaries that may be involved in the PA request and response. It is up to that black box to ensure that any regulatory requirements are met and to perform all processing within the allowed timeframe.


All transactions in SMP are synchronous and **SHALL** require one of the following HTTP responses:

##### HTTP Responses

* 2XX – transaction submission succeeded
* 4XX – transaction failed – bad request - failures are not recoverable by resubmission of the transaction.  There will be an OperationOutcome returned that can be reviewed to determine the actual failure 
* 5XX – transaction failed – service unavailable or timeout - failures that may be temporary and resubmission may result in successful processing.  NOTE that no OperationOutcome will be returned in this instance

If an OperationOutcome is received, it may have information regarding errors that should be addressed in the future, but did not cause the transaction to fail.  NOTE: These errors should not be returned to the provider but should be reviewed and addressed by technical staff.

###### OperationOutcome Data Elements

| Element | Cardinality | Datatype | Information |
| ------- | ----------- | -------- | ----------- |
| Severity | 1..1 | code | fatal, error, warning, information |
| Code | 1..1 | code | IssueType |
| Details | 0..1 | CodeableConcept | additional code that clarifies the issue type |
| Diagnostics | 0..1 | string | addl information (response from validation, TA1, 999) |
| Expression | 0..* | string | FHIRPath of element(s) |


##### SMP Workflow Diagrams
Here are two workflow diagrams that show the forwarding of a medication list, the querying of medication list(s), and optional error handing.

{::options parse_block_html="false" /}
<figure>
  <img style="padding-top:0;padding-bottom:30px" width="800px" src="placeholder-image.jpg" alt="A placeholder"/>
  <figcaption>Figure X.1 - Demonstrating a Image</figcaption>
</figure>
{::options parse_block_html="true" /}



### Testing Requirements
It is the intent of this implementation guide to provide specifications for the exchange of prior authorization in a way that is conducive to developing test scripts and a reference implementation (RI) that can be used to validate/exercise the IG at connectathons and during piloting and production deployment. It is also the intent of this guide that any test scripts will include testing of: 

1. resources and profiles defined in this guide
2. artifacts used from referenced IGs such as DTR and CRD
3. testing of conformance to the underlying FHIR standards for the associated release (e.g. FHIR R4)
