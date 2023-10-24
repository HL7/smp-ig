
Complying with this implementation guide means complying with a number of profiles, extensions, value sets and custom search parameters.  This page provides an overview of where this information can be found.

The FHIR artifacts used by SMP are organized according to whether the content developed as part of the US Core implementation guides or is SMP-specific.

### Artifact Lists
<table>
  <tr>
    <td><a href="artifacts.html">FHIR SMP-specific Artifacts</a></td>
  </tr>
  <tr>
    <td><a href="{{site.data.fhir.ver.hl7_fhir_us_core}}">US Core</a></td>
  </tr>
</table>

Additional information about the use of these artifacts can be found in the [main specification](specification.html#profiles).


The artifacts are of four types:

* [Profiles]({{site.data.fhir.path}}profiling.html) constrain FHIR resources to reflect PAS requirements
* [Extensions]({{site.data.fhir.path}}extensibility.html) define additional data elements that can be conveyed as part of a resource
* [Code Systems]({{site.data.fhir.path}}codesystem.html) define SMP-specific terminologies to be used in one or more of those profiles
* [Value Sets]({{site.data.fhir.path}}valueset.html) define the specific subsets of both PAS-defined and other code systems that can be (or are recommended to be) used within one or more profile elements


### Cross-Version Analysis
{% include cross-version-analysis.xhtml %}

### Intellectual Property Statements
{% include ip-statements.xhtml %}

### Global Profiles
{% include globals-table.xhtml %}

### IG Dependencies

This IG Contains the following dependencies on other IGs.

{% include dependency-table.xhtml %}