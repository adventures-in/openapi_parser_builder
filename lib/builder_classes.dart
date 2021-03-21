
/// This is the root document object of the OpenAPI document.
class OpenAPI {
  OpenAPI();

  /// REQUIRED. This string MUST be the semantic version number of the OpenAPI Specification version that the OpenAPI document uses. The openapi field SHOULD be used by tooling specifications and clients to interpret the OpenAPI document. This is not related to the API info.version string.
  String openapi;
  /// REQUIRED. Provides metadata about the API. The metadata MAY be used by tooling as required.
  Info info;
  /// An array of Server Objects, which provide connectivity information to a target server. If the servers property is not provided, or is an empty array, the default value would be a Server Object with a url value of /.
  List<Server> servers;
  /// REQUIRED. The available paths and operations for the API.
  Paths paths;
  /// An element to hold various schemas for the specification.
  Components components;
  /// A declaration of which security mechanisms can be used across the API. The list of values includes alternative security requirement objects that can be used. Only one of the security requirement objects need to be satisfied to authorize a request. Individual operations can override this definition.
  List<SecurityRequirement> security;
  /// A list of tags used by the specification with additional metadata. The order of the tags can be used to reflect on their order by the parsing tools. Not all tags that are used by the Operation Object must be declared. The tags that are not declared MAY be organized randomly or based on the tools' logic. Each tag name in the list MUST be unique.
  List<Tag> tags;
  /// Additional external documentation.
  ExternalDocumentation externalDocs;

}


/// The object provides metadata about the API.
/// The metadata MAY be used by the clients if needed, and MAY be presented in editing or documentation generation tools for convenience.
class Info {
  Info();

  /// REQUIRED. The title of the application.
  String title;
  /// A short description of the application. CommonMark syntax MAY be used for rich text representation.
  String description;
  /// A URL to the Terms of Service for the API. MUST be in the format of a URL.
  String termsOfService;
  /// The contact information for the exposed API.
  Contact contact;
  /// The license information for the exposed API.
  License license;
  /// REQUIRED. The version of the OpenAPI document (which is distinct from the OpenAPI Specification version or the API implementation version).
  String version;

}


/// Contact information for the exposed API.
class Contact {
  Contact();

  /// The identifying name of the contact person/organization.
  String name;
  /// The URL pointing to the contact information. MUST be in the format of a URL.
  String url;
  /// The email address of the contact person/organization. MUST be in the format of an email address.
  String email;

}


/// License information for the exposed API.
class License {
  License();

  /// REQUIRED. The license name used for the API.
  String name;
  /// A URL to the license used for the API. MUST be in the format of a URL.
  String url;

}


/// An object representing a Server.
class Server {
  Server();

  /// REQUIRED. A URL to the target host.  This URL supports Server Variables and MAY be relative, to indicate that the host location is relative to the location where the OpenAPI document is being served. Variable substitutions will be made when a variable is named in {brackets}.
  String url;
  /// An optional string describing the host designated by the URL. CommonMark syntax MAY be used for rich text representation.
  String description;
  /// A map between a variable name and its value.  The value is used for substitution in the server's URL template.
  Map<String, ServerVariable> variables;

}


/// An object representing a Server Variable for server URL template substitution.
class ServerVariable {
  ServerVariable();

  /// An enumeration of string values to be used if the substitution options are from a limited set.
  List<String> enum;
  /// REQUIRED. The default value to use for substitution, and to send, if an alternate value is not supplied. Unlike the Schema Object's default, this value MUST be provided by the consumer.
  String default;
  /// An optional description for the server variable. CommonMark syntax MAY be used for rich text representation.
  String description;

}


/// Holds a set of reusable objects for different aspects of the OAS.
/// All objects defined within the components object will have no effect on the API unless they are explicitly referenced from properties outside the components object.
class Components {
  Components();

  /// An object to hold reusable Schema Objects.
  Map<String, Schema | Reference> schemas;
  /// An object to hold reusable Response Objects.
  Map<String, Response | Reference> responses;
  /// An object to hold reusable Parameter Objects.
  Map<String, Parameter | Reference> parameters;
  /// An object to hold reusable Example Objects.
  Map<String, Example | Reference> examples;
  /// An object to hold reusable Request Body Objects.
  Map<String, RequestBody | Reference> requestBodies;
  /// An object to hold reusable Header Objects.
  Map<String, Header | Reference> headers;
  /// __An object to hold reusable Security Scheme Objects.__ securitySchemes| Map[string, Security Scheme Object \| Reference Object];
  /// An object to hold reusable Link Objects.
  Map<String, Link | Reference> links;
  /// An object to hold reusable Callback Objects.
  Map<String, Callback | Reference> callbacks;

}


/// Holds the relative paths to the individual endpoints and their operations.
/// The path is appended to the URL from the Server Object in order to construct the full URL.  The Paths MAY be empty, due to ACL constraints.
class Paths {
  Paths();

  /// A relative path to an individual endpoint. The field name MUST begin with a slash. The path is appended (no relative URL resolution) to the expanded URL from the Server Object's url field in order to construct the full URL. Path templating is allowed. When matching URLs, concrete (non-templated) paths would be matched before their templated counterparts. Templated paths with the same hierarchy but different templated names MUST NOT exist as they are identical. In case of ambiguous matching, it's up to the tooling to decide which one to use.
  PathItem /{path};

}


/// Describes the operations available on a single path.
/// A Path Item MAY be empty, due to ACL constraints.
/// The path itself is still exposed to the documentation viewer but they will not know which operations and parameters are available.
class PathItem {
  PathItem();

  /// Allows for an external definition of this path item. The referenced structure MUST be in the format of a Path Item Object. If there are conflicts between the referenced definition and this Path Item's definition, the behavior is undefined.
  String $ref;
  /// __An optional, string summary, intended to apply to all operations in this path.__ summary| string;
  /// An optional, string description, intended to apply to all operations in this path. CommonMark syntax MAY be used for rich text representation.
  String description;
  /// A definition of a GET operation on this path.
  Operation get;
  /// A definition of a PUT operation on this path.
  Operation put;
  /// A definition of a POST operation on this path.
  Operation post;
  /// A definition of a DELETE operation on this path.
  Operation delete;
  /// A definition of a OPTIONS operation on this path.
  Operation options;
  /// A definition of a HEAD operation on this path.
  Operation head;
  /// A definition of a PATCH operation on this path.
  Operation patch;
  /// A definition of a TRACE operation on this path.
  Operation trace;
  /// An alternative server array to service all operations in this path.
  List<Server> servers;
  /// A list of parameters that are applicable for all the operations described under this path. These parameters can be overridden at the operation level, but cannot be removed there. The list MUST NOT include duplicated parameters. A unique parameter is defined by a combination of a name and location. The list can use the Reference Object to link to parameters that are defined at the OpenAPI Object's components/parameters.
  List<Parameter | Reference> parameters;

}


/// Describes a single API operation on a path.
class Operation {
  Operation();

  /// A list of tags for API documentation control. Tags can be used for logical grouping of operations by resources or any other qualifier.
  List<String> tags;
  /// A short summary of what the operation does.
  String summary;
  /// A verbose explanation of the operation behavior. CommonMark syntax MAY be used for rich text representation.
  String description;
  /// Additional external documentation for this operation.
  ExternalDocumentation externalDocs;
  /// Unique string used to identify the operation. The id MUST be unique among all operations described in the API. Tools and libraries MAY use the operationId to uniquely identify an operation, therefore, it is RECOMMENDED to follow common programming naming conventions.
  String operationId;
  /// A list of parameters that are applicable for this operation. If a parameter is already defined at the Path Item, the new definition will override it but can never remove it. The list MUST NOT include duplicated parameters. A unique parameter is defined by a combination of a name and location. The list can use the Reference Object to link to parameters that are defined at the OpenAPI Object's components/parameters.
  List<Parameter | Reference> parameters;
  /// The request body applicable for this operation.  The requestBody is only supported in HTTP methods where the HTTP 1.1 specification RFC7231 has explicitly defined semantics for request bodies.  In other cases where the HTTP spec is vague, requestBody SHALL be ignored by consumers.
  RequestBody | Reference requestBody;
  /// REQUIRED. The list of possible responses as they are returned from executing this operation.
  Responses responses;
  /// A map of possible out-of band callbacks related to the parent operation. The key is a unique identifier for the Callback Object. Each value in the map is a Callback Object that describes a request that may be initiated by the API provider and the expected responses. The key value used to identify the callback object is an expression, evaluated at runtime, that identifies a URL to use for the callback operation.
  Map<String, Callback | Reference> callbacks;
  /// Declares this operation to be deprecated. Consumers SHOULD refrain from usage of the declared operation. Default value is false.
  bool deprecated;
  /// A declaration of which security mechanisms can be used for this operation. The list of values includes alternative security requirement objects that can be used. Only one of the security requirement objects need to be satisfied to authorize a request. This definition overrides any declared top-level security. To remove a top-level security declaration, an empty array can be used.
  List<SecurityRequirement> security;
  /// An alternative server array to service this operation. If an alternative server object is specified at the Path Item Object or Root level, it will be overridden by this value.
  List<Server> servers;

}


/// Allows referencing an external resource for extended documentation.
class ExternalDocumentation {
  ExternalDocumentation();

  /// A short description of the target documentation. CommonMark syntax MAY be used for rich text representation.
  String description;
  /// REQUIRED. The URL for the target documentation. Value MUST be in the format of a URL.
  String url;

}


/// Describes a single request body.
class RequestBody {
  RequestBody();

  /// A brief description of the request body. This could contain examples of use.  CommonMark syntax MAY be used for rich text representation.
  String description;
  /// REQUIRED. The content of the request body. The key is a media type or media type range and the value describes it.  For requests that match multiple keys, only the most specific key is applicable. e.g. text/plain overrides text/*
  Map<String, MediaType> content;
  /// Determines if the request body is required in the request. Defaults to false.
  bool required;

}


/// Each Media Type Object provides schema and examples for the media type identified by its key.
class MediaType {
  MediaType();

  /// The schema defining the type used for the request body.
  Schema | Reference schema;
  /// Example of the media type.  The example object SHOULD be in the correct format as specified by the media type.  The example field is mutually exclusive of the examples field.  Furthermore, if referencing a schema which contains an example, the example value SHALL override the example provided by the schema.
  dynamic example;
  /// Examples of the media type.  Each example object SHOULD  match the media type and specified schema if present.  The examples field is mutually exclusive of the example field.  Furthermore, if referencing a schema which contains an example, the examples value SHALL override the example provided by the schema.
  Map<String, Example | Reference> examples;
  /// A map between a property name and its encoding information. The key, being the property name, MUST exist in the schema as a property. The encoding object SHALL only apply to requestBody objects when the media type is multipart or application/x-www-form-urlencoded.
  Map<String, Encoding> encoding;

}


/// A single encoding definition applied to a single schema property.
class Encoding {
  Encoding();

  /// The Content-Type for encoding a specific property. Default value depends on the property type: for string with format being binary – application/octet-stream; for other primitive types – text/plain; for object - application/json; for array – the default is defined based on the inner type. The value can be a specific media type (e.g. application/json), a wildcard media type (e.g. image/*), or a comma-separated list of the two types.
  String contentType;
  /// A map allowing additional information to be provided as headers, for example Content-Disposition.  Content-Type is described separately and SHALL be ignored in this section. This property SHALL be ignored if the request body media type is not a multipart.
  Map<String, Header | Reference> headers;
  /// Describes how a specific property value will be serialized depending on its type.  See Parameter Object for details on the style property. The behavior follows the same values as query parameters, including default values. This property SHALL be ignored if the request body media type is not application/x-www-form-urlencoded.
  String style;
  /// When this is true, property values of type array or object generate separate parameters for each value of the array, or key-value-pair of the map.  For other types of properties this property has no effect. When style is form, the default value is true. For all other styles, the default value is false. This property SHALL be ignored if the request body media type is not application/x-www-form-urlencoded.
  bool explode;
  /// Determines whether the parameter value SHOULD allow reserved characters, as defined by RFC3986 :/?#[]@!$&'()*+,;= to be included without percent-encoding. The default value is false. This property SHALL be ignored if the request body media type is not application/x-www-form-urlencoded.
  bool allowReserved;

}


/// Describes a single response from an API Operation, including design-time, static 
/// links to operations based on the response.
class Response {
  Response();

  /// REQUIRED. A short description of the response. CommonMark syntax MAY be used for rich text representation.
  String description;
  /// Maps a header name to its definition. RFC7230 states header names are case insensitive. If a response header is defined with the name "Content-Type", it SHALL be ignored.
  Map<String, Header | Reference> headers;
  /// A map containing descriptions of potential response payloads. The key is a media type or media type range and the value describes it.  For responses that match multiple keys, only the most specific key is applicable. e.g. text/plain overrides text/*
  Map<String, MediaType> content;
  /// A map of operations links that can be followed from the response. The key of the map is a short name for the link, following the naming constraints of the names for Component Objects.
  Map<String, Link | Reference> links;

}


/// A map of possible out-of band callbacks related to the parent operation.
/// Each value in the map is a Path Item Object that describes a set of requests that may be initiated by the API provider and the expected responses.
/// The key value used to identify the callback object is an expression, evaluated at runtime, that identifies a URL to use for the callback operation.
class Callback {
  Callback();

  /// A Path Item Object used to define a callback request and expected responses.  A complete example is available.
  PathItem {expression};

}


/// Adds metadata to a single tag that is used by the Operation Object.
/// It is not mandatory to have a Tag Object per tag defined in the Operation Object instances.
class Tag {
  Tag();

  /// REQUIRED. The name of the tag.
  String name;
  /// A short description for the tag. CommonMark syntax MAY be used for rich text representation.
  String description;
  /// Additional external documentation for this tag.
  ExternalDocumentation externalDocs;

}


/// Defines a security scheme that can be used by the operations.
/// Supported schemes are HTTP authentication, an API key (either as a header or as a query parameter), OAuth2's common flows (implicit, password, application and access code) as defined in RFC6749, and OpenID Connect Discovery.
class SecurityScheme {
  SecurityScheme();

  /// Any
  String type;
  /// Any
  String description;
  /// apiKey
  String name;
  /// apiKey
  String in;
  /// http
  String scheme;
  /// http ("bearer")
  String bearerFormat;
  /// oauth2
  OAuthFlows flows;
  /// openIdConnect
  String openIdConnectUrl;

}


/// Allows configuration of the supported OAuth Flows.
class OAuthFlows {
  OAuthFlows();

  /// Configuration for the OAuth Implicit flow
  OAuthFlow implicit;
  /// Configuration for the OAuth Resource Owner Password flow
  OAuthFlow password;
  /// Configuration for the OAuth Client Credentials flow.  Previously called application in OpenAPI 2.0.
  OAuthFlow clientCredentials;
  /// Configuration for the OAuth Authorization Code flow.  Previously called accessCode in OpenAPI 2.0.
  OAuthFlow authorizationCode;

}


/// Configuration details for a supported OAuth Flow
class OAuthFlow {
  OAuthFlow();

  /// oauth2 ("implicit", "authorizationCode")
  String authorizationUrl;
  /// oauth2 ("password", "clientCredentials", "authorizationCode")
  String tokenUrl;
  /// oauth2
  String refreshUrl;
  /// oauth2
  Map<String, String> scopes;

}

