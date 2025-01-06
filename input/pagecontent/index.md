{% raw %}
<blockquote class="stu-note">
<p>
This specification is currently published as a Standard for Trial Use (STU).  Feedback is welcome and may be submitted through the <a href="http://hl7.org/fhir-issues">FHIR change tracker</a> indicating "US SMP" as the specification.
</p>
<p>
This implementation guide is dependent on other specifications.  Please submit any comments you have on these base specifications as follows:
</p>
<ul>
  <li>Feedback on the FHIR core specification should be submitted to the <a href="http://hl7.org/fhir-issues">FHIR change tracker</a> with "FHIR Core" as the specification.</li>
  <li>Feedback on the US core profiles should be submitted to the <a href="http://hl7.org/fhir-issues">FHIR change tracker</a> with "US Core" as the specification.</li>
</ul>
</blockquote>
{% endraw %}

### Plain Language Summary about HL7 and this Guide

#### About HL7
HL7, which stands for Health Level Seven, creates standards to help different healthcare computer systems talk to each other. These HL7 standards are a special language or set of rules that lets information be shared between hospitals, doctors’ offices (e.g. Electronic Health Record Systems), labs, patients (e.g. via patient portals), pharmacies, and insurers, among others.

One of the HL7 standards is HL7 FHIR (Fast Healthcare Interoperability Resources). It helps connect healthcare systems, making it easier for doctors, nurses, and other healthcare professionals to share important information about patients. For example, if you have a lab test at a hospital, HL7 FHIR helps send the results to your doctor’s office so they can provide the right care.

A goal of HL7 is to make sure everyone involved in your healthcare has the right information at the right time. Our standards help machines and people, including you, work together to make better decisions for your health. HL7 sets rules that computer systems follow, so they can understand and share information in a consistent and reliable way.

To learn more about HL7, you can visit the website hl7.org

The people at HL7 make guides that explain how to use the rules (standards) for different things. These guides bring the rules together and show how to use them for specific purposes.

#### About this Guide

The HL7 FHIR Standardized Medication Profile (SMP) Implementation Guide defines a way to transmit medication/drug information (as prescription or orders or records of a patient receiving some kind of medication/drug). As a patient travels through the healthcare system (such as from hospital to nursing facility to home) this guide shows how the medication/drug information can be sent electronically with the patient to enable *medication reconciliation*.

**Medication reconciliation** is a process performed by healthcare professionals (such as pharmacists) to ensure the patient is receiving the correct medications/drugs for their condition and situation. This guide does not define the medication reconciliation process, the guidelines for the process will be established for the specific healthcare profession as a standard of practice. This guides describes how data can be provided so the medication reconciliation is done with the best data available.

### Overview
This Implementation Guide identifies and defines the components of an interoperable medication profile for clinicians, patients and caregivers to use for the exchange of essential medication information. One of the main drivers is the exchange during transitions of care to and from post-acute care settings, however other use cases may also be served by this guide.

### Content and organization
The implementation guide is organized into the following sections:

* [Use Cases and Overview](usecases.html) describes the intent of the implementation guide, gives examples of its use and provides a high-level overview of expected process flow
* [Domains](domains.html) describes the use, motivation, and approach for implementation.
* [Technical Background](background.html) describes the different specifications this implementation guide relies on and indicates what developers should read and understand prior to implementing this specification
* [Formal Specification](specification.html) covers the detailed implementation requirements and conformance expectations
* [Artifacts](fhirArtifacts.html) introduces and provides links to the FHIR [R4](artifacts.html) profiles, operations and other FHIR artifacts used in this implementation guide
* [Downloads](downloads.html) allows download of this and other specifications as well as other useful files
* [References](references.html) formal reference to quoted publications

### Dependencies
This guide is based on the [FHIR R4]({{site.data.fhir.path}}) specification that is mandated for use in the U.S.

In addition, this guide also relies on a number of parent implementation guides:

{% include dependency-table-nontech.xhtml %}

This implementation guide defines additional constraints and usage expectations above and beyond the information found in these base specifications.

### Intellectual Property Considerations
This implementation guide and the underlying FHIR specification are licensed as public domain under the [FHIR license](http://hl7.org/fhir/R4/license.html#license). The license page also describes rules for the use of the FHIR name and logo.

{% include ip-statements.xhtml %}

### Acknowledgements
This implementation guide was created under the supervision and review of the HL7 [Pharmacy Work Group](http://www.hl7.org/Special/committees/medications) (sponsor) with [Patient Care](http://www.hl7.org/Special/Committees/pcwg) (co-sponsor) and [EHR](http://www.hl7.org/Special/Committees/ehr) (co-sponsor) work groups.

This implementation guide was co-developed and balloted with the [National Council for Prescription Drug Programs (NCPDP)](http://www.ncpdp.org)

Organizational participants included: The participants of the NCPDP WG14/WG10 Standardized Medication Profile Task Group

Our thanks to these and to the many others who contributed their time, enthusiasm and expertise to this work.


#### Authors
Primary authors:

| name | organization | contact |
| ---- | ------------ | ------- |
| Andy Stechishin | CANA Software & Services Ltd. | andy@canasoftware.ca |

Guide Author Support:

| name | organization | contact |
| ---- | ------------ |---------|
| Rachelle (Shelly) Spiro | Pharmacy HIT Collaborative | shelly@pharmacyhit.org |

Supporting Resources Provided by the Department of Veterans Affairs:

| name | department                                                   | contact |
| ---- |--------------------------------------------------------------|---------|
| Mary Kay McDaniel | Health System Specialist, KBS Standards and Interoperability | marykay.mcdaniel@outlook.com |

