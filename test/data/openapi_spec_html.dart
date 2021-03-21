final openapiSpecHTMLString = r'''
<h1>OpenAPI Specification</h1>
<h4>Version 3.0.1</h4>
<p>The key words "MUST", "MUST NOT", "REQUIRED", "SHALL", "SHALL NOT", "SHOULD", "SHOULD NOT", "RECOMMENDED", "NOT RECOMMENDED", "MAY", and "OPTIONAL" in this document are to be interpreted as described in <a href="https://tools.ietf.org/html/bcp14">BCP 14</a> <a href="https://tools.ietf.org/html/rfc2119">RFC2119</a> <a href="https://tools.ietf.org/html/rfc8174">RFC8174</a> when, and only when, they appear in all capitals, as shown here.</p>
<p>This document is licensed under <a href="https://www.apache.org/licenses/LICENSE-2.0.html">The Apache License, Version 2.0</a>.</p>
<h2>Introduction</h2>
<p>The OpenAPI Specification (OAS) defines a standard, language-agnostic interface to RESTful APIs which allows both humans and computers to discover and understand the capabilities of the service without access to source code, documentation, or through network traffic inspection. When properly defined, a consumer can understand and interact with the remote service with a minimal amount of implementation logic.</p>
<p>An OpenAPI definition can then be used by documentation generation tools to display the API, code generation tools to generate servers and clients in various programming languages, testing tools, and many other use cases.</p>
<h2>Table of Contents</h2><!-- TOC depthFrom:1 depthTo:3 withLinks:1 updateOnSave:1 orderedList:0 -->
<ul>
<li><a href="#definitions">Definitions</a>
<ul>
<li><a href="#oasDocument">OpenAPI Document</a></li>
<li><a href="#pathTemplating">Path Templating</a></li>
<li><a href="#mediaTypes">Media Types</a></li>
<li><a href="#httpCodes">HTTP Status Codes</a></li>
</ul>
</li>
<li><a href="#specification">Specification</a>
<ul>
<li><a href="#versions">Versions</a></li>
<li><a href="#format">Format</a></li>
<li><a href="#documentStructure">Document Structure</a></li>
<li><a href="#dataTypes">Data Types</a></li>
<li><a href="#richText">Rich Text Formatting</a></li>
<li><a href="#relativeReferences">Relative References In URLs</a></li>
<li><a href="#schema">Schema</a>
<ul>
<li><a href="#oasObject">OpenAPI Object</a></li>
<li><a href="#infoObject">Info Object</a></li>
<li><a href="#contactObject">Contact Object</a></li>
<li><a href="#licenseObject">License Object</a></li>
<li><a href="#serverObject">Server Object</a></li>
<li><a href="#serverVariableObject">Server Variable Object</a></li>
<li><a href="#componentsObject">Components Object</a></li>
<li><a href="#pathsObject">Paths Object</a></li>
<li><a href="#pathItemObject">Path Item Object</a></li>
<li><a href="#operationObject">Operation Object</a></li>
<li><a href="#externalDocumentationObject">External Documentation Object</a></li>
<li><a href="#parameterObject">Parameter Object</a></li>
<li><a href="#requestBodyObject">Request Body Object</a></li>
<li><a href="#mediaTypeObject">Media Type Object</a></li>
<li><a href="#encodingObject">Encoding Object</a></li>
<li><a href="#responsesObject">Responses Object</a></li>
<li><a href="#responseObject">Response Object</a></li>
<li><a href="#callbackObject">Callback Object</a></li>
<li><a href="#exampleObject">Example Object</a></li>
<li><a href="#linkObject">Link Object</a></li>
<li><a href="#headerObject">Header Object</a></li>
<li><a href="#tagObject">Tag Object</a></li>
<li><a href="#referenceObject">Reference Object</a></li>
<li><a href="#schemaObject">Schema Object</a></li>
<li><a href="#discriminatorObject">Discriminator Object</a></li>
<li><a href="#xmlObject">XML Object</a></li>
<li><a href="#securitySchemeObject">Security Scheme Object</a></li>
<li><a href="#oauthFlowsObject">OAuth Flows Object</a></li>
<li><a href="#oauthFlowObject">OAuth Flow Object</a></li>
<li><a href="#securityRequirementObject">Security Requirement Object</a></li>
</ul>
</li>
<li><a href="#specificationExtensions">Specification Extensions</a></li>
<li><a href="#securityFiltering">Security Filtering</a></li>
</ul>
</li>
<li><a href="#revisionHistory">Appendix A: Revision History</a></li>
</ul><!-- /TOC -->
<h2>Definitions</h2>
<h5><a name="oasDocument"></a>OpenAPI Document</h5>
<p>A document (or set of documents) that defines or describes an API. An OpenAPI definition uses and conforms to the OpenAPI Specification.</p>
<h5><a name="pathTemplating"></a>Path Templating</h5>
<p>Path templating refers to the usage of curly braces ({}) to mark a section of a URL path as replaceable using path parameters.</p>
<h5><a name="mediaTypes"></a>Media Types</h5>
<p>Media type definitions are spread across several resources.
The media type definitions SHOULD be in compliance with <a href="https://tools.ietf.org/html/rfc6838">RFC6838</a>.</p>
<p>Some examples of possible media type definitions:</p>
<pre><code>  text/plain; charset=utf-8
  application/json
  application/vnd.github+json
  application/vnd.github.v3+json
  application/vnd.github.v3.raw+json
  application/vnd.github.v3.text+json
  application/vnd.github.v3.html+json
  application/vnd.github.v3.full+json
  application/vnd.github.v3.diff
  application/vnd.github.v3.patch
</code></pre>
<h5><a name="httpCodes"></a>HTTP Status Codes</h5>
<p>The HTTP Status Codes are used to indicate the status of the executed operation. 
The available status codes are defined by <a href="https://tools.ietf.org/html/rfc7231#section-6">RFC7231</a> and registered status codes are listed in the <a href="https://www.iana.org/assignments/http-status-codes/http-status-codes.xhtml">IANA Status Code Registry</a>.</p>
<h2>Specification</h2>
<h3>Versions</h3>
<p>The OpenAPI Specification is versioned using <a href="https://semver.org/spec/v2.0.0.html">Semantic Versioning 2.0.0</a> (semver) and follows the semver specification.</p>
<p>The <code>major</code>.<code>minor</code> portion of the semver (for example <code>3.0</code>) SHALL designate the OAS feature set. Typically, <em><code>.patch</code></em> versions address errors in this document, not the feature set. Tooling which supports OAS 3.0 SHOULD be compatible with all OAS 3.0.* versions. The patch version SHOULD NOT be considered by tooling, making no distinction between <code>3.0.0</code> and <code>3.0.1</code> for example.</p>
<p>Subsequent minor version releases of the OpenAPI Specification (incrementing the <code>minor</code> version number) SHOULD NOT interfere with tooling developed to a lower minor version and same major version.  Thus a hypothetical <code>3.1.0</code> specification SHOULD be usable with tooling designed for <code>3.0.0</code>.</p>
<p>An OpenAPI document compatible with OAS 3.*.* contains a required <a href="#oasVersion"><code>openapi</code></a> field which designates the semantic version of the OAS that it uses. (OAS 2.0 documents contain a top-level version field named <a href="https://github.com/OAI/OpenAPI-Specification/blob/master/versions/2.0.md#swaggerObject"><code>swagger</code></a> and value <code>"2.0"</code>.)</p>
<h3>Format</h3>
<p>An OpenAPI document that conforms to the OpenAPI Specification is itself a JSON object, which may be represented either in JSON or YAML format.</p>
<p>For example, if a field has an array value, the JSON array representation will be used:</p>
<pre><code class="language-json">{
   "field": [ 1, 2, 3 ]
}
</code></pre>
<p>All field names in the specification are <strong>case sensitive</strong>.</p>
<p>The schema exposes two types of fields: Fixed fields, which have a declared name, and Patterned fields, which declare a regex pattern for the field name.</p>
<p>Patterned fields MUST have unique names within the containing object.</p>
<p>In order to preserve the ability to round-trip between YAML and JSON formats, YAML version <a href="http://www.yaml.org/spec/1.2/spec.html">1.2</a> is RECOMMENDED along with some additional constraints:</p>
<ul>
<li>Tags MUST be limited to those allowed by the <a href="http://www.yaml.org/spec/1.2/spec.html#id2803231">JSON Schema ruleset</a>.</li>
<li>Keys used in YAML maps MUST be limited to a scalar string, as defined by the <a href="http://yaml.org/spec/1.2/spec.html#id2802346">YAML Failsafe schema ruleset</a>.</li>
</ul>
<p><strong>Note:</strong> While APIs may be defined by OpenAPI documents in either YAML or JSON format, the API request and response bodies and other content are not required to be JSON or YAML.</p>
<h3><a name="documentStructure"></a>Document Structure</h3>
<p>An OpenAPI document MAY be made up of a single document or be divided into multiple, connected parts at the discretion of the user. In the latter case, <code>$ref</code> fields MUST be used in the specification to reference those parts as follows from the <a href="http://json-schema.org">JSON Schema</a> definitions.</p>
<p>It is RECOMMENDED that the root OpenAPI document be named: <code>openapi.json</code> or <code>openapi.yaml</code>.</p>
<h3><a name="dataTypes"></a>Data Types</h3>
<p>Primitive data types in the OAS are based on the types supported by the <a href="https://tools.ietf.org/html/draft-wright-json-schema-00#section-4.2">JSON Schema Specification Wright Draft 00</a>. 
Note that <code>integer</code> as a type is also supported and is defined as a JSON number without a fraction or exponent part. 
<code>null</code> is not supported as a type (see <a href="#schemaNullable"><code>nullable</code></a> for an alternative solution).
Models are defined using the <a href="#schemaObject">Schema Object</a>, which is an extended subset of JSON Schema Specification Wright Draft 00.</p>
<p><a name="dataTypeFormat"></a>Primitives have an optional modifier property: <code>format</code>.
OAS uses several known formats to define in fine detail the data type being used.
However, to support documentation needs, the <code>format</code> property is an open <code>string</code>-valued property, and can have any value.
Formats such as <code>"email"</code>, <code>"uuid"</code>, and so on, MAY be used even though undefined by this specification.
Types that are not accompanied by a <code>format</code> property follow the type definition in the JSON Schema. Tools that do not recognize a specific <code>format</code> MAY default back to the <code>type</code> alone, as if the <code>format</code> is not specified.</p>
<p>The formats defined by the OAS are:</p>
<p>Common Name | <a href="#dataTypes"><code>type</code></a> | <a href="#dataTypeFormat"><code>format</code></a> | Comments
----------- | ------ | -------- | --------
integer | <code>integer</code> | <code>int32</code> | signed 32 bits
long | <code>integer</code> | <code>int64</code> | signed 64 bits
float | <code>number</code> | <code>float</code> | |
double | <code>number</code> | <code>double</code> | |
string | <code>string</code> | | |
byte | <code>string</code> | <code>byte</code> | base64 encoded characters
binary | <code>string</code> | <code>binary</code> | any sequence of octets
boolean | <code>boolean</code> | | |
date | <code>string</code> | <code>date</code> | As defined by <code>full-date</code> - <a href="https://xml2rfc.ietf.org/public/rfc/html/rfc3339.html#anchor14">RFC3339</a>
dateTime | <code>string</code> | <code>date-time</code> | As defined by <code>date-time</code> - <a href="https://xml2rfc.ietf.org/public/rfc/html/rfc3339.html#anchor14">RFC3339</a>
password | <code>string</code> | <code>password</code> | A hint to UIs to obscure input.</p>
<h3><a name="richText"></a>Rich Text Formatting</h3>
<p>Throughout the specification <code>description</code> fields are noted as supporting CommonMark markdown formatting.
Where OpenAPI tooling renders rich text it MUST support, at a minimum, markdown syntax as described by <a href="http://spec.commonmark.org/0.27/">CommonMark 0.27</a>. Tooling MAY choose to ignore some CommonMark features to address security concerns.</p>
<h3><a name="relativeReferences"></a>Relative References in URLs</h3>
<p>Unless specified otherwise, all properties that are URLs MAY be relative references as defined by <a href="https://tools.ietf.org/html/rfc3986#section-4.2">RFC3986</a>.
Relative references are resolved using the URLs defined in the <a href="#serverObject"><code>Server Object</code></a> as a Base URI.</p>
<p>Relative references used in <code>$ref</code> are processed as per <a href="https://tools.ietf.org/html/draft-pbryan-zyp-json-ref-03">JSON Reference</a>, using the URL of the current document as the base URI. See also the <a href="#referenceObject">Reference Object</a>.</p>
<h3>Schema</h3>
<p>In the following description, if a field is not explicitly <strong>REQUIRED</strong> or described with a MUST or SHALL, it can be considered OPTIONAL.</p>
<h4><a name="oasObject"></a>OpenAPI Object</h4>
<p>This is the root document object of the <a href="#oasDocument">OpenAPI document</a>.</p>
<h5>Fixed Fields</h5>
<p>Field Name | Type | Description
---|:---:|---
<a name="oasVersion"></a>openapi | <code>string</code> | <strong>REQUIRED</strong>. This string MUST be the <a href="https://semver.org/spec/v2.0.0.html">semantic version number</a> of the <a href="#versions">OpenAPI Specification version</a> that the OpenAPI document uses. The <code>openapi</code> field SHOULD be used by tooling specifications and clients to interpret the OpenAPI document. This is <em>not</em> related to the API <a href="#infoVersion"><code>info.version</code></a> string.
<a name="oasInfo"></a>info | <a href="#infoObject">Info Object</a> | <strong>REQUIRED</strong>. Provides metadata about the API. The metadata MAY be used by tooling as required.
<a name="oasServers"></a>servers | [<a href="#serverObject">Server Object</a>] | An array of Server Objects, which provide connectivity information to a target server. If the <code>servers</code> property is not provided, or is an empty array, the default value would be a <a href="#serverObject">Server Object</a> with a <a href="#serverUrl">url</a> value of <code>/</code>.
<a name="oasPaths"></a>paths | <a href="#pathsObject">Paths Object</a> | <strong>REQUIRED</strong>. The available paths and operations for the API.
<a name="oasComponents"></a>components | <a href="#componentsObject">Components Object</a> | An element to hold various schemas for the specification.
<a name="oasSecurity"></a>security | [<a href="#securityRequirementObject">Security Requirement Object</a>] | A declaration of which security mechanisms can be used across the API. The list of values includes alternative security requirement objects that can be used. Only one of the security requirement objects need to be satisfied to authorize a request. Individual operations can override this definition.
<a name="oasTags"></a>tags | [<a href="#tagObject">Tag Object</a>] | A list of tags used by the specification with additional metadata. The order of the tags can be used to reflect on their order by the parsing tools. Not all tags that are used by the <a href="#operationObject">Operation Object</a> must be declared. The tags that are not declared MAY be organized randomly or based on the tools' logic. Each tag name in the list MUST be unique.
<a name="oasExternalDocs"></a>externalDocs | <a href="#externalDocumentationObject">External Documentation Object</a> | Additional external documentation.</p>
<p>This object MAY be extended with <a href="#specificationExtensions">Specification Extensions</a>.</p>
<h4><a name="infoObject"></a>Info Object</h4>
<p>The object provides metadata about the API.
The metadata MAY be used by the clients if needed, and MAY be presented in editing or documentation generation tools for convenience.</p>
<h5>Fixed Fields</h5>
<p>Field Name | Type | Description
---|:---:|---
<a name="infoTitle"></a>title | <code>string</code> | <strong>REQUIRED</strong>. The title of the application.
<a name="infoDescription"></a>description | <code>string</code> | A short description of the application. <a href="http://spec.commonmark.org/">CommonMark syntax</a> MAY be used for rich text representation.
<a name="infoTermsOfService"></a>termsOfService | <code>string</code> | A URL to the Terms of Service for the API. MUST be in the format of a URL.
<a name="infoContact"></a>contact | <a href="#contactObject">Contact Object</a> | The contact information for the exposed API.
<a name="infoLicense"></a>license | <a href="#licenseObject">License Object</a> | The license information for the exposed API.
<a name="infoVersion"></a>version | <code>string</code> | <strong>REQUIRED</strong>. The version of the OpenAPI document (which is distinct from the <a href="#oasVersion">OpenAPI Specification version</a> or the API implementation version).</p>
<p>This object MAY be extended with <a href="#specificationExtensions">Specification Extensions</a>.</p>
<h5>Info Object Example:</h5>
<pre><code class="language-json">{
  "title": "Sample Pet Store App",
  "description": "This is a sample server for a pet store.",
  "termsOfService": "http://example.com/terms/",
  "contact": {
    "name": "API Support",
    "url": "http://www.example.com/support",
    "email": "support@example.com"
  },
  "license": {
    "name": "Apache 2.0",
    "url": "https://www.apache.org/licenses/LICENSE-2.0.html"
  },
  "version": "1.0.1"
}
</code></pre>
<pre><code class="language-yaml">title: Sample Pet Store App
description: This is a sample server for a pet store.
termsOfService: http://example.com/terms/
contact:
  name: API Support
  url: http://www.example.com/support
  email: support@example.com
license:
  name: Apache 2.0
  url: https://www.apache.org/licenses/LICENSE-2.0.html
version: 1.0.1
</code></pre>
<h4><a name="contactObject"></a>Contact Object</h4>
<p>Contact information for the exposed API.</p>
<h5>Fixed Fields</h5>
<p>Field Name | Type | Description
---|:---:|---
<a name="contactName"></a>name | <code>string</code> | The identifying name of the contact person/organization.
<a name="contactUrl"></a>url | <code>string</code> | The URL pointing to the contact information. MUST be in the format of a URL.
<a name="contactEmail"></a>email | <code>string</code> | The email address of the contact person/organization. MUST be in the format of an email address.</p>
<p>This object MAY be extended with <a href="#specificationExtensions">Specification Extensions</a>.</p>
<h5>Contact Object Example:</h5>
<pre><code class="language-json">{
  "name": "API Support",
  "url": "http://www.example.com/support",
  "email": "support@example.com"
}
</code></pre>
<pre><code class="language-yaml">name: API Support
url: http://www.example.com/support
email: support@example.com
</code></pre>
<h4><a name="licenseObject"></a>License Object</h4>
<p>License information for the exposed API.</p>
<h5>Fixed Fields</h5>
<p>Field Name | Type | Description
---|:---:|---
<a name="licenseName"></a>name | <code>string</code> | <strong>REQUIRED</strong>. The license name used for the API.
<a name="licenseUrl"></a>url | <code>string</code> | A URL to the license used for the API. MUST be in the format of a URL.</p>
<p>This object MAY be extended with <a href="#specificationExtensions">Specification Extensions</a>.</p>
<h5>License Object Example:</h5>
<pre><code class="language-json">{
  "name": "Apache 2.0",
  "url": "https://www.apache.org/licenses/LICENSE-2.0.html"
}
</code></pre>
<pre><code class="language-yaml">name: Apache 2.0
url: https://www.apache.org/licenses/LICENSE-2.0.html
</code></pre>
<h4><a name="serverObject"></a>Server Object</h4>
<p>An object representing a Server.</p>
<h5>Fixed Fields</h5>
<p>Field Name | Type | Description
---|:---:|---
<a name="serverUrl"></a>url | <code>string</code> | <strong>REQUIRED</strong>. A URL to the target host.  This URL supports Server Variables and MAY be relative, to indicate that the host location is relative to the location where the OpenAPI document is being served. Variable substitutions will be made when a variable is named in <code>{</code>brackets<code>}</code>.
<a name="serverDescription"></a>description | <code>string</code> | An optional string describing the host designated by the URL. <a href="http://spec.commonmark.org/">CommonMark syntax</a> MAY be used for rich text representation.
<a name="serverVariables"></a>variables | Map[<code>string</code>, <a href="#serverVariableObject">Server Variable Object</a>] | A map between a variable name and its value.  The value is used for substitution in the server's URL template.</p>
<p>This object MAY be extended with <a href="#specificationExtensions">Specification Extensions</a>.</p>
<h5>Server Object Example</h5>
<p>A single server would be described as:</p>
<pre><code class="language-json">{
  "url": "https://development.gigantic-server.com/v1",
  "description": "Development server"
}
</code></pre>
<pre><code class="language-yaml">url: https://development.gigantic-server.com/v1
description: Development server
</code></pre>
<p>The following shows how multiple servers can be described, for example, at the OpenAPI Object's <a href="#oasServers"><code>servers</code></a>:</p>
<pre><code class="language-json">{
  "servers": [
    {
      "url": "https://development.gigantic-server.com/v1",
      "description": "Development server"
    },
    {
      "url": "https://staging.gigantic-server.com/v1",
      "description": "Staging server"
    },
    {
      "url": "https://api.gigantic-server.com/v1",
      "description": "Production server"
    }
  ]
}
</code></pre>
<pre><code class="language-yaml">servers:
- url: https://development.gigantic-server.com/v1
  description: Development server
- url: https://staging.gigantic-server.com/v1
  description: Staging server
- url: https://api.gigantic-server.com/v1
  description: Production server
</code></pre>
<p>The following shows how variables can be used for a server configuration:</p>
<pre><code class="language-json">{
  "servers": [
    {
      "url": "https://{username}.gigantic-server.com:{port}/{basePath}",
      "description": "The production API server",
      "variables": {
        "username": {
          "default": "demo",
          "description": "this value is assigned by the service provider, in this example `gigantic-server.com`"
        },
        "port": {
          "enum": [
            "8443",
            "443"
          ],
          "default": "8443"
        },
        "basePath": {
          "default": "v2"
        }
      }
    }
  ]
}
</code></pre>
<pre><code class="language-yaml">servers:
- url: https://{username}.gigantic-server.com:{port}/{basePath}
  description: The production API server
  variables:
    username:
      # note! no enum here means it is an open value
      default: demo
      description: this value is assigned by the service provider, in this example `gigantic-server.com`
    port:
      enum:
        - '8443'
        - '443'
      default: '8443'
    basePath:
      # open meaning there is the opportunity to use special base paths as assigned by the provider, default is `v2`
      default: v2
</code></pre>
<h4><a name="serverVariableObject"></a>Server Variable Object</h4>
<p>An object representing a Server Variable for server URL template substitution.</p>
<h5>Fixed Fields</h5>
<p>Field Name | Type | Description
---|:---:|---
<a name="serverVariableEnum"></a>enum | [<code>string</code>] | An enumeration of string values to be used if the substitution options are from a limited set.
<a name="serverVariableDefault"></a>default | <code>string</code> |  <strong>REQUIRED</strong>. The default value to use for substitution, and to send, if an alternate value is <em>not</em> supplied. Unlike the <a href="#schemaObject">Schema Object's</a> <code>default</code>, this value MUST be provided by the consumer.
<a name="serverVariableDescription"></a>description | <code>string</code> | An optional description for the server variable. <a href="http://spec.commonmark.org/">CommonMark syntax</a> MAY be used for rich text representation.</p>
<p>This object MAY be extended with <a href="#specificationExtensions">Specification Extensions</a>.</p>
<h4><a name="componentsObject"></a>Components Object</h4>
<p>Holds a set of reusable objects for different aspects of the OAS.
All objects defined within the components object will have no effect on the API unless they are explicitly referenced from properties outside the components object.</p>
<h5>Fixed Fields</h5>
<p>Field Name | Type | Description
---|:---|---
<a name="componentsSchemas"></a> schemas | Map[<code>string</code>, <a href="#schemaObject">Schema Object</a> \| <a href="#referenceObject">Reference Object</a>] | An object to hold reusable <a href="#schemaObject">Schema Objects</a>.
<a name="componentsResponses"></a> responses | Map[<code>string</code>, <a href="#responseObject">Response Object</a> \| <a href="#referenceObject">Reference Object</a>] | An object to hold reusable <a href="#responseObject">Response Objects</a>.
<a name="componentsParameters"></a> parameters | Map[<code>string</code>, <a href="#parameterObject">Parameter Object</a> \| <a href="#referenceObject">Reference Object</a>] | An object to hold reusable <a href="#parameterObject">Parameter Objects</a>.
<a name="componentsExamples"></a> examples | Map[<code>string</code>, <a href="#exampleObject">Example Object</a> \| <a href="#referenceObject">Reference Object</a>] | An object to hold reusable <a href="#exampleObject">Example Objects</a>.
<a name="componentsRequestBodies"></a> requestBodies | Map[<code>string</code>, <a href="#requestBodyObject">Request Body Object</a> \| <a href="#referenceObject">Reference Object</a>] | An object to hold reusable <a href="#requestBodyObject">Request Body Objects</a>.
<a name="componentsHeaders"></a> headers | Map[<code>string</code>, <a href="#headerObject">Header Object</a> \| <a href="#referenceObject">Reference Object</a>] | An object to hold reusable <a href="#headerObject">Header Objects</a>.
<a name="componentsSecuritySchemes"></a> securitySchemes | Map[<code>string</code>, <a href="#securitySchemeObject">Security Scheme Object</a> \| <a href="#referenceObject">Reference Object</a>] | An object to hold reusable <a href="#securitySchemeObject">Security Scheme Objects</a>.
<a name="componentsLinks"></a> links | Map[<code>string</code>, <a href="#linkObject">Link Object</a> \| <a href="#referenceObject">Reference Object</a>] | An object to hold reusable <a href="#linkObject">Link Objects</a>.
<a name="componentsCallbacks"></a> callbacks | Map[<code>string</code>, <a href="#callbackObject">Callback Object</a> \| <a href="#referenceObject">Reference Object</a>] | An object to hold reusable <a href="#callbackObject">Callback Objects</a>.</p>
<p>This object MAY be extended with <a href="#specificationExtensions">Specification Extensions</a>.</p>
<p>All the fixed fields declared above are objects that MUST use keys that match the regular expression: <code>^[a-zA-Z0-9\.\-_]+$</code>.</p>
<p>Field Name Examples:</p>
<pre><code>User
User_1
User_Name
user-name
my.org.User
</code></pre>
<h5>Components Object Example</h5>
<pre><code class="language-json">"components": {
  "schemas": {
    "Category": {
      "type": "object",
      "properties": {
        "id": {
          "type": "integer",
          "format": "int64"
        },
        "name": {
          "type": "string"
        }
      }
    },
    "Tag": {
      "type": "object",
      "properties": {
        "id": {
          "type": "integer",
          "format": "int64"
        },
        "name": {
          "type": "string"
        }
      }
    }
  },
  "parameters": {
    "skipParam": {
      "name": "skip",
      "in": "query",
      "description": "number of items to skip",
      "required": true,
      "schema": {
        "type": "integer",
        "format": "int32"
      }
    },
    "limitParam": {
      "name": "limit",
      "in": "query",
      "description": "max records to return",
      "required": true,
      "schema" : {
        "type": "integer",
        "format": "int32"
      }
    }
  },
  "responses": {
    "NotFound": {
      "description": "Entity not found."
    },
    "IllegalInput": {
      "description": "Illegal input for operation."
    },
    "GeneralError": {
      "description": "General Error",
      "content": {
        "application/json": {
          "schema": {
            "$ref": "#/components/schemas/GeneralError"
          }
        }
      }
    }
  },
  "securitySchemes": {
    "api_key": {
      "type": "apiKey",
      "name": "api_key",
      "in": "header"
    },
    "petstore_auth": {
      "type": "oauth2",
      "flows": {
        "implicit": {
          "authorizationUrl": "http://example.org/api/oauth/dialog",
          "scopes": {
            "write:pets": "modify pets in your account",
            "read:pets": "read your pets"
          }
        }
      }
    }
  }
}
</code></pre>
<pre><code class="language-yaml">components:
  schemas:
    Category:
      type: object
      properties:
        id:
          type: integer
          format: int64
        name:
          type: string
    Tag:
      type: object
      properties:
        id:
          type: integer
          format: int64
        name:
          type: string
  parameters:
    skipParam:
      name: skip
      in: query
      description: number of items to skip
      required: true
      schema:
        type: integer
        format: int32
    limitParam:
      name: limit
      in: query
      description: max records to return
      required: true
      schema:
        type: integer
        format: int32
  responses:
    NotFound:
      description: Entity not found.
    IllegalInput:
      description: Illegal input for operation.
    GeneralError:
      description: General Error
      content:
        application/json:
          schema:
            $ref: '#/components/schemas/GeneralError'
  securitySchemes:
    api_key:
      type: apiKey
      name: api_key
      in: header
    petstore_auth:
      type: oauth2
      flows: 
        implicit:
          authorizationUrl: http://example.org/api/oauth/dialog
          scopes:
            write:pets: modify pets in your account
            read:pets: read your pets
</code></pre>
<h4><a name="pathsObject"></a>Paths Object</h4>
<p>Holds the relative paths to the individual endpoints and their operations.
The path is appended to the URL from the <a href="#serverObject"><code>Server Object</code></a> in order to construct the full URL.  The Paths MAY be empty, due to <a href="#securityFiltering">ACL constraints</a>.</p>
<h5>Patterned Fields</h5>
<p>Field Pattern | Type | Description
---|:---:|---
<a name="pathsPath"></a>/{path} | <a href="#pathItemObject">Path Item Object</a> | A relative path to an individual endpoint. The field name MUST begin with a slash. The path is <strong>appended</strong> (no relative URL resolution) to the expanded URL from the <a href="#serverObject"><code>Server Object</code></a>'s <code>url</code> field in order to construct the full URL. <a href="#pathTemplating">Path templating</a> is allowed. When matching URLs, concrete (non-templated) paths would be matched before their templated counterparts. Templated paths with the same hierarchy but different templated names MUST NOT exist as they are identical. In case of ambiguous matching, it's up to the tooling to decide which one to use.</p>
<p>This object MAY be extended with <a href="#specificationExtensions">Specification Extensions</a>.</p>
<h5>Path Templating Matching</h5>
<p>Assuming the following paths, the concrete definition, <code>/pets/mine</code>, will be matched first if used:</p>
<pre><code>  /pets/{petId}
  /pets/mine
</code></pre>
<p>The following paths are considered identical and invalid:</p>
<pre><code>  /pets/{petId}
  /pets/{name}
</code></pre>
<p>The following may lead to ambiguous resolution:</p>
<pre><code>  /{entity}/me
  /books/{id}
</code></pre>
<h5>Paths Object Example</h5>
<pre><code class="language-json">{
  "/pets": {
    "get": {
      "description": "Returns all pets from the system that the user has access to",
      "responses": {
        "200": {          
          "description": "A list of pets.",
          "content": {
            "application/json": {
              "schema": {
                "type": "array",
                "items": {
                  "$ref": "#/components/schemas/pet"
                }
              }
            }
          }
        }
      }
    }
  }
}
</code></pre>
<pre><code class="language-yaml">/pets:
  get:
    description: Returns all pets from the system that the user has access to
    responses:
      '200':
        description: A list of pets.
        content:
          application/json:
            schema:
              type: array
              items:
                $ref: '#/components/schemas/pet'
</code></pre>
<h4><a name="pathItemObject"></a>Path Item Object</h4>
<p>Describes the operations available on a single path.
A Path Item MAY be empty, due to <a href="#securityFiltering">ACL constraints</a>.
The path itself is still exposed to the documentation viewer but they will not know which operations and parameters are available.</p>
<h5>Fixed Fields</h5>
<p>Field Name | Type | Description
---|:---:|---
<a name="pathItemRef"></a>$ref | <code>string</code> | Allows for an external definition of this path item. The referenced structure MUST be in the format of a <a href="#pathItemObject">Path Item Object</a>. If there are conflicts between the referenced definition and this Path Item's definition, the behavior is <em>undefined</em>.
<a name="pathItemSummary"></a>summary | <code>string</code> | An optional, string summary, intended to apply to all operations in this path.
<a name="pathItemDescription"></a>description | <code>string</code> | An optional, string description, intended to apply to all operations in this path. <a href="http://spec.commonmark.org/">CommonMark syntax</a> MAY be used for rich text representation.
<a name="pathItemGet"></a>get | <a href="#operationObject">Operation Object</a> | A definition of a GET operation on this path.
<a name="pathItemPut"></a>put | <a href="#operationObject">Operation Object</a> | A definition of a PUT operation on this path.
<a name="pathItemPost"></a>post | <a href="#operationObject">Operation Object</a> | A definition of a POST operation on this path.
<a name="pathItemDelete"></a>delete | <a href="#operationObject">Operation Object</a> | A definition of a DELETE operation on this path.
<a name="pathItemOptions"></a>options | <a href="#operationObject">Operation Object</a> | A definition of a OPTIONS operation on this path.
<a name="pathItemHead"></a>head | <a href="#operationObject">Operation Object</a> | A definition of a HEAD operation on this path.
<a name="pathItemPatch"></a>patch | <a href="#operationObject">Operation Object</a> | A definition of a PATCH operation on this path.
<a name="pathItemTrace"></a>trace | <a href="#operationObject">Operation Object</a> | A definition of a TRACE operation on this path.
<a name="pathItemServers"></a>servers | [<a href="#serverObject">Server Object</a>] | An alternative <code>server</code> array to service all operations in this path.
<a name="pathItemParameters"></a>parameters | [<a href="#parameterObject">Parameter Object</a> \| <a href="#referenceObject">Reference Object</a>] | A list of parameters that are applicable for all the operations described under this path. These parameters can be overridden at the operation level, but cannot be removed there. The list MUST NOT include duplicated parameters. A unique parameter is defined by a combination of a <a href="#parameterName">name</a> and <a href="#parameterIn">location</a>. The list can use the <a href="#referenceObject">Reference Object</a> to link to parameters that are defined at the <a href="#componentsParameters">OpenAPI Object's components/parameters</a>.</p>
<p>This object MAY be extended with <a href="#specificationExtensions">Specification Extensions</a>.</p>
<h5>Path Item Object Example</h5>
<pre><code class="language-json">{
  "get": {
    "description": "Returns pets based on ID",
    "summary": "Find pets by ID",
    "operationId": "getPetsById",
    "responses": {
      "200": {
        "description": "pet response",
        "content": {
          "*/*": {
            "schema": {
              "type": "array",
              "items": {
                "$ref": "#/components/schemas/Pet"
              }
            }
          }
        }
      },
      "default": {
        "description": "error payload",
        "content": {
          "text/html": {
            "schema": {
              "$ref": "#/components/schemas/ErrorModel"
            }
          }
        }
      }
    }
  },
  "parameters": [
    {
      "name": "id",
      "in": "path",
      "description": "ID of pet to use",
      "required": true,
      "schema": {
        "type": "array",
        "items": {
          "type": "string"
        }
      },
      "style": "simple"
    }
  ]
}
</code></pre>
<pre><code class="language-yaml">get:
  description: Returns pets based on ID
  summary: Find pets by ID
  operationId: getPetsById
  responses:
    '200':
      description: pet response
      content:
        '*/*' :
          schema:
            type: array
            items:
              $ref: '#/components/schemas/Pet'
    default:
      description: error payload
      content:
        'text/html':
          schema:
            $ref: '#/components/schemas/ErrorModel'
parameters:
- name: id
  in: path
  description: ID of pet to use
  required: true
  schema:
    type: array
    style: simple
    items:
      type: string  
</code></pre>
<h4><a name="operationObject"></a>Operation Object</h4>
<p>Describes a single API operation on a path.</p>
<h5>Fixed Fields</h5>
<p>Field Name | Type | Description
---|:---:|---
<a name="operationTags"></a>tags | [<code>string</code>] | A list of tags for API documentation control. Tags can be used for logical grouping of operations by resources or any other qualifier.
<a name="operationSummary"></a>summary | <code>string</code> | A short summary of what the operation does.
<a name="operationDescription"></a>description | <code>string</code> | A verbose explanation of the operation behavior. <a href="http://spec.commonmark.org/">CommonMark syntax</a> MAY be used for rich text representation.
<a name="operationExternalDocs"></a>externalDocs | <a href="#externalDocumentationObject">External Documentation Object</a> | Additional external documentation for this operation.
<a name="operationId"></a>operationId | <code>string</code> | Unique string used to identify the operation. The id MUST be unique among all operations described in the API. Tools and libraries MAY use the operationId to uniquely identify an operation, therefore, it is RECOMMENDED to follow common programming naming conventions.
<a name="operationParameters"></a>parameters | [<a href="#parameterObject">Parameter Object</a> \| <a href="#referenceObject">Reference Object</a>] | A list of parameters that are applicable for this operation. If a parameter is already defined at the <a href="#pathItemParameters">Path Item</a>, the new definition will override it but can never remove it. The list MUST NOT include duplicated parameters. A unique parameter is defined by a combination of a <a href="#parameterName">name</a> and <a href="#parameterIn">location</a>. The list can use the <a href="#referenceObject">Reference Object</a> to link to parameters that are defined at the <a href="#componentsParameters">OpenAPI Object's components/parameters</a>.
<a name="operationRequestBody"></a>requestBody | <a href="#requestBodyObject">Request Body Object</a> \| <a href="#referenceObject">Reference Object</a> | The request body applicable for this operation.  The <code>requestBody</code> is only supported in HTTP methods where the HTTP 1.1 specification <a href="https://tools.ietf.org/html/rfc7231#section-4.3.1">RFC7231</a> has explicitly defined semantics for request bodies.  In other cases where the HTTP spec is vague, <code>requestBody</code> SHALL be ignored by consumers.
<a name="operationResponses"></a>responses | <a href="#responsesObject">Responses Object</a> | <strong>REQUIRED</strong>. The list of possible responses as they are returned from executing this operation.
<a name="operationCallbacks"></a>callbacks | Map[<code>string</code>, <a href="#callbackObject">Callback Object</a> \| <a href="#referenceObject">Reference Object</a>] | A map of possible out-of band callbacks related to the parent operation. The key is a unique identifier for the Callback Object. Each value in the map is a <a href="#callbackObject">Callback Object</a> that describes a request that may be initiated by the API provider and the expected responses. The key value used to identify the callback object is an expression, evaluated at runtime, that identifies a URL to use for the callback operation.
<a name="operationDeprecated"></a>deprecated | <code>boolean</code> | Declares this operation to be deprecated. Consumers SHOULD refrain from usage of the declared operation. Default value is <code>false</code>.
<a name="operationSecurity"></a>security | [<a href="#securityRequirementObject">Security Requirement Object</a>] | A declaration of which security mechanisms can be used for this operation. The list of values includes alternative security requirement objects that can be used. Only one of the security requirement objects need to be satisfied to authorize a request. This definition overrides any declared top-level <a href="#oasSecurity"><code>security</code></a>. To remove a top-level security declaration, an empty array can be used.
<a name="operationServers"></a>servers | [<a href="#serverObject">Server Object</a>] | An alternative <code>server</code> array to service this operation. If an alternative <code>server</code> object is specified at the Path Item Object or Root level, it will be overridden by this value.</p>
<p>This object MAY be extended with <a href="#specificationExtensions">Specification Extensions</a>.</p>
<h5>Operation Object Example</h5>
<pre><code class="language-json">{
  "tags": [
    "pet"
  ],
  "summary": "Updates a pet in the store with form data",
  "operationId": "updatePetWithForm",
  "parameters": [
    {
      "name": "petId",
      "in": "path",
      "description": "ID of pet that needs to be updated",
      "required": true,
      "schema": {
        "type": "string"
      }
    }
  ],
  "requestBody": {
    "content": {
      "application/x-www-form-urlencoded": {
        "schema": {
          "type": "object",
           "properties": {
              "name": { 
                "description": "Updated name of the pet",
                "type": "string"
              },
              "status": {
                "description": "Updated status of the pet",
                "type": "string"
             }
           },
        "required": ["status"] 
        }
      }
    }
  },
  "responses": {
    "200": {
      "description": "Pet updated.",
      "content": {
        "application/json": {},
        "application/xml": {}
      }
    },
    "405": {
      "description": "Invalid input",
      "content": {
        "application/json": {},
        "application/xml": {}
      }
    }
  },
  "security": [
    {
      "petstore_auth": [
        "write:pets",
        "read:pets"
      ]
    }
  ]
}
</code></pre>
<pre><code class="language-yaml">tags:
- pet
summary: Updates a pet in the store with form data
operationId: updatePetWithForm
parameters:
- name: petId
  in: path
  description: ID of pet that needs to be updated
  required: true
  schema:
    type: string
requestBody:
  content:
    'application/x-www-form-urlencoded':
      schema:
       properties:
          name: 
            description: Updated name of the pet
            type: string
          status:
            description: Updated status of the pet
            type: string
       required:
         - status
responses:
  '200':
    description: Pet updated.
    content: 
      'application/json': {}
      'application/xml': {}
  '405':
    description: Invalid input
    content: 
      'application/json': {}
      'application/xml': {}
security:
- petstore_auth:
  - write:pets
  - read:pets
</code></pre>
<h4><a name="externalDocumentationObject"></a>External Documentation Object</h4>
<p>Allows referencing an external resource for extended documentation.</p>
<h5>Fixed Fields</h5>
<p>Field Name | Type | Description
---|:---:|---
<a name="externalDocDescription"></a>description | <code>string</code> | A short description of the target documentation. <a href="http://spec.commonmark.org/">CommonMark syntax</a> MAY be used for rich text representation.
<a name="externalDocUrl"></a>url | <code>string</code> | <strong>REQUIRED</strong>. The URL for the target documentation. Value MUST be in the format of a URL.</p>
<p>This object MAY be extended with <a href="#specificationExtensions">Specification Extensions</a>.</p>
<h5>External Documentation Object Example</h5>
<pre><code class="language-json">{
  "description": "Find more info here",
  "url": "https://example.com"
}
</code></pre>
<pre><code class="language-yaml">description: Find more info here
url: https://example.com
</code></pre>
<h4><a name="parameterObject"></a>Parameter Object</h4>
<p>Describes a single operation parameter.</p>
<p>A unique parameter is defined by a combination of a <a href="#parameterName">name</a> and <a href="#parameterIn">location</a>.</p>
<h5>Parameter Locations</h5>
<p>There are four possible parameter locations specified by the <code>in</code> field:</p>
<ul>
<li>path - Used together with <a href="#pathTemplating">Path Templating</a>, where the parameter value is actually part of the operation's URL. This does not include the host or base path of the API. For example, in <code>/items/{itemId}</code>, the path parameter is <code>itemId</code>.</li>
<li>query - Parameters that are appended to the URL. For example, in <code>/items?id=###</code>, the query parameter is <code>id</code>.</li>
<li>header - Custom headers that are expected as part of the request. Note that <a href="https://tools.ietf.org/html/rfc7230#page-22">RFC7230</a> states header names are case insensitive.</li>
<li>cookie - Used to pass a specific cookie value to the API.</li>
</ul>
<h5>Fixed Fields</h5>
<p>Field Name | Type | Description
---|:---:|---
<a name="parameterName"></a>name | <code>string</code> | <strong>REQUIRED</strong>. The name of the parameter. Parameter names are <em>case sensitive</em>. <ul><li>If <a href="#parameterIn"><code>in</code></a> is <code>"path"</code>, the <code>name</code> field MUST correspond to the associated path segment from the <a href="#pathsPath">path</a> field in the <a href="#pathsObject">Paths Object</a>. See <a href="#pathTemplating">Path Templating</a> for further information.<li>If <a href="#parameterIn"><code>in</code></a> is <code>"header"</code> and the <code>name</code> field is <code>"Accept"</code>, <code>"Content-Type"</code> or <code>"Authorization"</code>, the parameter definition SHALL be ignored.<li>For all other cases, the <code>name</code> corresponds to the parameter name used by the <a href="#parameterIn"><code>in</code></a> property.</ul>
<a name="parameterIn"></a>in | <code>string</code> | <strong>REQUIRED</strong>. The location of the parameter. Possible values are "query", "header", "path" or "cookie".
<a name="parameterDescription"></a>description | <code>string</code> | A brief description of the parameter. This could contain examples of use.  <a href="http://spec.commonmark.org/">CommonMark syntax</a> MAY be used for rich text representation.
<a name="parameterRequired"></a>required | <code>boolean</code> | Determines whether this parameter is mandatory. If the <a href="#parameterIn">parameter location</a> is "path", this property is <strong>REQUIRED</strong> and its value MUST be <code>true</code>. Otherwise, the property MAY be included and its default value is <code>false</code>.
<a name="parameterDeprecated"></a> deprecated | <code>boolean</code> | Specifies that a parameter is deprecated and SHOULD be transitioned out of usage.
<a name="parameterAllowEmptyValue"></a> allowEmptyValue | <code>boolean</code> | Sets the ability to pass empty-valued parameters. This is valid only for <code>query</code> parameters and allows sending a parameter with an empty value. Default value is <code>false</code>. If <a href="#parameterStyle"><code>style</code></a> is used, and if behavior is <code>n/a</code> (cannot be serialized), the value of <code>allowEmptyValue</code> SHALL be ignored.</p>
<p>The rules for serialization of the parameter are specified in one of two ways.
For simpler scenarios, a <a href="#parameterSchema"><code>schema</code></a> and <a href="#parameterStyle"><code>style</code></a> can describe the structure and syntax of the parameter.</p>
<p>Field Name | Type | Description
---|:---:|---
<a name="parameterStyle"></a>style | <code>string</code> | Describes how the parameter value will be serialized depending on the type of the parameter value. Default values (based on value of <code>in</code>): for <code>query</code> - <code>form</code>; for <code>path</code> - <code>simple</code>; for <code>header</code> - <code>simple</code>; for <code>cookie</code> - <code>form</code>.
<a name="parameterExplode"></a>explode | <code>boolean</code> | When this is true, parameter values of type <code>array</code> or <code>object</code> generate separate parameters for each value of the array or key-value pair of the map.  For other types of parameters this property has no effect. When <a href="#parameterStyle"><code>style</code></a> is <code>form</code>, the default value is <code>true</code>. For all other styles, the default value is <code>false</code>.
<a name="parameterAllowReserved"></a>allowReserved | <code>boolean</code> | Determines whether the parameter value SHOULD allow reserved characters, as defined by <a href="https://tools.ietf.org/html/rfc3986#section-2.2">RFC3986</a> <code>:/?#[]@!$&amp;'()*+,;=</code> to be included without percent-encoding. This property only applies to parameters with an <code>in</code> value of <code>query</code>. The default value is <code>false</code>.
<a name="parameterSchema"></a>schema | <a href="#schemaObject">Schema Object</a> \| <a href="#referenceObject">Reference Object</a> | The schema defining the type used for the parameter.
<a name="parameterExample"></a>example | Any | Example of the media type.  The example SHOULD match the specified schema and encoding properties if present.  The <code>example</code> field is mutually exclusive of the <code>examples</code> field.  Furthermore, if referencing a <code>schema</code> which contains an example, the <code>example</code> value SHALL <em>override</em> the example provided by the schema. To represent examples of media types that cannot naturally be represented in JSON or YAML, a string value can contain the example with escaping where necessary.
<a name="parameterExamples"></a>examples | Map[ <code>string</code>, <a href="#exampleObject">Example Object</a> \| <a href="#referenceObject">Reference Object</a>] | Examples of the media type.  Each example SHOULD contain a value in the correct format as specified in the parameter encoding.  The <code>examples</code> field is mutually exclusive of the <code>example</code> field.  Furthermore, if referencing a <code>schema</code> which contains an example, the <code>examples</code> value SHALL <em>override</em> the example provided by the schema.</p>
<p>For more complex scenarios, the <a href="#parameterContent"><code>content</code></a> property can define the media type and schema of the parameter.
A parameter MUST contain either a <code>schema</code> property, or a <code>content</code> property, but not both.
When <code>example</code> or <code>examples</code> are provided in conjunction with the <code>schema</code> object, the example MUST follow the prescribed serialization strategy for the parameter.</p>
<p>Field Name | Type | Description
---|:---:|---
<a name="parameterContent"></a>content | Map[<code>string</code>, <a href="#mediaTypeObject">Media Type Object</a>] | A map containing the representations for the parameter. The key is the media type and the value describes it.  The map MUST only contain one entry.</p>
<h5>Style Values</h5>
<p>In order to support common ways of serializing simple parameters, a set of <code>style</code> values are defined.</p>
<p><code>style</code> | <a href="#dataTypes"><code>type</code></a> |  <code>in</code> | Comments
----------- | ------ | -------- | --------
matrix |  <code>primitive</code>, <code>array</code>, <code>object</code> |  <code>path</code> | Path-style parameters defined by <a href="https://tools.ietf.org/html/rfc6570#section-3.2.7">RFC6570</a> 
label | <code>primitive</code>, <code>array</code>, <code>object</code> |  <code>path</code> | Label style parameters defined by <a href="https://tools.ietf.org/html/rfc6570#section-3.2.5">RFC6570</a>
form |  <code>primitive</code>, <code>array</code>, <code>object</code> |  <code>query</code>, <code>cookie</code> | Form style parameters defined by <a href="https://tools.ietf.org/html/rfc6570#section-3.2.8">RFC6570</a>. This option replaces <code>collectionFormat</code> with a <code>csv</code> (when <code>explode</code> is false) or <code>multi</code> (when <code>explode</code> is true) value from OpenAPI 2.0.
simple | <code>array</code> | <code>path</code>, <code>header</code> | Simple style parameters defined by <a href="https://tools.ietf.org/html/rfc6570#section-3.2.2">RFC6570</a>.  This option replaces <code>collectionFormat</code> with a <code>csv</code> value from OpenAPI 2.0.
spaceDelimited | <code>array</code> | <code>query</code> | Space separated array values. This option replaces <code>collectionFormat</code> equal to <code>ssv</code> from OpenAPI 2.0. 
pipeDelimited | <code>array</code> | <code>query</code> | Pipe separated array values. This option replaces <code>collectionFormat</code> equal to <code>pipes</code> from OpenAPI 2.0.
deepObject | <code>object</code> | <code>query</code> | Provides a simple way of rendering nested objects using form parameters.</p>
<h5>Style Examples</h5>
<p>Assume a parameter named <code>color</code> has one of the following values:</p>
<pre><code>   string -&gt; "blue"
   array -&gt; ["blue","black","brown"]
   object -&gt; { "R": 100, "G": 200, "B": 150 }
</code></pre>
<p>The following table shows examples of rendering differences for each value.</p>
<p><a href="#dataTypeFormat"><code>style</code></a> | <code>explode</code> | <code>empty</code> | <code>string</code> | <code>array</code> | <code>object</code>
----------- | ------ | -------- | -------- | --------|-------
matrix | false | ;color | ;color=blue | ;color=blue,black,brown | ;color=R,100,G,200,B,150
matrix | true | ;color | ;color=blue | ;color=blue;color=black;color=brown | ;R=100;G=200;B=150
label | false | .  | .blue |  .blue.black.brown | .R.100.G.200.B.150
label | true | . | .blue |  .blue.black.brown | .R=100.G=200.B=150
form | false | color= | color=blue | color=blue,black,brown | color=R,100,G,200,B,150
form | true | color= | color=blue | color=blue&amp;color=black&amp;color=brown | R=100&amp;G=200&amp;B=150
simple | false | n/a | blue | blue,black,brown | R,100,G,200,B,150
simple | true | n/a | blue | blue,black,brown | R=100,G=200,B=150
spaceDelimited | false | n/a | n/a | blue%20black%20brown | R%20100%20G%20200%20B%20150
pipeDelimited | false | n/a | n/a | blue|black|brown | R|100|G|200|G|150
deepObject | true | n/a | n/a | n/a | color[R]=100&amp;color[G]=200&amp;color[B]=150</p>
<p>This object MAY be extended with <a href="#specificationExtensions">Specification Extensions</a>.</p>
<h5>Parameter Object Examples</h5>
<p>A header parameter with an array of 64 bit integer numbers:</p>
<pre><code class="language-json">{
  "name": "token",
  "in": "header",
  "description": "token to be passed as a header",
  "required": true,
  "schema": {
    "type": "array",
    "items": {
      "type": "integer",
      "format": "int64"
    }
  },
  "style": "simple"
}
</code></pre>
<pre><code class="language-yaml">name: token
in: header
description: token to be passed as a header
required: true
schema:
  type: array
  items:
    type: integer
    format: int64
style: simple
</code></pre>
<p>A path parameter of a string value:</p>
<pre><code class="language-json">{
  "name": "username",
  "in": "path",
  "description": "username to fetch",
  "required": true,
  "schema": {
    "type": "string"
  }
}
</code></pre>
<pre><code class="language-yaml">name: username
in: path
description: username to fetch
required: true
schema:
  type: string
</code></pre>
<p>An optional query parameter of a string value, allowing multiple values by repeating the query parameter:</p>
<pre><code class="language-json">{
  "name": "id",
  "in": "query",
  "description": "ID of the object to fetch",
  "required": false,
  "schema": {
    "type": "array",
    "items": {
      "type": "string"
    }
  },
  "style": "form",
  "explode": true
}
</code></pre>
<pre><code class="language-yaml">name: id
in: query
description: ID of the object to fetch
required: false
schema:
  type: array
  items:
    type: string
style: form
explode: true
</code></pre>
<p>A free-form query parameter, allowing undefined parameters of a specific type:</p>
<pre><code class="language-json">{
  "in": "query",
  "name": "freeForm",
  "schema": {
    "type": "object",
    "additionalProperties": {
      "type": "integer"
    },
  },
  "style": "form"
}
</code></pre>
<pre><code class="language-yaml">in: query
name: freeForm
schema:
  type: object
  additionalProperties:
    type: integer
style: form
</code></pre>
<p>A complex parameter using <code>content</code> to define serialization:</p>
<pre><code class="language-json">{
  "in": "query",
  "name": "coordinates",
  "content": {
    "application/json": {
      "schema": {
        "type": "object",
        "required": [
          "lat",
          "long"
        ],
        "properties": {
          "lat": {
            "type": "number"
          },
          "long": {
            "type": "number"
          }
        }
      }
    }
  }
}
</code></pre>
<pre><code class="language-yaml">in: query
name: coordinates
content:
  application/json:
    schema:
      type: object
      required:
        - lat
        - long
      properties:
        lat:
          type: number
        long:
          type: number
</code></pre>
<h4><a name="requestBodyObject"></a>Request Body Object</h4>
<p>Describes a single request body.</p>
<h5>Fixed Fields</h5>
<p>Field Name | Type | Description
---|:---:|---
<a name="requestBodyDescription"></a>description | <code>string</code> | A brief description of the request body. This could contain examples of use.  <a href="http://spec.commonmark.org/">CommonMark syntax</a> MAY be used for rich text representation.
<a name="requestBodyContent"></a>content | Map[<code>string</code>, <a href="#mediaTypeObject">Media Type Object</a>] | <strong>REQUIRED</strong>. The content of the request body. The key is a media type or <a href="https://tools.ietf.org/html/rfc7231#appendix-D">media type range</a> and the value describes it.  For requests that match multiple keys, only the most specific key is applicable. e.g. text/plain overrides text/*
<a name="requestBodyRequired"></a>required | <code>boolean</code> | Determines if the request body is required in the request. Defaults to <code>false</code>.</p>
<p>This object MAY be extended with <a href="#specificationExtensions">Specification Extensions</a>.</p>
<h5>Request Body Examples</h5>
<p>A request body with a referenced model definition.</p>
<pre><code class="language-json">{
  "description": "user to add to the system",
  "content": {
    "application/json": {
      "schema": {
        "$ref": "#/components/schemas/User"
      },
      "examples": {
          "user" : {
            "summary": "User Example", 
            "externalValue": "http://foo.bar/examples/user-example.json"
          } 
        }
    },
    "application/xml": {
      "schema": {
        "$ref": "#/components/schemas/User"
      },
      "examples": {
          "user" : {
            "summary": "User example in XML",
            "externalValue": "http://foo.bar/examples/user-example.xml"
          }
        }
    },
    "text/plain": {
      "examples": {
        "user" : {
            "summary": "User example in Plain text",
            "externalValue": "http://foo.bar/examples/user-example.txt" 
        }
      } 
    },
    "*/*": {
      "examples": {
        "user" : {
            "summary": "User example in other format",
            "externalValue": "http://foo.bar/examples/user-example.whatever"
        }
      }
    }
  }
}
</code></pre>
<pre><code class="language-yaml">description: user to add to the system
content: 
  'application/json':
    schema:
      $ref: '#/components/schemas/User'
    examples:
      user:
        summary: User Example
        externalValue: 'http://foo.bar/examples/user-example.json'
  'application/xml':
    schema:
      $ref: '#/components/schemas/User'
    examples:
      user:
        summary: User Example in XML
        externalValue: 'http://foo.bar/examples/user-example.xml'
  'text/plain':
    examples:
      user:
        summary: User example in text plain format
        externalValue: 'http://foo.bar/examples/user-example.txt'
  '*/*':
    examples:
      user: 
        summary: User example in other format
        externalValue: 'http://foo.bar/examples/user-example.whatever'
</code></pre>
<p>A body parameter that is an array of string values:</p>
<pre><code class="language-json">{
  "description": "user to add to the system",
  "content": {
    "text/plain": {
      "schema": {
        "type": "array",
        "items": {
          "type": "string"
        }
      }
    }
  }
}
</code></pre>
<pre><code class="language-yaml">description: user to add to the system
required: true
content:
  text/plain:
    schema:
      type: array
      items:
        type: string
</code></pre>
<h4><a name="mediaTypeObject"></a>Media Type Object</h4>
<p>Each Media Type Object provides schema and examples for the media type identified by its key.</p>
<h5>Fixed Fields</h5>
<p>Field Name | Type | Description
---|:---:|---
<a name="mediaTypeSchema"></a>schema | <a href="#schemaObject">Schema Object</a> \| <a href="#referenceObject">Reference Object</a> | The schema defining the type used for the request body.
<a name="mediaTypeExample"></a>example | Any | Example of the media type.  The example object SHOULD be in the correct format as specified by the media type.  The <code>example</code> field is mutually exclusive of the <code>examples</code> field.  Furthermore, if referencing a <code>schema</code> which contains an example, the <code>example</code> value SHALL <em>override</em> the example provided by the schema.
<a name="mediaTypeExamples"></a>examples | Map[ <code>string</code>, <a href="#exampleObject">Example Object</a> \| <a href="#referenceObject">Reference Object</a>] | Examples of the media type.  Each example object SHOULD  match the media type and specified schema if present.  The <code>examples</code> field is mutually exclusive of the <code>example</code> field.  Furthermore, if referencing a <code>schema</code> which contains an example, the <code>examples</code> value SHALL <em>override</em> the example provided by the schema.
<a name="mediaTypeEncoding"></a>encoding | Map[<code>string</code>, <a href="#encodingObject">Encoding Object</a>] | A map between a property name and its encoding information. The key, being the property name, MUST exist in the schema as a property. The encoding object SHALL only apply to <code>requestBody</code> objects when the media type is <code>multipart</code> or <code>application/x-www-form-urlencoded</code>.</p>
<p>This object MAY be extended with <a href="#specificationExtensions">Specification Extensions</a>.</p>
<h5>Media Type Examples</h5>
<pre><code class="language-js">{
  "application/json": {
    "schema": {
         "$ref": "#/components/schemas/Pet"
    },
    "examples": {
      "cat" : {
        "summary": "An example of a cat",
        "value": 
          {
            "name": "Fluffy",
            "petType": "Cat",
            "color": "White",
            "gender": "male",
            "breed": "Persian"
          }
      },
      "dog": {
        "summary": "An example of a dog with a cat's name",
        "value" :  { 
          "name": "Puma",
          "petType": "Dog",
          "color": "Black",
          "gender": "Female",
          "breed": "Mixed"
        },
      "frog": {
          "$ref": "#/components/examples/frog-example"
        }
      }
    }
  }
}
</code></pre>
<pre><code class="language-yaml">application/json: 
  schema:
    $ref: "#/components/schemas/Pet"
  examples:
    cat:
      summary: An example of a cat
      value:
        name: Fluffy
        petType: Cat
        color: White
        gender: male
        breed: Persian
    dog:
      summary: An example of a dog with a cat's name
      value:
        name: Puma
        petType: Dog
        color: Black
        gender: Female
        breed: Mixed
    frog:
      $ref: "#/components/examples/frog-example"
</code></pre>
<h5>Considerations for File Uploads</h5>
<p>In contrast with the 2.0 specification, <code>file</code> input/output content in OpenAPI is described with the same semantics as any other schema type. Specifically:</p>
<pre><code class="language-yaml"># content transferred with base64 encoding
schema:
  type: string
  format: base64
</code></pre>
<pre><code class="language-yaml"># content transferred in binary (octet-stream):
schema:
  type: string
  format: binary
</code></pre>
<p>These examples apply to either input payloads of file uploads or response payloads.</p>
<p>A <code>requestBody</code> for submitting a file in a <code>POST</code> operation may look like the following example:</p>
<pre><code class="language-yaml">requestBody:
  content:
    application/octet-stream:
      # any media type is accepted, functionally equivalent to `*/*`
      schema:
        # a binary file of any type
        type: string
        format: binary
</code></pre>
<p>In addition, specific media types MAY be specified:</p>
<pre><code class="language-yaml"># multiple, specific media types may be specified:
requestBody:
  content:
      # a binary file of type png or jpeg
    'image/jpeg':
      schema:
        type: string
        format: binary
    'image/png':
      schema:
        type: string
        format: binary        
</code></pre>
<p>To upload multiple files, a <code>multipart</code> media type MUST be used:</p>
<pre><code class="language-yaml">requestBody:
  content:
    multipart/form-data:
      schema:
        properties:
          # The property name 'file' will be used for all files.
          file:
            type: array
            items:
              type: string
              format: binary

</code></pre>
<h5>Support for x-www-form-urlencoded Request Bodies</h5>
<p>To submit content using form url encoding via <a href="https://tools.ietf.org/html/rfc1866">RFC1866</a>, the following
definition may be used:</p>
<pre><code class="language-yaml">requestBody:
  content:
    application/x-www-form-urlencoded:
      schema:
        type: object
        properties:
          id:
            type: string
            format: uuid
          address:
            # complex types are stringified to support RFC 1866
            type: object
            properties: {}
</code></pre>
<p>In this example, the contents in the <code>requestBody</code> MUST be stringified per <a href="https://tools.ietf.org/html/rfc1866/">RFC1866</a> when passed to the server.  In addition, the <code>address</code> field complex object will be stringified.</p>
<p>When passing complex objects in the <code>application/x-www-form-urlencoded</code> content type, the default serialization strategy of such properties is described in the <a href="#encodingObject"><code>Encoding Object</code></a>'s <a href="#encodingStyle"><code>style</code></a> property as <code>form</code>.</p>
<h5>Special Considerations for <code>multipart</code> Content</h5>
<p>It is common to use <code>multipart/form-data</code> as a <code>Content-Type</code> when transferring request bodies to operations.  In contrast to 2.0, a <code>schema</code> is REQUIRED to define the input parameters to the operation when using <code>multipart</code> content.  This supports complex structures as well as supporting mechanisms for multiple file uploads.</p>
<p>When passing in <code>multipart</code> types, boundaries MAY be used to separate sections of the content being transferred — thus, the following default <code>Content-Type</code>s are defined for <code>multipart</code>:</p>
<ul>
<li>If the property is a primitive, or an array of primitive values, the default Content-Type is <code>text/plain</code></li>
<li>If the property is complex, or an array of complex values, the default Content-Type is <code>application/json</code></li>
<li>If the property is a <code>type: string</code> with <code>format: binary</code> or <code>format: base64</code> (aka a file object), the default Content-Type is <code>application/octet-stream</code></li>
</ul>
<p>Examples:</p>
<pre><code class="language-yaml">requestBody:
  content:
    multipart/form-data:
      schema:
        type: object
        properties:
          id:
            type: string
            format: uuid
          address:
            # default Content-Type for objects is `application/json`
            type: object
            properties: {}
          profileImage:
            # default Content-Type for string/binary is `application/octet-stream`
            type: string
            format: binary
          children:
            # default Content-Type for arrays is based on the `inner` type (text/plain here)
            type: array
            items:
              type: string
          addresses:
            # default Content-Type for arrays is based on the `inner` type (object shown, so `application/json` in this example)
            type: array
            items:
              type: '#/components/schemas/Address'
</code></pre>
<p>An <code>encoding</code> attribute is introduced to give you control over the serialization of parts of <code>multipart</code> request bodies.  This attribute is <em>only</em> applicable to <code>multipart</code> and <code>application/x-www-form-urlencoded</code> request bodies.</p>
<h4><a name="encodingObject"></a>Encoding Object</h4>
<p>A single encoding definition applied to a single schema property.</p>
<h5>Fixed Fields</h5>
<p>Field Name | Type | Description
---|:---:|---
<a name="encodingContentType"></a>contentType | <code>string</code> | The Content-Type for encoding a specific property. Default value depends on the property type: for <code>string</code> with <code>format</code> being <code>binary</code> – <code>application/octet-stream</code>; for other primitive types – <code>text/plain</code>; for <code>object</code> - <code>application/json</code>; for <code>array</code> – the default is defined based on the inner type. The value can be a specific media type (e.g. <code>application/json</code>), a wildcard media type (e.g. <code>image/*</code>), or a comma-separated list of the two types.
<a name="encodingHeaders"></a>headers | Map[<code>string</code>, <a href="#headerObject">Header Object</a> \| <a href="#referenceObject">Reference Object</a>] | A map allowing additional information to be provided as headers, for example <code>Content-Disposition</code>.  <code>Content-Type</code> is described separately and SHALL be ignored in this section. This property SHALL be ignored if the request body media type is not a <code>multipart</code>.
<a name="encodingStyle"></a>style | <code>string</code> | Describes how a specific property value will be serialized depending on its type.  See <a href="#parameterObject">Parameter Object</a> for details on the <a href="#parameterStyle"><code>style</code></a> property. The behavior follows the same values as <code>query</code> parameters, including default values. This property SHALL be ignored if the request body media type is not <code>application/x-www-form-urlencoded</code>.
<a name="encodingExplode"></a>explode | <code>boolean</code> | When this is true, property values of type <code>array</code> or <code>object</code> generate separate parameters for each value of the array, or key-value-pair of the map.  For other types of properties this property has no effect. When <a href="#encodingStyle"><code>style</code></a> is <code>form</code>, the default value is <code>true</code>. For all other styles, the default value is <code>false</code>. This property SHALL be ignored if the request body media type is not <code>application/x-www-form-urlencoded</code>.
<a name="encodingAllowReserved"></a>allowReserved | <code>boolean</code> | Determines whether the parameter value SHOULD allow reserved characters, as defined by <a href="https://tools.ietf.org/html/rfc3986#section-2.2">RFC3986</a> <code>:/?#[]@!$&amp;'()*+,;=</code> to be included without percent-encoding. The default value is <code>false</code>. This property SHALL be ignored if the request body media type is not <code>application/x-www-form-urlencoded</code>.</p>
<p>This object MAY be extended with <a href="#specificationExtensions">Specification Extensions</a>.</p>
<h5>Encoding Object Example</h5>
<pre><code class="language-yaml">requestBody:
  content:
    multipart/mixed:
      schema:
        type: object
        properties:
          id:
            # default is text/plain
            type: string
            format: uuid
          address:
            # default is application/json
            type: object
            properties: {}
          historyMetadata:
            # need to declare XML format!
            description: metadata in XML format
            type: object
            properties: {}
          profileImage:
            # default is application/octet-stream, need to declare an image type only!
            type: string
            format: binary
      encoding:
        historyMetadata:
          # require XML Content-Type in utf-8 encoding
          contentType: application/xml; charset=utf-8
        profileImage:
          # only accept png/jpeg
          contentType: image/png, image/jpeg
          headers:
            X-Rate-Limit-Limit:
              description: The number of allowed requests in the current period
              schema:
                type: integer
</code></pre>
<h4><a name="responsesObject"></a>Responses Object</h4>
<p>A container for the expected responses of an operation.
The container maps a HTTP response code to the expected response.</p>
<p>The documentation is not necessarily expected to cover all possible HTTP response codes because they may not be known in advance.
However, documentation is expected to cover a successful operation response and any known errors.</p>
<p>The <code>default</code> MAY be used as a default response object for all HTTP codes 
that are not covered individually by the specification.</p>
<p>The <code>Responses Object</code> MUST contain at least one response code, and it 
SHOULD be the response for a successful operation call.</p>
<h5>Fixed Fields</h5>
<p>Field Name | Type | Description
---|:---:|---
<a name="responsesDefault"></a>default | <a href="#responseObject">Response Object</a> \| <a href="#referenceObject">Reference Object</a> | The documentation of responses other than the ones declared for specific HTTP response codes. Use this field to cover undeclared responses. A <a href="#referenceObject">Reference Object</a> can link to a response that the <a href="#componentsResponses">OpenAPI Object's components/responses</a> section defines.</p>
<h5>Patterned Fields</h5>
<p>Field Pattern | Type | Description
---|:---:|---
<a name="responsesCode"></a><a href="#httpCodes">HTTP Status Code</a> | <a href="#responseObject">Response Object</a> \| <a href="#referenceObject">Reference Object</a> | Any <a href="#httpCodes">HTTP status code</a> can be used as the property name, but only one property per code, to describe the expected response for that HTTP status code.  A <a href="#referenceObject">Reference Object</a> can link to a response that is defined in the <a href="#componentsResponses">OpenAPI Object's components/responses</a> section. This field MUST be enclosed in quotation marks (for example, "200") for compatibility between JSON and YAML. To define a range of response codes, this field MAY contain the uppercase wildcard character <code>X</code>. For example, <code>2XX</code> represents all response codes between <code>[200-299]</code>. The following range definitions are allowed: <code>1XX</code>, <code>2XX</code>, <code>3XX</code>, <code>4XX</code>, and <code>5XX</code>. If a response range is defined using an explicit code, the explicit code definition takes precedence over the range definition for that code.</p>
<p>This object MAY be extended with <a href="#specificationExtensions">Specification Extensions</a>.</p>
<h5>Responses Object Example</h5>
<p>A 200 response for a successful operation and a default response for others (implying an error):</p>
<pre><code class="language-json">{
  "200": {
    "description": "a pet to be returned",
    "content": {
      "application/json": {
        "schema": {
          "$ref": "#/components/schemas/Pet"
        }
      }
    }
  },
  "default": {
    "description": "Unexpected error",
    "content": {
      "application/json": {
        "schema": {
          "$ref": "#/components/schemas/ErrorModel"
        }
      }
    }
  }
}
</code></pre>
<pre><code class="language-yaml">'200':
  description: a pet to be returned
  content: 
    application/json:
      schema:
        $ref: '#/components/schemas/Pet'
default:
  description: Unexpected error
  content:
    application/json:
      schema:
        $ref: '#/components/schemas/ErrorModel'
</code></pre>
<h4><a name="responseObject"></a>Response Object</h4>
<p>Describes a single response from an API Operation, including design-time, static 
<code>links</code> to operations based on the response.</p>
<h5>Fixed Fields</h5>
<p>Field Name | Type | Description
---|:---:|---
<a name="responseDescription"></a>description | <code>string</code> | <strong>REQUIRED</strong>. A short description of the response. <a href="http://spec.commonmark.org/">CommonMark syntax</a> MAY be used for rich text representation.
<a name="responseHeaders"></a>headers | Map[<code>string</code>, <a href="#headerObject">Header Object</a>  \| <a href="#referenceObject">Reference Object</a>] |  Maps a header name to its definition. <a href="https://tools.ietf.org/html/rfc7230#page-22">RFC7230</a> states header names are case insensitive. If a response header is defined with the name <code>"Content-Type"</code>, it SHALL be ignored.
<a name="responseContent"></a>content | Map[<code>string</code>, <a href="#mediaTypeObject">Media Type Object</a>] | A map containing descriptions of potential response payloads. The key is a media type or <a href="https://tools.ietf.org/html/rfc7231#appendix-D">media type range</a> and the value describes it.  For responses that match multiple keys, only the most specific key is applicable. e.g. text/plain overrides text/*
<a name="responseLinks"></a>links | Map[<code>string</code>, <a href="#linkObject">Link Object</a> \| <a href="#referenceObject">Reference Object</a>] | A map of operations links that can be followed from the response. The key of the map is a short name for the link, following the naming constraints of the names for <a href="#componentsObject">Component Objects</a>.</p>
<p>This object MAY be extended with <a href="#specificationExtensions">Specification Extensions</a>.</p>
<h5>Response Object Examples</h5>
<p>Response of an array of a complex type:</p>
<pre><code class="language-json">{
  "description": "A complex object array response",
  "content": {
    "application/json": {
      "schema": {
        "type": "array",
        "items": {
          "$ref": "#/components/schemas/VeryComplexType"
        }
      }
    }
  }
}
</code></pre>
<pre><code class="language-yaml">description: A complex object array response
content: 
  application/json:
    schema: 
      type: array
      items:
        $ref: '#/components/schemas/VeryComplexType'
</code></pre>
<p>Response with a string type:</p>
<pre><code class="language-json">{
  "description": "A simple string response",
  "content": {
    "text/plain": {
      "schema": {
        "type": "string"
      }
    }
  }

}
</code></pre>
<pre><code class="language-yaml">description: A simple string response
content:
  text/plain:
    schema:
      type: string
</code></pre>
<p>Plain text response with headers:</p>
<pre><code class="language-json">{
  "description": "A simple string response",
  "content": {
    "text/plain": {
      "schema": {
        "type": "string"
      }
    }
  },
  "headers": {
    "X-Rate-Limit-Limit": {
      "description": "The number of allowed requests in the current period",
      "schema": {
        "type": "integer"
      }
    },
    "X-Rate-Limit-Remaining": {
      "description": "The number of remaining requests in the current period",
      "schema": {
        "type": "integer"
      }
    },
    "X-Rate-Limit-Reset": {
      "description": "The number of seconds left in the current period",
      "schema": {
        "type": "integer"
      }
    }
  }
}
</code></pre>
<pre><code class="language-yaml">description: A simple string response
content:
  text/plain:
    schema:
      type: string
    example: 'whoa!'
headers:
  X-Rate-Limit-Limit:
    description: The number of allowed requests in the current period
    schema:
      type: integer
  X-Rate-Limit-Remaining:
    description: The number of remaining requests in the current period
    schema:
      type: integer
  X-Rate-Limit-Reset:
    description: The number of seconds left in the current period
    schema:
      type: integer
</code></pre>
<p>Response with no return value:</p>
<pre><code class="language-json">{
  "description": "object created"
}
</code></pre>
<pre><code class="language-yaml">description: object created
</code></pre>
<h4><a name="callbackObject"></a>Callback Object</h4>
<p>A map of possible out-of band callbacks related to the parent operation.
Each value in the map is a <a href="#pathItemObject">Path Item Object</a> that describes a set of requests that may be initiated by the API provider and the expected responses.
The key value used to identify the callback object is an expression, evaluated at runtime, that identifies a URL to use for the callback operation.</p>
<h5>Patterned Fields</h5>
<p>Field Pattern | Type | Description
---|:---:|---
<a name="callbackExpression"></a>{expression} | <a href="#pathItemObject">Path Item Object</a> | A Path Item Object used to define a callback request and expected responses.  A <a href="../examples/v3.0/callback-example.yaml">complete example</a> is available.</p>
<p>This object MAY be extended with <a href="#specificationExtensions">Specification Extensions</a>.</p>
<h5>Key Expression</h5>
<p>The key that identifies the <a href="#pathItemObject">Path Item Object</a> is a <a href="#runtimeExpression">runtime expression</a> that can be evaluated in the context of a runtime HTTP request/response to identify the URL to be used for the callback request.
A simple example might be <code>$request.body#/url</code>.
However, using a <a href="#runtimeExpression">runtime expression</a> the complete HTTP message can be accessed.
This includes accessing any part of a body that a JSON Pointer <a href="https://tools.ietf.org/html/rfc6901">RFC6901</a> can reference.</p>
<p>For example, given the following HTTP request:</p>
<pre><code class="language-http">POST /subscribe/myevent?queryUrl=http://clientdomain.com/stillrunning HTTP/1.1
Host: example.org
Content-Type: application/json
Content-Length: 187

{
  "failedUrl" : "http://clientdomain.com/failed",
  "successUrls" : [
    "http://clientdomain.com/fast",
    "http://clientdomain.com/medium",
    "http://clientdomain.com/slow"
  ] 
}

201 Created
Location: http://example.org/subscription/1
</code></pre>
<p>The following examples show how the various expressions evaluate, assuming the callback operation has a path parameter named <code>eventType</code> and a query parameter named <code>queryUrl</code>.</p>
<p>Expression | Value 
---|:---
$url | http://example.org/subscribe/myevent?queryUrl=http://clientdomain.com/stillrunning
$method | POST
$request.path.eventType | myevent
$request.query.queryUrl | http://clientdomain.com/stillrunning
$request.header.content-Type | application/json
$request.body#/failedUrl | http://clientdomain.com/stillrunning
$request.body#/successUrls/2 | http://clientdomain.com/medium
$response.header.Location | http://example.org/subscription/1</p>
<h5>Callback Object Example</h5>
<p>The following example shows a callback to the URL specified by the <code>id</code> and <code>email</code> property in the request body.</p>
<pre><code class="language-yaml">myWebhook:
  'http://notificationServer.com?transactionId={$request.body#/id}&amp;email={$request.body#/email}':
    post:
      requestBody:
        description: Callback payload
        content: 
          'application/json':
            schema:
              $ref: '#/components/schemas/SomePayload'
      responses:
        '200':
          description: webhook successfully processed and no retries will be performed
</code></pre>
<h4><a name="exampleObject"></a>Example Object</h4>
<h5>Fixed Fields</h5>
<p>Field Name | Type | Description
---|:---:|---
<a name="exampleSummary"></a>summary | <code>string</code> | Short description for the example.
<a name="exampleDescription"></a>description | <code>string</code> | Long description for the example. <a href="http://spec.commonmark.org/">CommonMark syntax</a> MAY be used for rich text representation.
<a name="exampleValue"></a>value | Any | Embedded literal example. The <code>value</code> field and <code>externalValue</code> field are mutually exclusive. To represent examples of media types that cannot naturally represented in JSON or YAML, use a string value to contain the example, escaping where necessary.
<a name="exampleExternalValue"></a>externalValue | <code>string</code> | A URL that points to the literal example. This provides the capability to reference examples that cannot easily be included in JSON or YAML documents.  The <code>value</code> field and <code>externalValue</code> field are mutually exclusive.</p>
<p>This object MAY be extended with <a href="#specificationExtensions">Specification Extensions</a>.</p>
<p>In all cases, the example value is expected to be compatible with the type schema 
of its associated value.  Tooling implementations MAY choose to 
validate compatibility automatically, and reject the example value(s) if incompatible.</p>
<h5>Example Object Example</h5>
<pre><code class="language-yaml"># in a model
schemas:
  properties:
    name:
      type: string
      examples:
        name:
          $ref: http://example.org/petapi-examples/openapi.json#/components/examples/name-example

# in a request body:
  requestBody:
    content:
      'application/json':
        schema:
          $ref: '#/components/schemas/Address'
        examples: 
          foo:
            summary: A foo example
            value: {"foo": "bar"}
          bar:
            summary: A bar example
            value: {"bar": "baz"}
      'application/xml':
        examples: 
          xmlExample:
            summary: This is an example in XML
            externalValue: 'http://example.org/examples/address-example.xml'
      'text/plain':
        examples:
          textExample: 
            summary: This is a text example
            externalValue: 'http://foo.bar/examples/address-example.txt' 


# in a parameter
  parameters:
    - name: 'zipCode'
      in: 'query'
      schema:
        type: 'string'
        format: 'zip-code'
        examples:
          zip-example: 
            $ref: '#/components/examples/zip-example'

# in a response
  responses:
    '200':
      description: your car appointment has been booked
      content: 
        application/json:
          schema:
            $ref: '#/components/schemas/SuccessResponse'
          examples:
            confirmation-success:
              $ref: '#/components/examples/confirmation-success'
</code></pre>
<h4><a name="linkObject"></a>Link Object</h4>
<p>The <code>Link object</code> represents a possible design-time link for a response.
The presence of a link does not guarantee the caller's ability to successfully invoke it, rather it provides a known relationship and traversal mechanism between responses and other operations.</p>
<p>Unlike <em>dynamic</em> links (i.e. links provided <strong>in</strong> the response payload), the OAS linking mechanism does not require link information in the runtime response.</p>
<p>For computing links, and providing instructions to execute them, a <a href="#runtimeExpression">runtime expression</a> is used for accessing values in an operation and using them as parameters while invoking the linked operation.</p>
<h5>Fixed Fields</h5>
<p>Field Name  |  Type  | Description
---|:---:|---
<a name="linkOperationRef"></a>operationRef | <code>string</code> | A relative or absolute reference to an OAS operation. This field is mutually exclusive of the <code>operationId</code> field, and MUST point to an <a href="#operationObject">Operation Object</a>. Relative <code>operationRef</code> values MAY be used to locate an existing <a href="#operationObject">Operation Object</a> in the OpenAPI definition.
<a name="linkOperationId"></a>operationId  | <code>string</code> | The name of an <em>existing</em>, resolvable OAS operation, as defined with a unique <code>operationId</code>.  This field is mutually exclusive of the <code>operationRef</code> field.<br />
<a name="linkParameters"></a>parameters   | Map[<code>string</code>, Any \| <a href="#runtimeExpression">{expression}</a>] | A map representing parameters to pass to an operation as specified with <code>operationId</code> or identified via <code>operationRef</code>. The key is the parameter name to be used, whereas the value can be a constant or an expression to be evaluated and passed to the linked operation.  The parameter name can be qualified using the <a href="#parameterIn">parameter location</a> <code>[{in}.]{name}</code> for operations that use the same parameter name in different locations (e.g. path.id).
<a name="linkRequestBody"></a>requestBody | Any \| <a href="#runtimeExpression">{expression}</a> | A literal value or <a href="#runtimeExpression">{expression}</a> to use as a request body when calling the target operation.
<a name="linkDescription"></a>description  | <code>string</code> | A description of the link. <a href="http://spec.commonmark.org/">CommonMark syntax</a> MAY be used for rich text representation.
<a name="linkServer"></a>server       | <a href="#serverObject">Server Object</a> | A server object to be used by the target operation.</p>
<p>This object MAY be extended with <a href="#specificationExtensions">Specification Extensions</a>.</p>
<p>A linked operation MUST be identified using either an <code>operationRef</code> or <code>operationId</code>.
In the case of an <code>operationId</code>, it MUST be unique and resolved in the scope of the OAS document.
Because of the potential for name clashes, the <code>operationRef</code> syntax is preferred 
for specifications with external references.</p>
<h5>Examples</h5>
<p>Computing a link from a request operation where the <code>$request.path.id</code> is used to pass a request parameter to the linked operation.</p>
<pre><code class="language-yaml">paths:
  /users/{id}:
    parameters:
    - name: id
      in: path
      required: true
      description: the user identifier, as userId 
      schema:
        type: string
    get:
      responses:
        '200':
          description: the user being returned
          content:
            application/json:
              schema:
                type: object
                properties:
                  uuid: # the unique user id
                    type: string
                    format: uuid
          links:
            address:
              # the target link operationId
              operationId: getUserAddress
              parameters:
                # get the `id` field from the request path parameter named `id`
                userId: $request.path.id
  # the path item of the linked operation
  /users/{userid}/address:
    parameters:
    - name: userid
      in: path
      required: true
      description: the user identifier, as userId 
      schema:
        type: string
    # linked operation
    get:
      operationId: getUserAddress
      responses:
        '200':
          description: the user's address
</code></pre>
<p>When a runtime expression fails to evaluate, no parameter value is passed to the target operation.</p>
<p>Values from the response body can be used to drive a linked operation.</p>
<pre><code class="language-yaml">links:
  address:
    operationId: getUserAddressByUUID
    parameters:
      # get the `uuid` field from the `uuid` field in the response body
      userUuid: $response.body#/uuid
</code></pre>
<p>Clients follow all links at their discretion. 
Neither permissions, nor the capability to make a successful call to that link, is guaranteed 
solely by the existence of a relationship.</p>
<h5>OperationRef Examples</h5>
<p>As references to <code>operationId</code> MAY NOT be possible (the <code>operationId</code> is an optional 
value), references MAY also be made through a relative <code>operationRef</code>:</p>
<pre><code class="language-yaml">links:
  UserRepositories:
    # returns array of '#/components/schemas/repository'
    operationRef: '#/paths/~12.0~1repositories~1{username}/get'
    parameters:
      username: $response.body#/username
</code></pre>
<p>or an absolute <code>operationRef</code>:</p>
<pre><code class="language-yaml">links:
  UserRepositories:
    # returns array of '#/components/schemas/repository'
    operationRef: 'https://na2.gigantic-server.com/#/paths/~12.0~1repositories~1{username}/get'
    parameters:
      username: $response.body#/username
</code></pre>
<p>Note that in the use of <code>operationRef</code>, the <em>escaped forward-slash</em> is necessary when 
using JSON references.</p>
<h5><a name="runtimeExpression"></a>Runtime Expressions</h5>
<p>Runtime expressions allow defining values based on information that will only be available within the HTTP message in an actual API call.
This mechanism is used by <a href="#linkObject">Link Objects</a> and <a href="#callbackObject">Callback Objects</a>.</p>
<p>The runtime expression is defined by the following <a href="https://tools.ietf.org/html/rfc5234">ABNF</a> syntax</p>
<pre><code>      expression = ( "$url" | "$method" | "$statusCode" | "$request." source | "$response." source )
      source = ( header-reference | query-reference | path-reference | body-reference )  
      header-reference = "header." token
      query-reference = "query." name  
      path-reference = "path." name
      body-reference = "body" ["#" fragment]
      fragment = a JSON Pointer [RFC 6901](https://tools.ietf.org/html/rfc6901)  
      name = *( char )
      char = as per RFC [7159](https://tools.ietf.org/html/rfc7159#section-7)
      token = as per RFC [7230](https://tools.ietf.org/html/rfc7230#section-3.2.6)
</code></pre>
<p>The <code>name</code> identifier is case-sensitive, whereas <code>token</code> is not.</p>
<p>The table below provides examples of runtime expressions and examples of their use in a value:</p>
<h5><a name="runtimeExpressionExamples"></a>Examples</h5>
<p>Source Location | example expression  | notes
---|:---|:---|
HTTP Method            | <code>$method</code>         | The allowable values for the <code>$method</code> will be those for the HTTP operation.
Requested media type | <code>$request.header.accept</code>        |<br />
Request parameter      | <code>$request.path.id</code>        | Request parameters MUST be declared in the <code>parameters</code> section of the parent operation or they cannot be evaluated. This includes request headers.
Request body property   | <code>$request.body#/user/uuid</code>   | In operations which accept payloads, references may be made to portions of the <code>requestBody</code> or the entire body.
Request URL            | <code>$url</code>            |<br />
Response value         | <code>$response.body#/status</code>       |  In operations which return payloads, references may be made to portions of the response body or the entire body.
Response header        | <code>$response.header.Server</code> |  Single header values only are available</p>
<p>Runtime expressions preserve the type of the referenced value.
Expressions can be embedded into string values by surrounding the expression with <code>{}</code> curly braces.</p>
<h4><a name="headerObject"></a>Header Object</h4>
<p>The Header Object follows the structure of the <a href="#parameterObject">Parameter Object</a> with the following changes:</p>
<ol>
<li><code>name</code> MUST NOT be specified, it is given in the corresponding <code>headers</code> map.</li>
<li><code>in</code> MUST NOT be specified, it is implicitly in <code>header</code>.</li>
<li>All traits that are affected by the location MUST be applicable to a location of <code>header</code> (for example, <a href="#parameterStyle"><code>style</code></a>).</li>
</ol>
<h5>Header Object Example</h5>
<p>A simple header of type <code>integer</code>:</p>
<pre><code class="language-json">{
  "description": "The number of allowed requests in the current period",
  "schema": {
    "type": "integer"
  }
}
</code></pre>
<pre><code class="language-yaml">description: The number of allowed requests in the current period
schema:
  type: integer
</code></pre>
<h4><a name="tagObject"></a>Tag Object</h4>
<p>Adds metadata to a single tag that is used by the <a href="#operationObject">Operation Object</a>.
It is not mandatory to have a Tag Object per tag defined in the Operation Object instances.</p>
<h5>Fixed Fields</h5>
<p>Field Name | Type | Description
---|:---:|---
<a name="tagName"></a>name | <code>string</code> | <strong>REQUIRED</strong>. The name of the tag.
<a name="tagDescription"></a>description | <code>string</code> | A short description for the tag. <a href="http://spec.commonmark.org/">CommonMark syntax</a> MAY be used for rich text representation.
<a name="tagExternalDocs"></a>externalDocs | <a href="#externalDocumentationObject">External Documentation Object</a> | Additional external documentation for this tag.</p>
<p>This object MAY be extended with <a href="#specificationExtensions">Specification Extensions</a>.</p>
<h5>Tag Object Example</h5>
<pre><code class="language-json">{
	"name": "pet",
	"description": "Pets operations"
}
</code></pre>
<pre><code class="language-yaml">name: pet
description: Pets operations
</code></pre>
<h4><a name="referenceObject"></a>Reference Object</h4>
<p>A simple object to allow referencing other components in the specification, internally and externally.</p>
<p>The Reference Object is defined by <a href="https://tools.ietf.org/html/draft-pbryan-zyp-json-ref-03">JSON Reference</a> and follows the same structure, behavior and rules.</p>
<p>For this specification, reference resolution is accomplished as defined by the JSON Reference specification and not by the JSON Schema specification.</p>
<h5>Fixed Fields</h5>
<p>Field Name | Type | Description
---|:---:|---
<a name="referenceRef"></a>$ref | <code>string</code> | <strong>REQUIRED</strong>. The reference string.</p>
<p>This object cannot be extended with additional properties and any properties added SHALL be ignored.</p>
<h5>Reference Object Example</h5>
<pre><code class="language-json">{
	"$ref": "#/components/schemas/Pet"
}
</code></pre>
<pre><code class="language-yaml">$ref: '#/components/schemas/Pet'
</code></pre>
<h5>Relative Schema Document Example</h5>
<pre><code class="language-json">{
  "$ref": "Pet.json"
}
</code></pre>
<pre><code class="language-yaml">$ref: Pet.yaml
</code></pre>
<h5>Relative Documents With Embedded Schema Example</h5>
<pre><code class="language-json">{
  "$ref": "definitions.json#/Pet"
}
</code></pre>
<pre><code class="language-yaml">$ref: definitions.yaml#/Pet
</code></pre>
<h4><a name="schemaObject"></a>Schema Object</h4>
<p>The Schema Object allows the definition of input and output data types.
These types can be objects, but also primitives and arrays.
This object is an extended subset of the <a href="http://json-schema.org/">JSON Schema Specification Wright Draft 00</a>.</p>
<p>For more information about the properties, see <a href="https://tools.ietf.org/html/draft-wright-json-schema-00">JSON Schema Core</a> and <a href="https://tools.ietf.org/html/draft-wright-json-schema-validation-00">JSON Schema Validation</a>.
Unless stated otherwise, the property definitions follow the JSON Schema.</p>
<h5>Properties</h5>
<p>The following properties are taken directly from the JSON Schema definition and follow the same specifications:</p>
<ul>
<li>title</li>
<li>multipleOf</li>
<li>maximum</li>
<li>exclusiveMaximum</li>
<li>minimum</li>
<li>exclusiveMinimum</li>
<li>maxLength</li>
<li>minLength</li>
<li>pattern (This string SHOULD be a valid regular expression, according to the <a href="https://www.ecma-international.org/ecma-262/5.1/#sec-7.8.5">ECMA 262 regular expression</a> dialect)</li>
<li>maxItems</li>
<li>minItems</li>
<li>uniqueItems</li>
<li>maxProperties</li>
<li>minProperties</li>
<li>required</li>
<li>enum</li>
</ul>
<p>The following properties are taken from the JSON Schema definition but their definitions were adjusted to the OpenAPI Specification.</p>
<ul>
<li>type - Value MUST be a string. Multiple types via an array are not supported.</li>
<li>allOf - Inline or referenced schema MUST be of a <a href="#schemaObject">Schema Object</a> and not a standard JSON Schema.</li>
<li>oneOf - Inline or referenced schema MUST be of a <a href="#schemaObject">Schema Object</a> and not a standard JSON Schema.</li>
<li>anyOf - Inline or referenced schema MUST be of a <a href="#schemaObject">Schema Object</a> and not a standard JSON Schema.</li>
<li>not - Inline or referenced schema MUST be of a <a href="#schemaObject">Schema Object</a> and not a standard JSON Schema.</li>
<li>items - Value MUST be an object and not an array. Inline or referenced schema MUST be of a <a href="#schemaObject">Schema Object</a> and not a standard JSON Schema. <code>items</code> MUST be present if the <code>type</code> is <code>array</code>.</li>
<li>properties - Property definitions MUST be a <a href="#schemaObject">Schema Object</a> and not a standard JSON Schema (inline or referenced).</li>
<li>additionalProperties - Value can be boolean or object. Inline or referenced schema MUST be of a <a href="#schemaObject">Schema Object</a> and not a standard JSON Schema.</li>
<li>description - <a href="http://spec.commonmark.org/">CommonMark syntax</a> MAY be used for rich text representation.</li>
<li>format - See <a href="#dataTypeFormat">Data Type Formats</a> for further details. While relying on JSON Schema's defined formats, the OAS offers a few additional predefined formats.</li>
<li>default - The default value represents what would be assumed by the consumer of the input as the value of the schema if one is not provided. Unlike JSON Schema, the value MUST conform to the defined type for the Schema Object defined at the same level. For example, if <code>type</code> is <code>string</code>, then <code>default</code> can be <code>"foo"</code> but cannot be <code>1</code>.</li>
</ul>
<p>Alternatively, any time a Schema Object can be used, a <a href="#referenceObject">Reference Object</a> can be used in its place. This allows referencing definitions instead of defining them inline.</p>
<p>Additional properties defined by the JSON Schema specification that are not mentioned here are strictly unsupported.</p>
<p>Other than the JSON Schema subset fields, the following fields MAY be used for further schema documentation:</p>
<h5>Fixed Fields</h5>
<p>Field Name | Type | Description
---|:---:|---
<a name="schemaNullable"></a>nullable | <code>boolean</code> | Allows sending a <code>null</code> value for the defined schema. Default value is <code>false</code>.
<a name="schemaDiscriminator"></a>discriminator | <a href="#discriminatorObject">Discriminator Object</a> | Adds support for polymorphism. The discriminator is an object name that is used to differentiate between other schemas which may satisfy the payload description. See <a href="#schemaComposition">Composition and Inheritance</a> for more details.
<a name="schemaReadOnly"></a>readOnly | <code>boolean</code> | Relevant only for Schema <code>"properties"</code> definitions. Declares the property as "read only". This means that it MAY be sent as part of a response but SHOULD NOT be sent as part of the request. If the property is marked as <code>readOnly</code> being <code>true</code> and is in the <code>required</code> list, the <code>required</code> will take effect on the response only. A property MUST NOT be marked as both <code>readOnly</code> and <code>writeOnly</code> being <code>true</code>. Default value is <code>false</code>.
<a name="schemaWriteOnly"></a>writeOnly | <code>boolean</code> | Relevant only for Schema <code>"properties"</code> definitions. Declares the property as "write only". Therefore, it MAY be sent as part of a request but SHOULD NOT be sent as part of the response. If the property is marked as <code>writeOnly</code> being <code>true</code> and is in the <code>required</code> list, the <code>required</code> will take effect on the request only. A property MUST NOT be marked as both <code>readOnly</code> and <code>writeOnly</code> being <code>true</code>. Default value is <code>false</code>.
<a name="schemaXml"></a>xml | <a href="#xmlObject">XML Object</a> | This MAY be used only on properties schemas. It has no effect on root schemas. Adds additional metadata to describe the XML representation of this property.
<a name="schemaExternalDocs"></a>externalDocs | <a href="#externalDocumentationObject">External Documentation Object</a> | Additional external documentation for this schema. 
<a name="schemaExample"></a>example | Any | A free-form property to include an example of an instance for this schema. To represent examples that cannot be naturally represented in JSON or YAML, a string value can be used to contain the example with escaping where necessary.
<a name="schemaDeprecated"></a> deprecated | <code>boolean</code> | Specifies that a schema is deprecated and SHOULD be transitioned out of usage. Default value is <code>false</code>.</p>
<p>This object MAY be extended with <a href="#specificationExtensions">Specification Extensions</a>.</p>
<h6><a name="schemaComposition"></a>Composition and Inheritance (Polymorphism)</h6>
<p>The OpenAPI Specification allows combining and extending model definitions using the <code>allOf</code> property of JSON Schema, in effect offering model composition.
<code>allOf</code> takes an array of object definitions that are validated <em>independently</em> but together compose a single object.</p>
<p>While composition offers model extensibility, it does not imply a hierarchy between the models.
To support polymorphism, the OpenAPI Specification adds the <code>discriminator</code> field.
When used, the <code>discriminator</code> will be the name of the property that decides which schema definition validates the structure of the model.
As such, the <code>discriminator</code> field MUST be a required field.
There are two ways to define the value of a discriminator for an inheriting instance.</p>
<ul>
<li>Use the schema name.</li>
<li>Override the schema name by overriding the property with a new value. If a new value exists, this takes precedence over the schema name.
As such, inline schema definitions, which do not have a given id, <em>cannot</em> be used in polymorphism.</li>
</ul>
<h6>XML Modeling</h6>
<p>The <a href="#schemaXml">xml</a> property allows extra definitions when translating the JSON definition to XML.
The <a href="#xmlObject">XML Object</a> contains additional information about the available options.</p>
<h5>Schema Object Examples</h5>
<h6>Primitive Sample</h6>
<pre><code class="language-json">{
  "type": "string",
  "format": "email"
}
</code></pre>
<pre><code class="language-yaml">type: string
format: email
</code></pre>
<h6>Simple Model</h6>
<pre><code class="language-json">{
  "type": "object",
  "required": [
    "name"
  ],
  "properties": {
    "name": {
      "type": "string"
    },
    "address": {
      "$ref": "#/components/schemas/Address"
    },
    "age": {
      "type": "integer",
      "format": "int32",
      "minimum": 0
    }
  }
}
</code></pre>
<pre><code class="language-yaml">type: object
required:
- name
properties:
  name:
    type: string
  address:
    $ref: '#/components/schemas/Address'
  age:
    type: integer
    format: int32
    minimum: 0
</code></pre>
<h6>Model with Map/Dictionary Properties</h6>
<p>For a simple string to string mapping:</p>
<pre><code class="language-json">{
  "type": "object",
  "additionalProperties": {
    "type": "string"
  }
}
</code></pre>
<pre><code class="language-yaml">type: object
additionalProperties:
  type: string
</code></pre>
<p>For a string to model mapping:</p>
<pre><code class="language-json">{
  "type": "object",
  "additionalProperties": {
    "$ref": "#/components/schemas/ComplexModel"
  }
}
</code></pre>
<pre><code class="language-yaml">type: object
additionalProperties:
  $ref: '#/components/schemas/ComplexModel'
</code></pre>
<h6>Model with Example</h6>
<pre><code class="language-json">{
  "type": "object",
  "properties": {
    "id": {
      "type": "integer",
      "format": "int64"
    },
    "name": {
      "type": "string"
    }
  },
  "required": [
    "name"
  ],
  "example": {
    "name": "Puma",
    "id": 1
  }
}
</code></pre>
<pre><code class="language-yaml">type: object
properties:
  id:
    type: integer
    format: int64
  name:
    type: string
required:
- name
example:
  name: Puma
  id: 1
</code></pre>
<h6>Models with Composition</h6>
<pre><code class="language-json">{
  "components": {
    "schemas": {
      "ErrorModel": {
        "type": "object",
        "required": [
          "message",
          "code"
        ],
        "properties": {
          "message": {
            "type": "string"
          },
          "code": {
            "type": "integer",
            "minimum": 100,
            "maximum": 600
          }
        }
      },
      "ExtendedErrorModel": {
        "allOf": [
          {
            "$ref": "#/components/schemas/ErrorModel"
          },
          {
            "type": "object",
            "required": [
              "rootCause"
            ],
            "properties": {
              "rootCause": {
                "type": "string"
              }
            }
          }
        ]
      }
    }
  }
}
</code></pre>
<pre><code class="language-yaml">components:
  schemas:
    ErrorModel:
      type: object
      required:
      - message
      - code
      properties:
        message:
          type: string
        code:
          type: integer
          minimum: 100
          maximum: 600
    ExtendedErrorModel:
      allOf:
      - $ref: '#/components/schemas/ErrorModel'
      - type: object
        required:
        - rootCause
        properties:
          rootCause:
            type: string
</code></pre>
<h6>Models with Polymorphism Support</h6>
<pre><code class="language-json">{
  "components": {
    "schemas": {
      "Pet": {
        "type": "object",
        "discriminator": {
          "propertyName": "petType"
        },
        "properties": {
          "name": {
            "type": "string"
          },
          "petType": {
            "type": "string"
          }
        },
        "required": [
          "name",
          "petType"
        ]
      },
      "Cat": {
        "description": "A representation of a cat. Note that `Cat` will be used as the discriminator value.",
        "allOf": [
          {
            "$ref": "#/components/schemas/Pet"
          },
          {
            "type": "object",
            "properties": {
              "huntingSkill": {
                "type": "string",
                "description": "The measured skill for hunting",
                "default": "lazy",
                "enum": [
                  "clueless",
                  "lazy",
                  "adventurous",
                  "aggressive"
                ]
              }
            },
            "required": [
              "huntingSkill"
            ]
          }
        ]
      },
      "Dog": {
        "description": "A representation of a dog. Note that `Dog` will be used as the discriminator value.",
        "allOf": [
          {
            "$ref": "#/components/schemas/Pet"
          },
          {
            "type": "object",
            "properties": {
              "packSize": {
                "type": "integer",
                "format": "int32",
                "description": "the size of the pack the dog is from",
                "default": 0,
                "minimum": 0
              }
            },
            "required": [
              "packSize"
            ]
          }
        ]
      }
    }
  }
}
</code></pre>
<pre><code class="language-yaml">components:
  schemas:
    Pet:
      type: object
      discriminator:
        propertyName: petType
      properties:
        name:
          type: string
        petType:
          type: string
      required:
      - name
      - petType
    Cat:  ## "Cat" will be used as the discriminator value
      description: A representation of a cat
      allOf:
      - $ref: '#/components/schemas/Pet'
      - type: object
        properties:
          huntingSkill:
            type: string
            description: The measured skill for hunting
            enum:
            - clueless
            - lazy
            - adventurous
            - aggressive
        required:
        - huntingSkill
    Dog:  ## "Dog" will be used as the discriminator value
      description: A representation of a dog
      allOf:
      - $ref: '#/components/schemas/Pet'
      - type: object
        properties:
          packSize:
            type: integer
            format: int32
            description: the size of the pack the dog is from
            default: 0
            minimum: 0
        required:
        - packSize
</code></pre>
<h4><a name="discriminatorObject"></a>Discriminator Object</h4>
<p>When request bodies or response payloads may be one of a number of different schemas, a <code>discriminator</code> object can be used to aid in serialization, deserialization, and validation.  The discriminator is a specific object in a schema which is used to inform the consumer of the specification of an alternative schema based on the value associated with it.</p>
<p>When using the discriminator, <em>inline</em> schemas will not be considered.</p>
<h5>Fixed Fields</h5>
<p>Field Name | Type | Description
---|:---:|---
<a name="propertyName"></a>propertyName | <code>string</code> | <strong>REQUIRED</strong>. The name of the property in the payload that will hold the discriminator value.
<a name="discriminatorMapping"></a> mapping | Map[<code>string</code>, <code>string</code>] | An object to hold mappings between payload values and schema names or references.</p>
<p>The discriminator attribute is legal only when using one of the composite keywords <code>oneOf</code>, <code>anyOf</code>, <code>allOf</code>.</p>
<p>In OAS 3.0, a response payload MAY be described to be exactly one of any number of types:</p>
<pre><code>MyResponseType:
  oneOf:
  - $ref: '#/components/schemas/Cat'
  - $ref: '#/components/schemas/Dog'
  - $ref: '#/components/schemas/Lizard'
</code></pre>
<p>which means the payload <em>MUST</em>, by validation, match exactly one of the schemas described by <code>Cat</code>, <code>Dog</code>, or <code>Lizard</code>.  In this case, a discriminator MAY act as a "hint" to shortcut validation and selection of the matching schema which may be a costly operation, depending on the complexity of the schema. We can then describe exactly which field tells us which schema to use:</p>
<pre><code>MyResponseType:
  oneOf:
  - $ref: '#/components/schemas/Cat'
  - $ref: '#/components/schemas/Dog'
  - $ref: '#/components/schemas/Lizard'
  discriminator:
    propertyName: pet_type
</code></pre>
<p>The expectation now is that a property with name <code>pet_type</code> <em>MUST</em> be present in the response payload, and the value will correspond to the name of a schema defined in the OAS document.  Thus the response payload:</p>
<pre><code>{
  "id": 12345,
  "pet_type": "Cat"
}
</code></pre>
<p>Will indicate that the <code>Cat</code> schema be used in conjunction with this payload.</p>
<p>In scenarios where the value of the discriminator field does not match the schema name or implicit mapping is not possible, an optional <code>mapping</code> definition MAY be used:</p>
<pre><code>MyResponseType:
  oneOf:
  - $ref: '#/components/schemas/Cat'
  - $ref: '#/components/schemas/Dog'
  - $ref: '#/components/schemas/Lizard'
  - $ref: 'https://gigantic-server.com/schemas/Monster/schema.json'
  discriminator:
    propertyName: pet_type
    mapping:
      dog: '#/components/schemas/Dog'
      monster: 'https://gigantic-server.com/schemas/Monster/schema.json'
</code></pre>
<p>Here the discriminator <em>value</em> of <code>dog</code> will map to the schema <code>#/components/schemas/Dog</code>, rather than the default (implicit) value of <code>Dog</code>.  If the discriminator <em>value</em> does not match an implicit or explicit mapping, no schema can be determined and validation SHOULD fail. Mapping keys MUST be string values, but tooling MAY convert response values to strings for comparison.</p>
<p>When used in conjunction with the <code>anyOf</code> construct, the use of the discriminator can avoid ambiguity where multiple schemas may satisfy a single payload.</p>
<p>In both the <code>oneOf</code> and <code>anyOf</code> use cases, all possible schemas MUST be listed explicitly.  To avoid redundancy, the discriminator MAY be added to a parent schema definition, and all schemas comprising the parent schema in an <code>allOf</code> construct may be used as an alternate schema.</p>
<p>For example:</p>
<pre><code>components:
  schemas:
    Pet:
      type: object
      required:
      - pet_type
      properties:
        pet_type:
          type: string
      discriminator:
        propertyName: pet_type
        mapping:
          cachorro: Dog
    Cat:
      allOf:
      - $ref: '#/components/schemas/Pet'
      - type: object
        # all other properties specific to a `Cat`
        properties:
          name:
            type: string
    Dog:
      allOf:
      - $ref: '#/components/schemas/Pet'
      - type: object
        # all other properties specific to a `Dog`
        properties:
          bark:
            type: string
    Lizard:
      allOf:
      - $ref: '#/components/schemas/Pet'
      - type: object
        # all other properties specific to a `Lizard`
        properties:
          lovesRocks:
            type: boolean
</code></pre>
<p>a payload like this:</p>
<pre><code>{
  "pet_type": "Cat",
  "name": "misty"
}
</code></pre>
<p>will indicate that the <code>Cat</code> schema be used.  Likewise this schema:</p>
<pre><code>{
  "pet_type": "cachorro",
  "bark": "soft"
}
</code></pre>
<p>will map to <code>Dog</code> because of the definition in the <code>mappings</code> element.</p>
<h4><a name="xmlObject"></a>XML Object</h4>
<p>A metadata object that allows for more fine-tuned XML model definitions.</p>
<p>When using arrays, XML element names are <em>not</em> inferred (for singular/plural forms) and the <code>name</code> property SHOULD be used to add that information.
See examples for expected behavior.</p>
<h5>Fixed Fields</h5>
<p>Field Name | Type | Description
---|:---:|---
<a name="xmlName"></a>name | <code>string</code> | Replaces the name of the element/attribute used for the described schema property. When defined within <code>items</code>, it will affect the name of the individual XML elements within the list. When defined alongside <code>type</code> being <code>array</code> (outside the <code>items</code>), it will affect the wrapping element and only if <code>wrapped</code> is <code>true</code>. If <code>wrapped</code> is <code>false</code>, it will be ignored.
<a name="xmlNamespace"></a>namespace | <code>string</code> | The URI of the namespace definition. Value MUST be in the form of an absolute URI.
<a name="xmlPrefix"></a>prefix | <code>string</code> | The prefix to be used for the <a href="#xmlName">name</a>.
<a name="xmlAttribute"></a>attribute | <code>boolean</code> | Declares whether the property definition translates to an attribute instead of an element. Default value is <code>false</code>.
<a name="xmlWrapped"></a>wrapped | <code>boolean</code> | MAY be used only for an array definition. Signifies whether the array is wrapped (for example, <code>&lt;books&gt;&lt;book/&gt;&lt;book/&gt;&lt;/books&gt;</code>) or unwrapped (<code>&lt;book/&gt;&lt;book/&gt;</code>). Default value is <code>false</code>. The definition takes effect only when defined alongside <code>type</code> being <code>array</code> (outside the <code>items</code>).</p>
<p>This object MAY be extended with <a href="#specificationExtensions">Specification Extensions</a>.</p>
<h5>XML Object Examples</h5>
<p>The examples of the XML object definitions are included inside a property definition of a <a href="#schemaObject">Schema Object</a> with a sample of the XML representation of it.</p>
<h6>No XML Element</h6>
<p>Basic string property:</p>
<pre><code class="language-json">{
    "animals": {
        "type": "string"
    }
}
</code></pre>
<pre><code class="language-yaml">animals:
  type: string
</code></pre>
<pre><code class="language-xml">&lt;animals&gt;...&lt;/animals&gt;
</code></pre>
<p>Basic string array property (<a href="#xmlWrapped"><code>wrapped</code></a> is <code>false</code> by default):</p>
<pre><code class="language-json">{
    "animals": {
        "type": "array",
        "items": {
            "type": "string"
        }
    }
}
</code></pre>
<pre><code class="language-yaml">animals:
  type: array
  items:
    type: string
</code></pre>
<pre><code class="language-xml">&lt;animals&gt;...&lt;/animals&gt;
&lt;animals&gt;...&lt;/animals&gt;
&lt;animals&gt;...&lt;/animals&gt;
</code></pre>
<h6>XML Name Replacement</h6>
<pre><code class="language-json">{
  "animals": {
    "type": "string",
    "xml": {
      "name": "animal"
    }
  }
}
</code></pre>
<pre><code class="language-yaml">animals:
  type: string
  xml:
    name: animal
</code></pre>
<pre><code class="language-xml">&lt;animal&gt;...&lt;/animal&gt;
</code></pre>
<h6>XML Attribute, Prefix and Namespace</h6>
<p>In this example, a full model definition is shown.</p>
<pre><code class="language-json">{
  "Person": {
    "type": "object",
    "properties": {
      "id": {
        "type": "integer",
        "format": "int32",
        "xml": {
          "attribute": true
        }
      },
      "name": {
        "type": "string",
        "xml": {
          "namespace": "http://example.com/schema/sample",
          "prefix": "sample"
        }
      }
    }
  }
}
</code></pre>
<pre><code class="language-yaml">Person:
  type: object
  properties:
    id:
      type: integer
      format: int32
      xml:
        attribute: true
    name:
      type: string
      xml:
        namespace: http://example.com/schema/sample
        prefix: sample
</code></pre>
<pre><code class="language-xml">&lt;Person id="123"&gt;
    &lt;sample:name xmlns:sample="http://example.com/schema/sample"&gt;example&lt;/sample:name&gt;
&lt;/Person&gt;
</code></pre>
<h6>XML Arrays</h6>
<p>Changing the element names:</p>
<pre><code class="language-json">{
  "animals": {
    "type": "array",
    "items": {
      "type": "string",
      "xml": {
        "name": "animal"
      }
    }
  }
}
</code></pre>
<pre><code class="language-yaml">animals:
  type: array
  items:
    type: string
    xml:
      name: animal
</code></pre>
<pre><code class="language-xml">&lt;animal&gt;value&lt;/animal&gt;
&lt;animal&gt;value&lt;/animal&gt;
</code></pre>
<p>The external <code>name</code> property has no effect on the XML:</p>
<pre><code class="language-json">{
  "animals": {
    "type": "array",
    "items": {
      "type": "string",
      "xml": {
        "name": "animal"
      }
    },
    "xml": {
      "name": "aliens"
    }
  }
}
</code></pre>
<pre><code class="language-yaml">animals:
  type: array
  items:
    type: string
    xml:
      name: animal
  xml:
    name: aliens
</code></pre>
<pre><code class="language-xml">&lt;animal&gt;value&lt;/animal&gt;
&lt;animal&gt;value&lt;/animal&gt;
</code></pre>
<p>Even when the array is wrapped, if a name is not explicitly defined, the same name will be used both internally and externally:</p>
<pre><code class="language-json">{
  "animals": {
    "type": "array",
    "items": {
      "type": "string"
    },
    "xml": {
      "wrapped": true
    }
  }
}
</code></pre>
<pre><code class="language-yaml">animals:
  type: array
  items:
    type: string
  xml:
    wrapped: true
</code></pre>
<pre><code class="language-xml">&lt;animals&gt;
  &lt;animals&gt;value&lt;/animals&gt;
  &lt;animals&gt;value&lt;/animals&gt;
&lt;/animals&gt;
</code></pre>
<p>To overcome the naming problem in the example above, the following definition can be used:</p>
<pre><code class="language-json">{
  "animals": {
    "type": "array",
    "items": {
      "type": "string",
      "xml": {
        "name": "animal"
      }
    },
    "xml": {
      "wrapped": true
    }
  }
}
</code></pre>
<pre><code class="language-yaml">animals:
  type: array
  items:
    type: string
    xml:
      name: animal
  xml:
    wrapped: true
</code></pre>
<pre><code class="language-xml">&lt;animals&gt;
  &lt;animal&gt;value&lt;/animal&gt;
  &lt;animal&gt;value&lt;/animal&gt;
&lt;/animals&gt;
</code></pre>
<p>Affecting both internal and external names:</p>
<pre><code class="language-json">{
  "animals": {
    "type": "array",
    "items": {
      "type": "string",
      "xml": {
        "name": "animal"
      }
    },
    "xml": {
      "name": "aliens",
      "wrapped": true
    }
  }
}
</code></pre>
<pre><code class="language-yaml">animals:
  type: array
  items:
    type: string
    xml:
      name: animal
  xml:
    name: aliens
    wrapped: true
</code></pre>
<pre><code class="language-xml">&lt;aliens&gt;
  &lt;animal&gt;value&lt;/animal&gt;
  &lt;animal&gt;value&lt;/animal&gt;
&lt;/aliens&gt;
</code></pre>
<p>If we change the external element but not the internal ones:</p>
<pre><code class="language-json">{
  "animals": {
    "type": "array",
    "items": {
      "type": "string"
    },
    "xml": {
      "name": "aliens",
      "wrapped": true
    }
  }
}
</code></pre>
<pre><code class="language-yaml">animals:
  type: array
  items:
    type: string
  xml:
    name: aliens
    wrapped: true
</code></pre>
<pre><code class="language-xml">&lt;aliens&gt;
  &lt;aliens&gt;value&lt;/aliens&gt;
  &lt;aliens&gt;value&lt;/aliens&gt;
&lt;/aliens&gt;
</code></pre>
<h4><a name="securitySchemeObject"></a>Security Scheme Object</h4>
<p>Defines a security scheme that can be used by the operations.
Supported schemes are HTTP authentication, an API key (either as a header or as a query parameter), OAuth2's common flows (implicit, password, application and access code) as defined in <a href="https://tools.ietf.org/html/rfc6749">RFC6749</a>, and <a href="https://tools.ietf.org/html/draft-ietf-oauth-discovery-06">OpenID Connect Discovery</a>.</p>
<h5>Fixed Fields</h5>
<p>Field Name | Type | Applies To | Description
---|:---:|---|---
<a name="securitySchemeType"></a>type | <code>string</code> | Any | <strong>REQUIRED</strong>. The type of the security scheme. Valid values are <code>"apiKey"</code>, <code>"http"</code>, <code>"oauth2"</code>, <code>"openIdConnect"</code>.
<a name="securitySchemeDescription"></a>description | <code>string</code> | Any | A short description for security scheme. <a href="http://spec.commonmark.org/">CommonMark syntax</a> MAY be used for rich text representation.
<a name="securitySchemeName"></a>name | <code>string</code> | <code>apiKey</code> | <strong>REQUIRED</strong>. The name of the header, query or cookie parameter to be used.
<a name="securitySchemeIn"></a>in | <code>string</code> | <code>apiKey</code> | <strong>REQUIRED</strong>. The location of the API key. Valid values are <code>"query"</code>, <code>"header"</code> or <code>"cookie"</code>.
<a name="securitySchemeScheme"></a>scheme | <code>string</code> | <code>http</code> | <strong>REQUIRED</strong>. The name of the HTTP Authorization scheme to be used in the <a href="https://tools.ietf.org/html/rfc7235#section-5.1">Authorization header as defined in RFC7235</a>.
<a name="securitySchemeBearerFormat"></a>bearerFormat | <code>string</code> | <code>http</code> (<code>"bearer"</code>) | A hint to the client to identify how the bearer token is formatted.  Bearer tokens are usually generated by an authorization server, so this information is primarily for documentation purposes.
<a name="securitySchemeFlows"></a>flows | <a href="#oauthFlowsObject">OAuth Flows Object</a> | <code>oauth2</code> | <strong>REQUIRED</strong>. An object containing configuration information for the flow types supported.
<a name="securitySchemeOpenIdConnectUrl"></a>openIdConnectUrl | <code>string</code> | <code>openIdConnect</code> | <strong>REQUIRED</strong>. OpenId Connect URL to discover OAuth2 configuration values. This MUST be in the form of a URL.</p>
<p>This object MAY be extended with <a href="#specificationExtensions">Specification Extensions</a>.</p>
<h5>Security Scheme Object Example</h5>
<h6>Basic Authentication Sample</h6>
<pre><code class="language-json">{
  "type": "http",
  "scheme": "basic"
}
</code></pre>
<pre><code class="language-yaml">type: http
scheme: basic
</code></pre>
<h6>API Key Sample</h6>
<pre><code class="language-json">{
  "type": "apiKey",
  "name": "api_key",
  "in": "header"
}
</code></pre>
<pre><code class="language-yaml">type: apiKey
name: api_key
in: header
</code></pre>
<h6>JWT Bearer Sample</h6>
<pre><code class="language-json">{
  "type": "http",
  "scheme": "bearer",
  "bearerFormat": "JWT",
}
</code></pre>
<pre><code class="language-yaml">type: http
scheme: bearer
bearerFormat: JWT
</code></pre>
<h6>Implicit OAuth2 Sample</h6>
<pre><code class="language-json">{
  "type": "oauth2",
  "flows": {
    "implicit": {
      "authorizationUrl": "https://example.com/api/oauth/dialog",
      "scopes": {
        "write:pets": "modify pets in your account",
        "read:pets": "read your pets"
      }
    }
  }
}
</code></pre>
<pre><code class="language-yaml">type: oauth2
flows: 
  implicit:
    authorizationUrl: https://example.com/api/oauth/dialog
    scopes:
      write:pets: modify pets in your account
      read:pets: read your pets
</code></pre>
<h4><a name="oauthFlowsObject"></a>OAuth Flows Object</h4>
<p>Allows configuration of the supported OAuth Flows.</p>
<h5>Fixed Fields</h5>
<p>Field Name | Type | Description
---|:---:|---
<a name="oauthFlowsImplicit"></a>implicit | <a href="#oauthFlowObject">OAuth Flow Object</a> | Configuration for the OAuth Implicit flow 
<a name="oauthFlowsPassword"></a>password | <a href="#oauthFlowObject">OAuth Flow Object</a> | Configuration for the OAuth Resource Owner Password flow 
<a name="oauthFlowsClientCredentials"></a>clientCredentials | <a href="#oauthFlowObject">OAuth Flow Object</a> | Configuration for the OAuth Client Credentials flow.  Previously called <code>application</code> in OpenAPI 2.0.
<a name="oauthFlowsAuthorizationCode"></a>authorizationCode | <a href="#oauthFlowObject">OAuth Flow Object</a> | Configuration for the OAuth Authorization Code flow.  Previously called <code>accessCode</code> in OpenAPI 2.0.</p>
<p>This object MAY be extended with <a href="#specificationExtensions">Specification Extensions</a>.</p>
<h4><a name="oauthFlowObject"></a>OAuth Flow Object</h4>
<p>Configuration details for a supported OAuth Flow</p>
<h5>Fixed Fields</h5>
<p>Field Name | Type | Applies To | Description
---|:---:|---|---
<a name="oauthFlowAuthorizationUrl"></a>authorizationUrl | <code>string</code> | <code>oauth2</code> (<code>"implicit"</code>, <code>"authorizationCode"</code>) | <strong>REQUIRED</strong>. The authorization URL to be used for this flow. This MUST be in the form of a URL.
<a name="oauthFlowTokenUrl"></a>tokenUrl | <code>string</code> | <code>oauth2</code> (<code>"password"</code>, <code>"clientCredentials"</code>, <code>"authorizationCode"</code>) | <strong>REQUIRED</strong>. The token URL to be used for this flow. This MUST be in the form of a URL.
<a name="oauthFlowRefreshUrl"></a>refreshUrl | <code>string</code> | <code>oauth2</code> | The URL to be used for obtaining refresh tokens. This MUST be in the form of a URL.
<a name="oauthFlowScopes"></a>scopes | Map[<code>string</code>, <code>string</code>] | <code>oauth2</code> | <strong>REQUIRED</strong>. The available scopes for the OAuth2 security scheme. A map between the scope name and a short description for it.</p>
<p>This object MAY be extended with <a href="#specificationExtensions">Specification Extensions</a>.</p>
<h5>OAuth Flow Object Examples</h5>
<pre><code class="language-JSON">{
  "type": "oauth2",
  "flows": {
    "implicit": {
      "authorizationUrl": "https://example.com/api/oauth/dialog",
      "scopes": {
        "write:pets": "modify pets in your account",
        "read:pets": "read your pets"
      }
    },
    "authorizationCode": {
      "authorizationUrl": "https://example.com/api/oauth/dialog",
      "tokenUrl": "https://example.com/api/oauth/token",
      "scopes": {
        "write:pets": "modify pets in your account",
        "read:pets": "read your pets"
      }
    }
  }
}
</code></pre>
<pre><code class="language-YAML">type: oauth2
flows: 
  implicit:
    authorizationUrl: https://example.com/api/oauth/dialog
    scopes:
      write:pets: modify pets in your account
      read:pets: read your pets
  authorizationCode:
    authorizationUrl: https://example.com/api/oauth/dialog
    tokenUrl: https://example.com/api/oauth/token
    scopes:
      write:pets: modify pets in your account
      read:pets: read your pets 
</code></pre>
<h4><a name="securityRequirementObject"></a>Security Requirement Object</h4>
<p>Lists the required security schemes to execute this operation.
The name used for each property MUST correspond to a security scheme declared in the <a href="#componentsSecuritySchemes">Security Schemes</a> under the <a href="#componentsObject">Components Object</a>.</p>
<p>Security Requirement Objects that contain multiple schemes require that all schemes MUST be satisfied for a request to be authorized.
This enables support for scenarios where multiple query parameters or HTTP headers are required to convey security information.</p>
<p>When a list of Security Requirement Objects is defined on the <a href="#oasObject">Open API object</a> or <a href="#operationObject">Operation Object</a>, only one of Security Requirement Objects in the list needs to be satisfied to authorize the request.</p>
<h5>Patterned Fields</h5>
<p>Field Pattern | Type | Description
---|:---:|---
<a name="securityRequirementsName"></a>{name} | [<code>string</code>] | Each name MUST correspond to a security scheme which is declared in the <a href="#componentsSecuritySchemes">Security Schemes</a> under the <a href="#componentsObject">Components Object</a>. If the security scheme is of type <code>"oauth2"</code> or <code>"openIdConnect"</code>, then the value is a list of scope names required for the execution. For other security scheme types, the array MUST be empty.</p>
<h5>Security Requirement Object Examples</h5>
<h6>Non-OAuth2 Security Requirement</h6>
<pre><code class="language-json">{
  "api_key": []
}
</code></pre>
<pre><code class="language-yaml">api_key: []
</code></pre>
<h6>OAuth2 Security Requirement</h6>
<pre><code class="language-json">{
  "petstore_auth": [
    "write:pets",
    "read:pets"
  ]
}
</code></pre>
<pre><code class="language-yaml">petstore_auth:
- write:pets
- read:pets
</code></pre>
<h3><a name="specificationExtensions"></a>Specification Extensions</h3>
<p>While the OpenAPI Specification tries to accommodate most use cases, additional data can be added to extend the specification at certain points.</p>
<p>The extensions properties are implemented as patterned fields that are always prefixed by <code>"x-"</code>.</p>
<p>Field Pattern | Type | Description
---|:---:|---
<a name="infoExtensions"></a>^x- | Any | Allows extensions to the OpenAPI Schema. The field name MUST begin with <code>x-</code>, for example, <code>x-internal-id</code>. The value can be <code>null</code>, a primitive, an array or an object. Can have any valid JSON format value.</p>
<p>The extensions may or may not be supported by the available tooling, but those may be extended as well to add requested support (if tools are internal or open-sourced).</p>
<h3><a name="securityFiltering"></a>Security Filtering</h3>
<p>Some objects in the OpenAPI Specification MAY be declared and remain empty, or be completely removed, even though they are inherently the core of the API documentation.</p>
<p>The reasoning is to allow an additional layer of access control over the documentation.
While not part of the specification itself, certain libraries MAY choose to allow access to parts of the documentation based on some form of authentication/authorization.</p>
<p>Two examples of this:</p>
<ol>
<li>The <a href="#pathsObject">Paths Object</a> MAY be empty. It may be counterintuitive, but this may tell the viewer that they got to the right place, but can't access any documentation. They'd still have access to the <a href="#infoObject">Info Object</a> which may contain additional information regarding authentication.</li>
<li>The <a href="#pathItemObject">Path Item Object</a> MAY be empty. In this case, the viewer will be aware that the path exists, but will not be able to see any of its operations or parameters. This is different than hiding the path itself from the <a href="#pathsObject">Paths Object</a>, so the user will not be aware of its existence. This allows the documentation provider to finely control what the viewer can see.</li>
</ol>
<h2><a name="revisionHistory"></a>Appendix A: Revision History</h2>
<p>Version   | Date       | Notes
---       | ---        | ---
3.0.1     | 2017-12-06 | Patch release of the OpenAPI Specification 3.0.1
3.0.0     | 2017-07-26 | Release of the OpenAPI Specification 3.0.0
3.0.0-rc2 | 2017-06-16 | rc2 of the 3.0 specification
3.0.0-rc1 | 2017-04-27 | rc1 of the 3.0 specification
3.0.0-rc0 | 2017-02-28 | Implementer's Draft of the 3.0 specification
2.0       | 2015-12-31 | Donation of Swagger 2.0 to the Open API Initiative
2.0       | 2014-09-08 | Release of Swagger 2.0
1.2       | 2014-03-14 | Initial release of the formal document.
1.1       | 2012-08-22 | Release of Swagger 1.1
1.0       | 2011-08-10 | First release of the Swagger Specification</p>
''';
