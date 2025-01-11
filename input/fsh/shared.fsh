RuleSet: CSresource(resource, profile)
* resource[+]
  * type = {resource}
  * supportedProfile = {profile}

RuleSet: CSinteraction(conformance, type, doc)
* resource[=].interaction[+]
  * extension
    * url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
    * valueCode = {conformance}
  * code = {type}
  * documentation = "{doc}"

RuleSet: CSsearch(conformance, name, url, type, doc)
* resource[=].searchParam[+]
  * extension
    * url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
    * valueCode = {conformance}
  * name = {name}
  * definition = {url}
  * type = {type}
  * documentation = "{doc}"