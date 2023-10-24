<blockquote class="stu-note">
<p><b>Note to Commenters:</b>
profiles that cover all domains.
</p>
</blockquote>
<br>


### Use

The [supplemental guide](https://confluence.hl7.org/display/PC/Supplemental+Guide) provides a mapping of health and health-related domains that fall under the personal functioning and engagement umbrella. Implementers of this IG **SHOULD** include at least one category from the XXX on each observation instance conformant to this guide. Additionally, the code of the instance **SHOULD** come from the value set associated with the indicated category or categories. 

### Motivation and Approach

Standards designers and implementers face many challenges when attempting to enable scalable and meaningful interoperability between health IT systems. Two specific ones that this IG engages with are
- **Low Friction Communication**: How to generate agreement and consensus about the structure of and terminology used to communicate data so that implementers can adopt the IG consistently enough to support exchange with minimal partner-specific handling and thus realize a reduction in the administrative overhead associated with communication of this information.
- **Understanding and Use**: How to support the effective use of the data by clinicians and other users so the system can realize the intended benefits of the sharing of this data, namely improved care and reduced costs.

Categorization of observations into health domains based on International Classification of Functioning, Disability and Health (commonly known as ICF) categories provides opportunities to address these challenges.

#### Low Friction Communication

Categorization of functioning and engagement observations into health domains reduce the set of conformant data by allowing categories to be tied to specific value sets that limit the set of valid observation codes. This mechanism supports the development of consistent implementation of the standards, which in turn enables interoperability, by
- clearly defining a subset of codes that must be understood and accepted by the system that is much smaller than typical general requirements (e.g., all of LOINC)
- supporting validation of inbound data and rejection of messages that do not conform

#### Understanding and Use

The collection of person's functioning and engagement varies between care settings. Comprehension and use of information communicated from one setting to another should not require a detailed understanding of the collection mechanisms. By categorizing observations into health domains, health IT systems can organize received data in a clinically relevant way.

