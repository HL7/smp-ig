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
* Along with the profiles defined in the SMP implementation guide, implementations **SHALL** also support the US Core R4 profiles for Patient, Practitioner, PractitionerRole, Condition, and Allergy.  They **SHOULD** support any other profiles relevant to the transition process (this includes other implementation guides such as [PACIO Personal Functioning and Engagement](https://www.hl7.org/fhir/us/pacio-pfe/STU1/index.html), other guides will be identified in the forthcoming Transitions of Care IG).

### Detailed Requirements

#### Summary

The primary interaction supported by this implementation guide is POST and GET

The interactions can be comprised of completely RESTful operations for the storage and retrieval of resources but there are situations where the submission of a transaction Bundle containing the primary List resource and all of the associated MedicationStatement resources would be appropriate. 


The first entry in the Bundle **SHALL** be a List resource complying with the MedicationList defined in this IG to ensure the content is sufficient to appropriately populate a full medication list.

All resources **SHALL** comply with their respective profiles.  FHIR elements not marked as 'must support' **MAY** be included in resources, but client systems should have no expectation of such elements being processed.

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


### SMP Workflow Diagrams
Using the base use case scenarios, the following diagrams show the information flows across multiple transitions of care and the use of the SMP profiles to support and enhance the information exchange

The abbreviations that appear in the following workflows are defined as:

| Abbrev. | Expansion |
|  | ----------- |
| EHR | Electronic Health record system |
| HDM | Health Data Manager (a repository or exchange to help locate a patient's records) |
| HHA | Home Health Authority |
| SNF | Skilled Nursing Facility |

All of the information exchanges described in the following sections cover the transitions between care facilities and do not cover the internal events that will update and alter the medication lists during a patient's inpatient stay.

#### A: Home - Pre-stroke

{::options parse_block_html="false" /}
<figure>
  <img style="padding-top:0;padding-bottom:30px" width="800px" src="uc1.png" alt="A placeholder"/>
  <figcaption>Figure A.1 - Home Health recording medications</figcaption>
</figure>
<br/>
{::options parse_block_html="true" /}

<br/><br/>

{% include uc1-seq.svg %}

In the initial diagram the capture of the patient medications, including both prescription and non-prescription items is performed and the information is record via a List resource and MedicationStatement resources as needed
<br/>

#### B: Hospital

{::options parse_block_html="false" /}
<figure>
  <img style="padding-top:0;padding-bottom:30px" width="800px" src="uc2.png" alt="A placeholder"/>
  <figcaption>Figure B.1 - Admission to Hospital following stroke</figcaption>
</figure>
{::options parse_block_html="true" /}

<br/><br/>

{% include uc2-seq.svg %}
<br/>

Following the stroke event the patient is admitted to hospital, previous medications (via the list created in A.1) are reviewed and based on treatment, the hospital administration list is created. When the patient is stabilized and ready for discharge to the rehabilitation facility, the discharge list is created.
<br/>

{% include uc3-seq.svg %}
<br/>

#### C: Skilled Nursing Facility (SNF) - Rehabilitation

{::options parse_block_html="false" /}
<figure>
  <img style="padding-top:0;padding-bottom:30px" width="800px" src="uc3.png" alt="A placeholder"/>
  <figcaption>Figure C.1 - Admission to SNF for Rehab</figcaption>
</figure>
{::options parse_block_html="true" /}

<br/><br/>


{% include uc4-seq.svg %}

<br/>

The hospital discharge list is reviewed and revised to create the administration list for the Skilled Nursing facility (SNF). This list is updated during the patients stay in the facility. As medications are removed from the administration list, they are added to the discontinued medication list.

<br/>

{% include uc5-seq.svg %}

<br/>

When rehabilitation in the SNF is complete the patient is ready to be returned to the home setting. Here the care team at the SNF prepare the SNF Discharge Medication list.
<br/>

#### D: Return to Community/Home
{::options parse_block_html="false" /}
<figure>
  <img style="padding-top:0;padding-bottom:30px" width="800px" src="uc4.png" alt="A placeholder"/>
  <figcaption>Figure D.1 - Return to Community/Home Health</figcaption>
</figure>
{::options parse_block_html="true" /}

<br/><br/>

{% include uc6-seq.svg %}

<br/>

Back in the community, the home care team for the patient review the discharge medication list from the SNF (and may also review previous administration lists and the discontinued medication list), making any recommendations as appropriate and create the new home medication list.
<br/>

#### E: Medication Reconciliation in the Community

{::options parse_block_html="false" /}
<figure>
  <img style="padding-top:0;padding-bottom:30px" width="800px" src="uc5.png" alt="A placeholder"/>
  <figcaption>Figure E.1 - Medication Reconciliation in the Community</figcaption>
</figure>
{::options parse_block_html="true" /}

<br/><br/>
{% include uc7-seq.svg %}

<br/>

The Primary caregivers go to the community pharmacy, the home care team for the patient review the discharge medication list from the SNF (and may also review previous administration lists and the discontinued medication list), making any recommendations as appropriate and create the new home medication list. The community pharmacist provides the medications to the caregiver with instructions, the caregiver can also the current home medication list from the patient portal of the Home Health Authority system.


### Testing Requirements
It is the intent of this implementation guide to provide specifications for the exchange of medication information in a way that is conducive to developing test scripts and a reference implementation (RI) that can be used to validate/exercise the IG at connectathons and during piloting and production deployment. It is also the intent of this guide that any test scripts will include testing of: 

1. resources and profiles defined in this guide
2. artifacts used from referenced IGs such as:
   * PACIO Transitions of Care Implementation Guide - PACIO Transitions of Care Implementation Guide v0.1.0 (paciowg.github.io)
   * [Personal Functioning & Engagement (PFE)](https://build.fhir.org/ig/HL7/fhir-pacio-pfe/)
   * [Physical Activity (PA)](https://build.fhir.org/ig/HL7/physical-activity/)
3. testing of conformance to the underlying FHIR standards for the associated release (e.g. FHIR R4)
