### Purpose and Need
This implementation identifies and defines the components of an interoperable medication profile for clinicians, patients and caregivers to use for the exchange of essential medication information. These exchanges are vitally important to the patient's well-being during transitions of care to and from post-acute care settings but are also applicable to many situations.

The communication of health information, including medications, is critical to ensuring safe and effective transitions from one health care setting to another. Medication errors, poor communication and poor coordination between providers, along with the rising incidence of preventable adverse events and hospital readmissions, have drawn national attention to the importance of the timely transfer of medication information between post-acute care (PAC) providers, including Long-term Care Hospitals(LTCH), Inpatient Rehabilitation Facilities (IRF), Skilled Nursing Facilities (SNF), Home Health Agencies (HHA) and other settings.

About 40% of patients discharged from acute care receive PAC services[^1] and in 2018 Medicare fee-for-service spending on PAC expenditures was $58.6 billion[^2]. However, little is known about the transfer of health information, such as medications, during transitions of care, including the types of medication information transferred or the mode(s) of transfer used.

#### Patient Medication Safety
The exchange of patient medication information during transitions of care, such as admission to and discharge from the hospital, is critical to maintaining patient safety. The 2021 Joint Commission patient safety goal for hospitals to “improve the safety of using medications”[^3] underscores the importance of this care process. To meet this goal, the Joint Commission emphasizes the risk points of medication reconciliation and meeting the standard to “maintain and communicate accurate patient medication information”[^4]. The standard further specifies “coordinating information during transitions of care both within and outside of the organization, patient education on safe medication use and communication with other providers”[^5].

#### Medication Discrepancies
There is compelling evidence to support the significance of adhering to this medication safety standard and medication discrepancies occur during transfers between acute care hospitals and post-acute care settings[^6].

Boockvar and colleagues[^7] examined the link between medication discrepancies at the time of patient transfer and adverse drug events (ADEs) as a health effect in patients transferred between three nursing homes and seven hospitals in New York and Connecticut. They found:[^8]
> that less than 5% of medication discrepancies resulted in an ADE, certain classes of drugs, including opioid analgesics, metronidazole and non-opioid analgesics, had a substantially higher positive predictive value (10%) for an ADE.

In a cohort study of 555 nursing home residents who were transferred from the hospital back to the nursing home:[^9] 
> adverse events developed in four out of ten discharges. Of the 762 discharges, 379 adverse events were reported. ADEs, among the list of the most common types of events in this study, accounted for 16.9% of adverse events.

A systematic review about the prevalence and nature of medication errors and medication-related harm following discharge from hospital to community settings showed: [^A] 
> the median rate of medication error or unintentional medication discrepancy[^B] was about 50% in elderly patients, post-hospital discharge. Additionally, 20% of these patients were reported to experience an ADE after hospital discharge. Antibiotics, antidiabetics, analgesics and cardiovascular drugs were the most common medications reported with an ADE.


### Business Requirements

#### Example Scenario
Although the example and use case reflect a post-acute care (PAC) scenario, this IG is intended to cover the FHIR-based exchange of medication information  between healthcare settings, pharmacies and home- and community-based services (HCBS) broadly.

PAC patients are typically complex from a healthcare perspective and have many stops during their healthcare journey (as shown in Figure 1). As the patient moves from one healthcare setting to another, it is vital that the information on the medications the patient is receiving travel with them so that the new healthcare setting has the most complete information about that patient so they can provide the best care, support effective coordination of care with multiple providers/pharmacists/professionals. Although the example and use case reflect a PAC scenario, this IG is intended to cover the FHIR-based exchange of medication information that is compiled and exchanged between healthcare settings, pharmacies and HCBS broadly.

Figure 1, the example PAC patient healthcare journey, illustrates a common scenario for an elderly patient moving through the healthcare ecosystem. The journey starts with Ms. Smith in her home. She has a medical event that results in an emergency medical service (EMS) transport to Hospital (Setting A). Her previous observational data related to mobility, self-care and domestic life is shared with the hospital. From Hospital (Setting A), Ms. Smith is transferred to a PAC Skilled Nursing Facility (SNF - Setting B). The hospital shares information with the SNF including her performance of the same activities. The SNF completes a Minimum Data Set (MDS) assessment instrument which includes mobility and self-care functioning observation information and electronically transmits the MDS. These observations are shared with Ms. Smith and her care team (Physician, Therapists, Pharmacy, Daughter, etc.). She is discharged from the SNF and returns home with a variety of Home and Community-based Services. The SNF shares information with Ms. Smith, her daughter, her physician and HCBS providers to support care transition and coordination. 


{::options parse_block_html="false" /}
<figure>
  <img style="padding-top:0;padding-bottom:30px" width="800px" src="usecase-diagram.png" alt="A placeholder"/>
  <figcaption>Figure 1 - SMP Example Scenario</figcaption>
</figure>
{::options parse_block_html="true" /}

*Special thanks to the PACIO project for allowing the use of their basic framework example scenario that has been adapted above.*

### Supported Use Cases
In Figure 1, the patient is admitted to Healthcare Setting A due to the result of an adverse event, such as a fall or a stroke. Healthcare setting A treats the patient and records the medications the patient is expected to receive on discharge. The results are captured in the electronic health record (EHR) system of Healthcare Setting A.

Healthcare Setting A transfers the patient to Healthcare Setting B. When the patient arrives at Healthcare Setting B, their clinicians can retrieve the medication profile of the patient at Healthcare Setting A, as part of the transfer summary, using the FHIR profiles for exchanging data defined in this Implementation Guide. Additionally, during the patient’s stay in Healthcare setting B, the clinicians document additional medications.

Healthcare Setting B releases the patient to the community. When the patient or their family , the clinicians can retrieve the results from the functional status assessment instruments that were performed on the patient at Healthcare Setting A and Healthcare Setting B, as part of the transfer summary, using the profiles for exchanging medical data defined in this Implementation Guide.


### Workflow

#### Scope of Work Flow
**In Scope**

The SMP implementation guide covers the exchange of the medication information needed for the reconciliation of medications. The implementation guide also provides information of how the information is forwarded/retrieved in particular during a transition of care from organization to organization.

**Out Of Scope**

As defined by the Joint Commission on Accreditation of Healthcare Organizations (JCAHO), medication reconciliation is "the process of comparing a patient's medication orders to all of the medications that the patient has been taking. This reconciliation is done to avoid medication errors such as omissions, duplications, dosing errors, or drug interactions. MR is separate step from the ordering process.  It is a process performed by different care team members that can lead to medication recommendations to the prescriber for the ordering process. The pharmacists MR process is different from other care team members and requires review of several data points, not just the comparison of one list to another.

The SMP implementation guide does not discuss nor specify the process for medication reconciliation. Medication reconciliation is covered by the professional practices of the individuals performing same. The guide only seeks to ensure that the necessary information is made available or can be retrieved to/by the practitioner as needed.

The SMP implementation guide does not specify the exchange of additional information beyond medication information. Additional information such as personal functioning or allergies are components of the medication reconciliation process however the exchange of this information is documented (see PACIO Transitions of Care implementation Guide) elsewhere and those implementation guides should be used. Drug Allergy information is of particular importance to the medication reconciliation process but is out of scope for this guide. Allergy information can be exchanged using the [International Patient Summary](https://hl7.org/fhir/uv/ips/).

[^1]: [McCarthy (2021)](references.html#mccarthy-2021)
[^2]: [MedPAC (2020)](references.html#medpac-2020)
[^3]: [Joint Commission (2021)](references.html#jc-2021)
[^4]: [Joint Commission (2021)](references.html#jc-2021)
[^5]: [Joint Commission (2021)](references.html#jc-2021)
[^6]: [Boockvar, Fishman, Kyriacou, Monias, Gavi & Cortes (2004)](references.html#boockvar-2004)
[^7]: [Boockvar, K., Liu, S., Goldstein, N., Nebeker, J., Siu, A., & Fried, T. (2009)](references.html#boockvar-2009)
[^8]: [Boockvar et al. (2009)](references.html#boockvar-2009)
[^9]: [Kapoor, Field, Handler, Fisher, Saphirak, Crawford, Fouayzi, Johnson, Spenard, Zang & Gurwitz, (2019)](references.html)
[^A]: [Alqenae, Steinke, Keers (2020)](references.html)
[^B]: An unintentional discrepancy occurs when the prescriber (usually the physician) unintentionally changes, adds or omits a medication the patient was taking prior to admission. Accessed on February 23, 2021 from: [PubMed](https://pubmed.ncbi.nlm.nih.gov/32125666/)