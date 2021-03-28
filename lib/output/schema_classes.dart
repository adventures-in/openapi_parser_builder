
/// This is the root document object of the OpenAPI document.
class OpenAPI {
  OpenAPI({required String openapi, required Info info, List<Server>? servers, required Paths paths, Components? components, List<SecurityRequirement>? security, List<Tag>? tags, ExternalDocumentation? externalDocs}) : _openapi = openapi, _info = info, _servers = servers, _paths = paths, _components = components, _security = security, _tags = tags, _externalDocs = externalDocs;

  /// REQUIRED. This string MUST be the semantic version number of the OpenAPI Specification version that the OpenAPI document uses. The openapi field SHOULD be used by tooling specifications and clients to interpret the OpenAPI document. This is not related to the API info.version string.
  final String _openapi;
  /// REQUIRED. Provides metadata about the API. The metadata MAY be used by tooling as required.
  final Info _info;
  /// An array of Server Objects, which provide connectivity information to a target server. If the servers property is not provided, or is an empty array, the default value would be a Server Object with a url value of /.
  final List<Server>? _servers;
  /// REQUIRED. The available paths and operations for the API.
  final Paths _paths;
  /// An element to hold various schemas for the specification.
  final Components? _components;
  /// A declaration of which security mechanisms can be used across the API. The list of values includes alternative security requirement objects that can be used. Only one of the security requirement objects need to be satisfied to authorize a request. Individual operations can override this definition.
  final List<SecurityRequirement>? _security;
  /// A list of tags used by the specification with additional metadata. The order of the tags can be used to reflect on their order by the parsing tools. Not all tags that are used by the Operation Object must be declared. The tags that are not declared MAY be organized randomly or based on the tools' logic. Each tag name in the list MUST be unique.
  final List<Tag>? _tags;
  /// Additional external documentation.
  final ExternalDocumentation? _externalDocs;

  String get openapi => _openapi;
  Info get info => _info;
  List<Server>? get servers => _servers;
  Paths get paths => _paths;
  Components? get components => _components;
  List<SecurityRequirement>? get security => _security;
  List<Tag>? get tags => _tags;
  ExternalDocumentation? get externalDocs => _externalDocs;

  OpenAPI.fromJson(Map<String, dynamic> json) :
    _openapi = json['openapi'],
    _info =  Info.fromJson(json['info']),
    _servers = (json['servers'] == null) ? null : json['servers'].map<Server>((item) => Server.fromJson(item)).toList(),
    _paths =  Paths.fromJson(json['paths']),
    _components = (json['components'] == null) ? null : Components.fromJson(json['components']),
    _security = (json['security'] == null) ? null : json['security'].map<SecurityRequirement>((item) => SecurityRequirement.fromJson(item)).toList(),
    _tags = (json['tags'] == null) ? null : json['tags'].map<Tag>((item) => Tag.fromJson(item)).toList(),
    _externalDocs = (json['externalDocs'] == null) ? null : ExternalDocumentation.fromJson(json['externalDocs']);
}


/// The object provides metadata about the API.
/// The metadata MAY be used by the clients if needed, and MAY be presented in editing or documentation generation tools for convenience.
class Info {
  Info({required String title, String? description, String? termsOfService, Contact? contact, License? license, required String version}) : _title = title, _description = description, _termsOfService = termsOfService, _contact = contact, _license = license, _version = version;

  /// REQUIRED. The title of the application.
  final String _title;
  /// A short description of the application. CommonMark syntax MAY be used for rich text representation.
  final String? _description;
  /// A URL to the Terms of Service for the API. MUST be in the format of a URL.
  final String? _termsOfService;
  /// The contact information for the exposed API.
  final Contact? _contact;
  /// The license information for the exposed API.
  final License? _license;
  /// REQUIRED. The version of the OpenAPI document (which is distinct from the OpenAPI Specification version or the API implementation version).
  final String _version;

  String get title => _title;
  String? get description => _description;
  String? get termsOfService => _termsOfService;
  Contact? get contact => _contact;
  License? get license => _license;
  String get version => _version;

  Info.fromJson(Map<String, dynamic> json) :
    _title = json['title'],
    _description = json['description'],
    _termsOfService = json['termsOfService'],
    _contact = (json['contact'] == null) ? null : Contact.fromJson(json['contact']),
    _license = (json['license'] == null) ? null : License.fromJson(json['license']),
    _version = json['version'];
}


/// Contact information for the exposed API.
class Contact {
  Contact({String? name, String? url, String? email}) : _name = name, _url = url, _email = email;

  /// The identifying name of the contact person/organization.
  final String? _name;
  /// The URL pointing to the contact information. MUST be in the format of a URL.
  final String? _url;
  /// The email address of the contact person/organization. MUST be in the format of an email address.
  final String? _email;

  String? get name => _name;
  String? get url => _url;
  String? get email => _email;

  Contact.fromJson(Map<String, dynamic> json) :
    _name = json['name'],
    _url = json['url'],
    _email = json['email'];
}


/// License information for the exposed API.
class License {
  License({required String name, String? url}) : _name = name, _url = url;

  /// REQUIRED. The license name used for the API.
  final String _name;
  /// A URL to the license used for the API. MUST be in the format of a URL.
  final String? _url;

  String get name => _name;
  String? get url => _url;

  License.fromJson(Map<String, dynamic> json) :
    _name = json['name'],
    _url = json['url'];
}


/// An object representing a Server.
class Server {
  Server({required String url, String? description, Map<String, ServerVariable>? variables}) : _url = url, _description = description, _variables = variables;

  /// REQUIRED. A URL to the target host.  This URL supports Server Variables and MAY be relative, to indicate that the host location is relative to the location where the OpenAPI document is being served. Variable substitutions will be made when a variable is named in {brackets}.
  final String _url;
  /// An optional string describing the host designated by the URL. CommonMark syntax MAY be used for rich text representation.
  final String? _description;
  /// A map between a variable name and its value.  The value is used for substitution in the server's URL template.
  final Map<String, ServerVariable>? _variables;

  String get url => _url;
  String? get description => _description;
  Map<String, ServerVariable>? get variables => _variables;

  Server.fromJson(Map<String, dynamic> json) :
    _url = json['url'],
    _description = json['description'],
    _variables = (json['variables'] == null) ? null : (json['variables'] as Map<String, dynamic>).map<String, ServerVariable>((key, value) => MapEntry(key, ServerVariable.fromJson(value)));
}


/// An object representing a Server Variable for server URL template substitution.
class ServerVariable {
  ServerVariable({List<String>? enums, required String defaultValue, String? description}) : _enums = enums, _defaultValue = defaultValue, _description = description;

  /// An enumeration of string values to be used if the substitution options are from a limited set.
  final List<String>? _enums;
  /// REQUIRED. The default value to use for substitution, and to send, if an alternate value is not supplied. Unlike the Schema Object's default, this value MUST be provided by the consumer.
  final String _defaultValue;
  /// An optional description for the server variable. CommonMark syntax MAY be used for rich text representation.
  final String? _description;

  List<String>? get enums => _enums;
  String get defaultValue => _defaultValue;
  String? get description => _description;

  ServerVariable.fromJson(Map<String, dynamic> json) :
    _enums = (json['enum'] == null) ? null : json['enum'].map<String>((item) => item as String).toList(),
    _defaultValue = json['default'],
    _description = json['description'];
}


/// Holds a set of reusable objects for different aspects of the OAS.
/// All objects defined within the components object will have no effect on the API unless they are explicitly referenced from properties outside the components object.
class Components {
  Components({Map<String, SchemaOrReference>? schemas, Map<String, ResponseOrReference>? responses, Map<String, ParameterOrReference>? parameters, Map<String, ExampleOrReference>? examples, Map<String, RequestBodyOrReference>? requestBodies, Map<String, HeaderOrReference>? headers, Map<String, SecuritySchemeOrReference>? securitySchemes, Map<String, LinkOrReference>? links, Map<String, CallbackOrReference>? callbacks}) : _schemas = schemas, _responses = responses, _parameters = parameters, _examples = examples, _requestBodies = requestBodies, _headers = headers, _securitySchemes = securitySchemes, _links = links, _callbacks = callbacks;

  /// An object to hold reusable Schema Objects.
  final Map<String, SchemaOrReference>? _schemas;
  /// An object to hold reusable Response Objects.
  final Map<String, ResponseOrReference>? _responses;
  /// An object to hold reusable Parameter Objects.
  final Map<String, ParameterOrReference>? _parameters;
  /// An object to hold reusable Example Objects.
  final Map<String, ExampleOrReference>? _examples;
  /// An object to hold reusable Request Body Objects.
  final Map<String, RequestBodyOrReference>? _requestBodies;
  /// An object to hold reusable Header Objects.
  final Map<String, HeaderOrReference>? _headers;
  /// An object to hold reusable Security Scheme Objects.
  final Map<String, SecuritySchemeOrReference>? _securitySchemes;
  /// An object to hold reusable Link Objects.
  final Map<String, LinkOrReference>? _links;
  /// An object to hold reusable Callback Objects.
  final Map<String, CallbackOrReference>? _callbacks;

  Map<String, SchemaOrReference>? get schemas => _schemas;
  Map<String, ResponseOrReference>? get responses => _responses;
  Map<String, ParameterOrReference>? get parameters => _parameters;
  Map<String, ExampleOrReference>? get examples => _examples;
  Map<String, RequestBodyOrReference>? get requestBodies => _requestBodies;
  Map<String, HeaderOrReference>? get headers => _headers;
  Map<String, SecuritySchemeOrReference>? get securitySchemes => _securitySchemes;
  Map<String, LinkOrReference>? get links => _links;
  Map<String, CallbackOrReference>? get callbacks => _callbacks;

  Components.fromJson(Map<String, dynamic> json) :
    _schemas = (json['schemas'] == null) ? null : (json['schemas'] as Map<String, dynamic>).map<String, SchemaOrReference>((key, value) => MapEntry(key, SchemaOrReference.fromJson(value))),
    _responses = (json['responses'] == null) ? null : (json['responses'] as Map<String, dynamic>).map<String, ResponseOrReference>((key, value) => MapEntry(key, ResponseOrReference.fromJson(value))),
    _parameters = (json['parameters'] == null) ? null : (json['parameters'] as Map<String, dynamic>).map<String, ParameterOrReference>((key, value) => MapEntry(key, ParameterOrReference.fromJson(value))),
    _examples = (json['examples'] == null) ? null : (json['examples'] as Map<String, dynamic>).map<String, ExampleOrReference>((key, value) => MapEntry(key, ExampleOrReference.fromJson(value))),
    _requestBodies = (json['requestBodies'] == null) ? null : (json['requestBodies'] as Map<String, dynamic>).map<String, RequestBodyOrReference>((key, value) => MapEntry(key, RequestBodyOrReference.fromJson(value))),
    _headers = (json['headers'] == null) ? null : (json['headers'] as Map<String, dynamic>).map<String, HeaderOrReference>((key, value) => MapEntry(key, HeaderOrReference.fromJson(value))),
    _securitySchemes = (json['securitySchemes'] == null) ? null : (json['securitySchemes'] as Map<String, dynamic>).map<String, SecuritySchemeOrReference>((key, value) => MapEntry(key, SecuritySchemeOrReference.fromJson(value))),
    _links = (json['links'] == null) ? null : (json['links'] as Map<String, dynamic>).map<String, LinkOrReference>((key, value) => MapEntry(key, LinkOrReference.fromJson(value))),
    _callbacks = (json['callbacks'] == null) ? null : (json['callbacks'] as Map<String, dynamic>).map<String, CallbackOrReference>((key, value) => MapEntry(key, CallbackOrReference.fromJson(value)));
}


/// Holds the relative paths to the individual endpoints and their operations.
/// The path is appended to the URL from the Server Object in order to construct the full URL.  The Paths MAY be empty, due to ACL constraints.
class Paths {
  Paths({required Map<String, PathItem> pathMap}) : _pathMap = pathMap;

  /// A relative path to an individual endpoint. The field name MUST begin with a slash. The path is appended (no relative URL resolution) to the expanded URL from the Server Object's url field in order to construct the full URL. Path templating is allowed. When matching URLs, concrete (non-templated) paths would be matched before their templated counterparts. Templated paths with the same hierarchy but different templated names MUST NOT exist as they are identical. In case of ambiguous matching, it's up to the tooling to decide which one to use.
  final Map<String, PathItem> _pathMap;

  Map<String, PathItem> get pathMap => _pathMap;

  Paths.fromJson(Map<String, dynamic> json) :
    _pathMap = json.map<String, PathItem>((key, value) => MapEntry(key, PathItem.fromJson(value)));
}


/// Describes the operations available on a single path.
/// A Path Item MAY be empty, due to ACL constraints.
/// The path itself is still exposed to the documentation viewer but they will not know which operations and parameters are available.
class PathItem {
  PathItem({String? ref, String? summary, String? description, Operation? getValue, Operation? put, Operation? post, Operation? delete, Operation? options, Operation? head, Operation? patch, Operation? trace, List<Server>? servers, List<ParameterOrReference>? parameters}) : _ref = ref, _summary = summary, _description = description, _getValue = getValue, _put = put, _post = post, _delete = delete, _options = options, _head = head, _patch = patch, _trace = trace, _servers = servers, _parameters = parameters;

  /// Allows for an external definition of this path item. The referenced structure MUST be in the format of a Path Item Object. If there are conflicts between the referenced definition and this Path Item's definition, the behavior is undefined.
  final String? _ref;
  /// An optional, string summary, intended to apply to all operations in this path.
  final String? _summary;
  /// An optional, string description, intended to apply to all operations in this path. CommonMark syntax MAY be used for rich text representation.
  final String? _description;
  /// A definition of a GET operation on this path.
  final Operation? _getValue;
  /// A definition of a PUT operation on this path.
  final Operation? _put;
  /// A definition of a POST operation on this path.
  final Operation? _post;
  /// A definition of a DELETE operation on this path.
  final Operation? _delete;
  /// A definition of a OPTIONS operation on this path.
  final Operation? _options;
  /// A definition of a HEAD operation on this path.
  final Operation? _head;
  /// A definition of a PATCH operation on this path.
  final Operation? _patch;
  /// A definition of a TRACE operation on this path.
  final Operation? _trace;
  /// An alternative server array to service all operations in this path.
  final List<Server>? _servers;
  /// A list of parameters that are applicable for all the operations described under this path. These parameters can be overridden at the operation level, but cannot be removed there. The list MUST NOT include duplicated parameters. A unique parameter is defined by a combination of a name and location. The list can use the Reference Object to link to parameters that are defined at the OpenAPI Object's components/parameters.
  final List<ParameterOrReference>? _parameters;

  String? get ref => _ref;
  String? get summary => _summary;
  String? get description => _description;
  Operation? get getValue => _getValue;
  Operation? get put => _put;
  Operation? get post => _post;
  Operation? get delete => _delete;
  Operation? get options => _options;
  Operation? get head => _head;
  Operation? get patch => _patch;
  Operation? get trace => _trace;
  List<Server>? get servers => _servers;
  List<ParameterOrReference>? get parameters => _parameters;

  PathItem.fromJson(Map<String, dynamic> json) :
    _ref = json['\$ref'],
    _summary = json['summary'],
    _description = json['description'],
    _getValue = (json['get'] == null) ? null : Operation.fromJson(json['get']),
    _put = (json['put'] == null) ? null : Operation.fromJson(json['put']),
    _post = (json['post'] == null) ? null : Operation.fromJson(json['post']),
    _delete = (json['delete'] == null) ? null : Operation.fromJson(json['delete']),
    _options = (json['options'] == null) ? null : Operation.fromJson(json['options']),
    _head = (json['head'] == null) ? null : Operation.fromJson(json['head']),
    _patch = (json['patch'] == null) ? null : Operation.fromJson(json['patch']),
    _trace = (json['trace'] == null) ? null : Operation.fromJson(json['trace']),
    _servers = (json['servers'] == null) ? null : json['servers'].map<Server>((item) => Server.fromJson(item)).toList(),
    _parameters = (json['parameters'] == null) ? null : json['parameters'].map<ParameterOrReference>((item) => ParameterOrReference.fromJson(item)).toList();
}


/// Describes a single API operation on a path.
class Operation {
  Operation({List<String>? tags, String? summary, String? description, ExternalDocumentation? externalDocs, String? operationId, List<ParameterOrReference>? parameters, RequestBodyOrReference? requestBody, required Responses responses, Map<String, CallbackOrReference>? callbacks, bool? deprecated, List<SecurityRequirement>? security, List<Server>? servers}) : _tags = tags, _summary = summary, _description = description, _externalDocs = externalDocs, _operationId = operationId, _parameters = parameters, _requestBody = requestBody, _responses = responses, _callbacks = callbacks, _deprecated = deprecated, _security = security, _servers = servers;

  /// A list of tags for API documentation control. Tags can be used for logical grouping of operations by resources or any other qualifier.
  final List<String>? _tags;
  /// A short summary of what the operation does.
  final String? _summary;
  /// A verbose explanation of the operation behavior. CommonMark syntax MAY be used for rich text representation.
  final String? _description;
  /// Additional external documentation for this operation.
  final ExternalDocumentation? _externalDocs;
  /// Unique string used to identify the operation. The id MUST be unique among all operations described in the API. Tools and libraries MAY use the operationId to uniquely identify an operation, therefore, it is RECOMMENDED to follow common programming naming conventions.
  final String? _operationId;
  /// A list of parameters that are applicable for this operation. If a parameter is already defined at the Path Item, the new definition will override it but can never remove it. The list MUST NOT include duplicated parameters. A unique parameter is defined by a combination of a name and location. The list can use the Reference Object to link to parameters that are defined at the OpenAPI Object's components/parameters.
  final List<ParameterOrReference>? _parameters;
  /// The request body applicable for this operation.  The requestBody is only supported in HTTP methods where the HTTP 1.1 specification RFC7231 has explicitly defined semantics for request bodies.  In other cases where the HTTP spec is vague, requestBody SHALL be ignored by consumers.
  final RequestBodyOrReference? _requestBody;
  /// REQUIRED. The list of possible responses as they are returned from executing this operation.
  final Responses _responses;
  /// A map of possible out-of band callbacks related to the parent operation. The key is a unique identifier for the Callback Object. Each value in the map is a Callback Object that describes a request that may be initiated by the API provider and the expected responses. The key value used to identify the callback object is an expression, evaluated at runtime, that identifies a URL to use for the callback operation.
  final Map<String, CallbackOrReference>? _callbacks;
  /// Declares this operation to be deprecated. Consumers SHOULD refrain from usage of the declared operation. Default value is false.
  final bool? _deprecated;
  /// A declaration of which security mechanisms can be used for this operation. The list of values includes alternative security requirement objects that can be used. Only one of the security requirement objects need to be satisfied to authorize a request. This definition overrides any declared top-level security. To remove a top-level security declaration, an empty array can be used.
  final List<SecurityRequirement>? _security;
  /// An alternative server array to service this operation. If an alternative server object is specified at the Path Item Object or Root level, it will be overridden by this value.
  final List<Server>? _servers;

  List<String>? get tags => _tags;
  String? get summary => _summary;
  String? get description => _description;
  ExternalDocumentation? get externalDocs => _externalDocs;
  String? get operationId => _operationId;
  List<ParameterOrReference>? get parameters => _parameters;
  RequestBodyOrReference? get requestBody => _requestBody;
  Responses get responses => _responses;
  Map<String, CallbackOrReference>? get callbacks => _callbacks;
  bool? get deprecated => _deprecated;
  List<SecurityRequirement>? get security => _security;
  List<Server>? get servers => _servers;

  Operation.fromJson(Map<String, dynamic> json) :
    _tags = (json['tags'] == null) ? null : json['tags'].map<String>((item) => item as String).toList(),
    _summary = json['summary'],
    _description = json['description'],
    _externalDocs = (json['externalDocs'] == null) ? null : ExternalDocumentation.fromJson(json['externalDocs']),
    _operationId = json['operationId'],
    _parameters = (json['parameters'] == null) ? null : json['parameters'].map<ParameterOrReference>((item) => ParameterOrReference.fromJson(item)).toList(),
    _requestBody = (json['requestBody'] == null) ? null : RequestBodyOrReference.fromJson(json['requestBody']),
    _responses =  Responses.fromJson(json['responses']),
    _callbacks = (json['callbacks'] == null) ? null : (json['callbacks'] as Map<String, dynamic>).map<String, CallbackOrReference>((key, value) => MapEntry(key, CallbackOrReference.fromJson(value))),
    _deprecated = json['deprecated'],
    _security = (json['security'] == null) ? null : json['security'].map<SecurityRequirement>((item) => SecurityRequirement.fromJson(item)).toList(),
    _servers = (json['servers'] == null) ? null : json['servers'].map<Server>((item) => Server.fromJson(item)).toList();
}


/// Allows referencing an external resource for extended documentation.
class ExternalDocumentation {
  ExternalDocumentation({String? description, required String url}) : _description = description, _url = url;

  /// A short description of the target documentation. CommonMark syntax MAY be used for rich text representation.
  final String? _description;
  /// REQUIRED. The URL for the target documentation. Value MUST be in the format of a URL.
  final String _url;

  String? get description => _description;
  String get url => _url;

  ExternalDocumentation.fromJson(Map<String, dynamic> json) :
    _description = json['description'],
    _url = json['url'];
}


/// Describes a single operation parameter.
/// A unique parameter is defined by a combination of a name and location.
/// Parameter Locations
/// There are four possible parameter locations specified by the in field:
/// 
/// path - Used together with Path Templating, where the parameter value is actually part of the operation's URL. This does not include the host or base path of the API. For example, in /items/{itemId}, the path parameter is itemId.
/// query - Parameters that are appended to the URL. For example, in /items?id=###, the query parameter is id.
/// header - Custom headers that are expected as part of the request. Note that RFC7230 states header names are case insensitive.
/// cookie - Used to pass a specific cookie value to the API.
/// 
class Parameter {
  Parameter({required String name}) : _name = name;

  /// REQUIRED. The name of the parameter. Parameter names are case sensitive.
  final String _name;

  String get name => _name;

  Parameter.fromJson(Map<String, dynamic> json) :
    _name = json['name'];
}


/// Describes a single request body.
class RequestBody {
  RequestBody({String? description, required Map<String, MediaType> content, bool? isRequired}) : _description = description, _content = content, _isRequired = isRequired;

  /// A brief description of the request body. This could contain examples of use.  CommonMark syntax MAY be used for rich text representation.
  final String? _description;
  /// REQUIRED. The content of the request body. The key is a media type or media type range and the value describes it.  For requests that match multiple keys, only the most specific key is applicable. e.g. text/plain overrides text/*
  final Map<String, MediaType> _content;
  /// Determines if the request body is required in the request. Defaults to false.
  final bool? _isRequired;

  String? get description => _description;
  Map<String, MediaType> get content => _content;
  bool? get isRequired => _isRequired;

  RequestBody.fromJson(Map<String, dynamic> json) :
    _description = json['description'],
    _content = (json['content'] as Map<String, dynamic>).map<String, MediaType>((key, value) => MapEntry(key, MediaType.fromJson(value))),
    _isRequired = json['required'];
}


/// Each Media Type Object provides schema and examples for the media type identified by its key.
class MediaType {
  MediaType({SchemaOrReference? schema, Any? example, Map<String, ExampleOrReference>? examples, Map<String, Encoding>? encoding}) : _schema = schema, _example = example, _examples = examples, _encoding = encoding;

  /// The schema defining the type used for the request body.
  final SchemaOrReference? _schema;
  /// Example of the media type.  The example object SHOULD be in the correct format as specified by the media type.  The example field is mutually exclusive of the examples field.  Furthermore, if referencing a schema which contains an example, the example value SHALL override the example provided by the schema.
  final Any? _example;
  /// Examples of the media type.  Each example object SHOULD  match the media type and specified schema if present.  The examples field is mutually exclusive of the example field.  Furthermore, if referencing a schema which contains an example, the examples value SHALL override the example provided by the schema.
  final Map<String, ExampleOrReference>? _examples;
  /// A map between a property name and its encoding information. The key, being the property name, MUST exist in the schema as a property. The encoding object SHALL only apply to requestBody objects when the media type is multipart or application/x-www-form-urlencoded.
  final Map<String, Encoding>? _encoding;

  SchemaOrReference? get schema => _schema;
  Any? get example => _example;
  Map<String, ExampleOrReference>? get examples => _examples;
  Map<String, Encoding>? get encoding => _encoding;

  MediaType.fromJson(Map<String, dynamic> json) :
    _schema = (json['schema'] == null) ? null : SchemaOrReference.fromJson(json['schema']),
    _example = json['example'],
    _examples = (json['examples'] == null) ? null : (json['examples'] as Map<String, dynamic>).map<String, ExampleOrReference>((key, value) => MapEntry(key, ExampleOrReference.fromJson(value))),
    _encoding = (json['encoding'] == null) ? null : (json['encoding'] as Map<String, dynamic>).map<String, Encoding>((key, value) => MapEntry(key, Encoding.fromJson(value)));
}


/// A single encoding definition applied to a single schema property.
class Encoding {
  Encoding({String? contentType, Map<String, HeaderOrReference>? headers, String? style, bool? explode, bool? allowReserved}) : _contentType = contentType, _headers = headers, _style = style, _explode = explode, _allowReserved = allowReserved;

  /// The Content-Type for encoding a specific property. Default value depends on the property type: for string with format being binary – application/octet-stream; for other primitive types – text/plain; for object - application/json; for array – the default is defined based on the inner type. The value can be a specific media type (e.g. application/json), a wildcard media type (e.g. image/*), or a comma-separated list of the two types.
  final String? _contentType;
  /// A map allowing additional information to be provided as headers, for example Content-Disposition.  Content-Type is described separately and SHALL be ignored in this section. This property SHALL be ignored if the request body media type is not a multipart.
  final Map<String, HeaderOrReference>? _headers;
  /// Describes how a specific property value will be serialized depending on its type.  See Parameter Object for details on the style property. The behavior follows the same values as query parameters, including default values. This property SHALL be ignored if the request body media type is not application/x-www-form-urlencoded.
  final String? _style;
  /// When this is true, property values of type array or object generate separate parameters for each value of the array, or key-value-pair of the map.  For other types of properties this property has no effect. When style is form, the default value is true. For all other styles, the default value is false. This property SHALL be ignored if the request body media type is not application/x-www-form-urlencoded.
  final bool? _explode;
  /// Determines whether the parameter value SHOULD allow reserved characters, as defined by RFC3986 :/?#[]@!$&'()*+,;= to be included without percent-encoding. The default value is false. This property SHALL be ignored if the request body media type is not application/x-www-form-urlencoded.
  final bool? _allowReserved;

  String? get contentType => _contentType;
  Map<String, HeaderOrReference>? get headers => _headers;
  String? get style => _style;
  bool? get explode => _explode;
  bool? get allowReserved => _allowReserved;

  Encoding.fromJson(Map<String, dynamic> json) :
    _contentType = json['contentType'],
    _headers = (json['headers'] == null) ? null : (json['headers'] as Map<String, dynamic>).map<String, HeaderOrReference>((key, value) => MapEntry(key, HeaderOrReference.fromJson(value))),
    _style = json['style'],
    _explode = json['explode'],
    _allowReserved = json['allowReserved'];
}


/// A container for the expected responses of an operation.
/// The container maps a HTTP response code to the expected response.
/// The documentation is not necessarily expected to cover all possible HTTP response codes because they may not be known in advance.
/// However, documentation is expected to cover a successful operation response and any known errors.
/// The default MAY be used as a default response object for all HTTP codes 
/// that are not covered individually by the specification.
/// The Responses Object MUST contain at least one response code, and it 
/// SHOULD be the response for a successful operation call.
class Responses {
  Responses({ResponseOrReference? defaultValue}) : _defaultValue = defaultValue;

  /// The documentation of responses other than the ones declared for specific HTTP response codes. Use this field to cover undeclared responses. A Reference Object can link to a response that the OpenAPI Object's components/responses section defines.
  final ResponseOrReference? _defaultValue;

  ResponseOrReference? get defaultValue => _defaultValue;

  Responses.fromJson(Map<String, dynamic> json) :
    _defaultValue = (json['default'] == null) ? null : ResponseOrReference.fromJson(json['default']);
}


/// Describes a single response from an API Operation, including design-time, static 
/// links to operations based on the response.
class Response {
  Response({required String description, Map<String, HeaderOrReference>? headers, Map<String, MediaType>? content, Map<String, LinkOrReference>? links}) : _description = description, _headers = headers, _content = content, _links = links;

  /// REQUIRED. A short description of the response. CommonMark syntax MAY be used for rich text representation.
  final String _description;
  /// Maps a header name to its definition. RFC7230 states header names are case insensitive. If a response header is defined with the name "Content-Type", it SHALL be ignored.
  final Map<String, HeaderOrReference>? _headers;
  /// A map containing descriptions of potential response payloads. The key is a media type or media type range and the value describes it.  For responses that match multiple keys, only the most specific key is applicable. e.g. text/plain overrides text/*
  final Map<String, MediaType>? _content;
  /// A map of operations links that can be followed from the response. The key of the map is a short name for the link, following the naming constraints of the names for Component Objects.
  final Map<String, LinkOrReference>? _links;

  String get description => _description;
  Map<String, HeaderOrReference>? get headers => _headers;
  Map<String, MediaType>? get content => _content;
  Map<String, LinkOrReference>? get links => _links;

  Response.fromJson(Map<String, dynamic> json) :
    _description = json['description'],
    _headers = (json['headers'] == null) ? null : (json['headers'] as Map<String, dynamic>).map<String, HeaderOrReference>((key, value) => MapEntry(key, HeaderOrReference.fromJson(value))),
    _content = (json['content'] == null) ? null : (json['content'] as Map<String, dynamic>).map<String, MediaType>((key, value) => MapEntry(key, MediaType.fromJson(value))),
    _links = (json['links'] == null) ? null : (json['links'] as Map<String, dynamic>).map<String, LinkOrReference>((key, value) => MapEntry(key, LinkOrReference.fromJson(value)));
}


/// A map of possible out-of band callbacks related to the parent operation.
/// Each value in the map is a Path Item Object that describes a set of requests that may be initiated by the API provider and the expected responses.
/// The key value used to identify the callback object is an expression, evaluated at runtime, that identifies a URL to use for the callback operation.
class Callback {
  Callback({required Map<String, PathItem> expressionMap}) : _expressionMap = expressionMap;

  /// A Path Item Object used to define a callback request and expected responses.  A complete example is available.
  final Map<String, PathItem> _expressionMap;

  Map<String, PathItem> get expressionMap => _expressionMap;

  Callback.fromJson(Map<String, dynamic> json) :
    _expressionMap = json.map<String, PathItem>((key, value) => MapEntry(key, PathItem.fromJson(value)));
}


/// 
class Example {
  Example({String? summary, String? description, Any? value, String? externalValue}) : _summary = summary, _description = description, _value = value, _externalValue = externalValue;

  /// Short description for the example.
  final String? _summary;
  /// Long description for the example. CommonMark syntax MAY be used for rich text representation.
  final String? _description;
  /// Embedded literal example. The value field and externalValue field are mutually exclusive. To represent examples of media types that cannot naturally represented in JSON or YAML, use a string value to contain the example, escaping where necessary.
  final Any? _value;
  /// A URL that points to the literal example. This provides the capability to reference examples that cannot easily be included in JSON or YAML documents.  The value field and externalValue field are mutually exclusive.
  final String? _externalValue;

  String? get summary => _summary;
  String? get description => _description;
  Any? get value => _value;
  String? get externalValue => _externalValue;

  Example.fromJson(Map<String, dynamic> json) :
    _summary = json['summary'],
    _description = json['description'],
    _value = json['value'],
    _externalValue = json['externalValue'];
}


/// The Link object represents a possible design-time link for a response.
/// The presence of a link does not guarantee the caller's ability to successfully invoke it, rather it provides a known relationship and traversal mechanism between responses and other operations.
/// Unlike dynamic links (i.e. links provided in the response payload), the OAS linking mechanism does not require link information in the runtime response.
/// For computing links, and providing instructions to execute them, a runtime expression is used for accessing values in an operation and using them as parameters while invoking the linked operation.
class Link {
  Link({String? operationRef, String? operationId, Map<String, AnyOrRuntimeExpression>? parameters, AnyOrRuntimeExpression? requestBody, String? description, Server? server}) : _operationRef = operationRef, _operationId = operationId, _parameters = parameters, _requestBody = requestBody, _description = description, _server = server;

  /// A relative or absolute reference to an OAS operation. This field is mutually exclusive of the operationId field, and MUST point to an Operation Object. Relative operationRef values MAY be used to locate an existing Operation Object in the OpenAPI definition.
  final String? _operationRef;
  /// The name of an existing, resolvable OAS operation, as defined with a unique operationId.  This field is mutually exclusive of the operationRef field.
  final String? _operationId;
  /// A map representing parameters to pass to an operation as specified with operationId or identified via operationRef. The key is the parameter name to be used, whereas the value can be a constant or an expression to be evaluated and passed to the linked operation.  The parameter name can be qualified using the parameter location [{in}.]{name} for operations that use the same parameter name in different locations (e.g. path.id).
  final Map<String, AnyOrRuntimeExpression>? _parameters;
  /// A literal value or {expression} to use as a request body when calling the target operation.
  final AnyOrRuntimeExpression? _requestBody;
  /// A description of the link. CommonMark syntax MAY be used for rich text representation.
  final String? _description;
  /// A server object to be used by the target operation.
  final Server? _server;

  String? get operationRef => _operationRef;
  String? get operationId => _operationId;
  Map<String, AnyOrRuntimeExpression>? get parameters => _parameters;
  AnyOrRuntimeExpression? get requestBody => _requestBody;
  String? get description => _description;
  Server? get server => _server;

  Link.fromJson(Map<String, dynamic> json) :
    _operationRef = json['operationRef'],
    _operationId = json['operationId'],
    _parameters = (json['parameters'] == null) ? null : (json['parameters'] as Map<String, dynamic>).map<String, AnyOrRuntimeExpression>((key, value) => MapEntry(key, AnyOrRuntimeExpression.fromJson(value))),
    _requestBody = (json['requestBody'] == null) ? null : AnyOrRuntimeExpression.fromJson(json['requestBody']),
    _description = json['description'],
    _server = (json['server'] == null) ? null : Server.fromJson(json['server']);
}


/// The Header Object follows the structure of the Parameter Object with the following changes:
/// 
/// name MUST NOT be specified, it is given in the corresponding headers map.
/// in MUST NOT be specified, it is implicitly in header.
/// All traits that are affected by the location MUST be applicable to a location of header (for example, style).
/// 
/// Header Object Example
/// A simple header of type integer:
/// {
///   "description": "The number of allowed requests in the current period",
///   "schema": {
///     "type": "integer"
///   }
/// }
/// 
/// description: The number of allowed requests in the current period
/// schema:
///   type: integer
/// 
/// Tag Object
/// Adds metadata to a single tag that is used by the Operation Object.
/// It is not mandatory to have a Tag Object per tag defined in the Operation Object instances.
class Header {
  Header({required String name, String? description, ExternalDocumentation? externalDocs}) : _name = name, _description = description, _externalDocs = externalDocs;

  /// REQUIRED. The name of the tag.
  final String _name;
  /// A short description for the tag. CommonMark syntax MAY be used for rich text representation.
  final String? _description;
  /// Additional external documentation for this tag.
  final ExternalDocumentation? _externalDocs;

  String get name => _name;
  String? get description => _description;
  ExternalDocumentation? get externalDocs => _externalDocs;

  Header.fromJson(Map<String, dynamic> json) :
    _name = json['name'],
    _description = json['description'],
    _externalDocs = (json['externalDocs'] == null) ? null : ExternalDocumentation.fromJson(json['externalDocs']);
}


/// Adds metadata to a single tag that is used by the Operation Object.
/// It is not mandatory to have a Tag Object per tag defined in the Operation Object instances.
class Tag {
  Tag({required String name, String? description, ExternalDocumentation? externalDocs}) : _name = name, _description = description, _externalDocs = externalDocs;

  /// REQUIRED. The name of the tag.
  final String _name;
  /// A short description for the tag. CommonMark syntax MAY be used for rich text representation.
  final String? _description;
  /// Additional external documentation for this tag.
  final ExternalDocumentation? _externalDocs;

  String get name => _name;
  String? get description => _description;
  ExternalDocumentation? get externalDocs => _externalDocs;

  Tag.fromJson(Map<String, dynamic> json) :
    _name = json['name'],
    _description = json['description'],
    _externalDocs = (json['externalDocs'] == null) ? null : ExternalDocumentation.fromJson(json['externalDocs']);
}


/// A simple object to allow referencing other components in the specification, internally and externally.
/// The Reference Object is defined by JSON Reference and follows the same structure, behavior and rules.
/// For this specification, reference resolution is accomplished as defined by the JSON Reference specification and not by the JSON Schema specification.
class Reference {
  Reference({required String ref}) : _ref = ref;

  /// REQUIRED. The reference string.
  final String _ref;

  String get ref => _ref;

  Reference.fromJson(Map<String, dynamic> json) :
    _ref = json['\$ref'];
}


/// The Schema Object allows the definition of input and output data types.
/// These types can be objects, but also primitives and arrays.
/// This object is an extended subset of the JSON Schema Specification Wright Draft 00.
/// For more information about the properties, see JSON Schema Core and JSON Schema Validation.
/// Unless stated otherwise, the property definitions follow the JSON Schema.
/// Properties
/// The following properties are taken directly from the JSON Schema definition and follow the same specifications:
/// 
/// title
/// multipleOf
/// maximum
/// exclusiveMaximum
/// minimum
/// exclusiveMinimum
/// maxLength
/// minLength
/// pattern (This string SHOULD be a valid regular expression, according to the ECMA 262 regular expression dialect)
/// maxItems
/// minItems
/// uniqueItems
/// maxProperties
/// minProperties
/// required
/// enum
/// 
/// The following properties are taken from the JSON Schema definition but their definitions were adjusted to the OpenAPI Specification.
/// 
/// type - Value MUST be a string. Multiple types via an array are not supported.
/// allOf - Inline or referenced schema MUST be of a Schema Object and not a standard JSON Schema.
/// oneOf - Inline or referenced schema MUST be of a Schema Object and not a standard JSON Schema.
/// anyOf - Inline or referenced schema MUST be of a Schema Object and not a standard JSON Schema.
/// not - Inline or referenced schema MUST be of a Schema Object and not a standard JSON Schema.
/// items - Value MUST be an object and not an array. Inline or referenced schema MUST be of a Schema Object and not a standard JSON Schema. items MUST be present if the type is array.
/// properties - Property definitions MUST be a Schema Object and not a standard JSON Schema (inline or referenced).
/// additionalProperties - Value can be boolean or object. Inline or referenced schema MUST be of a Schema Object and not a standard JSON Schema.
/// description - CommonMark syntax MAY be used for rich text representation.
/// format - See Data Type Formats for further details. While relying on JSON Schema's defined formats, the OAS offers a few additional predefined formats.
/// default - The default value represents what would be assumed by the consumer of the input as the value of the schema if one is not provided. Unlike JSON Schema, the value MUST conform to the defined type for the Schema Object defined at the same level. For example, if type is string, then default can be "foo" but cannot be 1.
/// 
/// Alternatively, any time a Schema Object can be used, a Reference Object can be used in its place. This allows referencing definitions instead of defining them inline.
/// Additional properties defined by the JSON Schema specification that are not mentioned here are strictly unsupported.
/// Other than the JSON Schema subset fields, the following fields MAY be used for further schema documentation:
class Schema {
  Schema({bool? nullable, Discriminator? discriminator, bool? readOnly, bool? writeOnly, XML? xml, ExternalDocumentation? externalDocs, Any? example, bool? deprecated}) : _nullable = nullable, _discriminator = discriminator, _readOnly = readOnly, _writeOnly = writeOnly, _xml = xml, _externalDocs = externalDocs, _example = example, _deprecated = deprecated;

  /// Allows sending a null value for the defined schema. Default value is false.
  final bool? _nullable;
  /// Adds support for polymorphism. The discriminator is an object name that is used to differentiate between other schemas which may satisfy the payload description. See Composition and Inheritance for more details.
  final Discriminator? _discriminator;
  /// Relevant only for Schema "properties" definitions. Declares the property as "read only". This means that it MAY be sent as part of a response but SHOULD NOT be sent as part of the request. If the property is marked as readOnly being true and is in the required list, the required will take effect on the response only. A property MUST NOT be marked as both readOnly and writeOnly being true. Default value is false.
  final bool? _readOnly;
  /// Relevant only for Schema "properties" definitions. Declares the property as "write only". Therefore, it MAY be sent as part of a request but SHOULD NOT be sent as part of the response. If the property is marked as writeOnly being true and is in the required list, the required will take effect on the request only. A property MUST NOT be marked as both readOnly and writeOnly being true. Default value is false.
  final bool? _writeOnly;
  /// This MAY be used only on properties schemas. It has no effect on root schemas. Adds additional metadata to describe the XML representation of this property.
  final XML? _xml;
  /// Additional external documentation for this schema.
  final ExternalDocumentation? _externalDocs;
  /// A free-form property to include an example of an instance for this schema. To represent examples that cannot be naturally represented in JSON or YAML, a string value can be used to contain the example with escaping where necessary.
  final Any? _example;
  /// Specifies that a schema is deprecated and SHOULD be transitioned out of usage. Default value is false.
  final bool? _deprecated;

  bool? get nullable => _nullable;
  Discriminator? get discriminator => _discriminator;
  bool? get readOnly => _readOnly;
  bool? get writeOnly => _writeOnly;
  XML? get xml => _xml;
  ExternalDocumentation? get externalDocs => _externalDocs;
  Any? get example => _example;
  bool? get deprecated => _deprecated;

  Schema.fromJson(Map<String, dynamic> json) :
    _nullable = json['nullable'],
    _discriminator = (json['discriminator'] == null) ? null : Discriminator.fromJson(json['discriminator']),
    _readOnly = json['readOnly'],
    _writeOnly = json['writeOnly'],
    _xml = (json['xml'] == null) ? null : XML.fromJson(json['xml']),
    _externalDocs = (json['externalDocs'] == null) ? null : ExternalDocumentation.fromJson(json['externalDocs']),
    _example = json['example'],
    _deprecated = json['deprecated'];
}


/// When request bodies or response payloads may be one of a number of different schemas, a discriminator object can be used to aid in serialization, deserialization, and validation.  The discriminator is a specific object in a schema which is used to inform the consumer of the specification of an alternative schema based on the value associated with it.
/// When using the discriminator, inline schemas will not be considered.
class Discriminator {
  Discriminator({required String propertyName, Map<String, String>? mapping}) : _propertyName = propertyName, _mapping = mapping;

  /// REQUIRED. The name of the property in the payload that will hold the discriminator value.
  final String _propertyName;
  /// An object to hold mappings between payload values and schema names or references.
  final Map<String, String>? _mapping;

  String get propertyName => _propertyName;
  Map<String, String>? get mapping => _mapping;

  Discriminator.fromJson(Map<String, dynamic> json) :
    _propertyName = json['propertyName'],
    _mapping = (json['mapping'] == null) ? null : (json['mapping'] as Map<String, dynamic>).map<String, String>((key, value) => MapEntry(key, value as String));
}


/// A metadata object that allows for more fine-tuned XML model definitions.
/// When using arrays, XML element names are not inferred (for singular/plural forms) and the name property SHOULD be used to add that information.
/// See examples for expected behavior.
class XML {
  XML({String? name, String? namespace, String? prefix, bool? attribute, bool? wrapped}) : _name = name, _namespace = namespace, _prefix = prefix, _attribute = attribute, _wrapped = wrapped;

  /// Replaces the name of the element/attribute used for the described schema property. When defined within items, it will affect the name of the individual XML elements within the list. When defined alongside type being array (outside the items), it will affect the wrapping element and only if wrapped is true. If wrapped is false, it will be ignored.
  final String? _name;
  /// The URI of the namespace definition. Value MUST be in the form of an absolute URI.
  final String? _namespace;
  /// The prefix to be used for the name.
  final String? _prefix;
  /// Declares whether the property definition translates to an attribute instead of an element. Default value is false.
  final bool? _attribute;
  /// MAY be used only for an array definition. Signifies whether the array is wrapped (for example, <books><book/><book/></books>) or unwrapped (<book/><book/>). Default value is false. The definition takes effect only when defined alongside type being array (outside the items).
  final bool? _wrapped;

  String? get name => _name;
  String? get namespace => _namespace;
  String? get prefix => _prefix;
  bool? get attribute => _attribute;
  bool? get wrapped => _wrapped;

  XML.fromJson(Map<String, dynamic> json) :
    _name = json['name'],
    _namespace = json['namespace'],
    _prefix = json['prefix'],
    _attribute = json['attribute'],
    _wrapped = json['wrapped'];
}


/// Defines a security scheme that can be used by the operations.
/// Supported schemes are HTTP authentication, an API key (either as a header or as a query parameter), OAuth2's common flows (implicit, password, application and access code) as defined in RFC6749, and OpenID Connect Discovery.
class SecurityScheme {
  SecurityScheme({String? type, String? description, String? name, String? inValue, String? scheme, String? bearerFormat, OAuthFlows? flows, String? openIdConnectUrl}) : _type = type, _description = description, _name = name, _inValue = inValue, _scheme = scheme, _bearerFormat = bearerFormat, _flows = flows, _openIdConnectUrl = openIdConnectUrl;

  /// Any
  final String? _type;
  /// Any
  final String? _description;
  /// apiKey
  final String? _name;
  /// apiKey
  final String? _inValue;
  /// http
  final String? _scheme;
  /// http ("bearer")
  final String? _bearerFormat;
  /// oauth2
  final OAuthFlows? _flows;
  /// openIdConnect
  final String? _openIdConnectUrl;

  String? get type => _type;
  String? get description => _description;
  String? get name => _name;
  String? get inValue => _inValue;
  String? get scheme => _scheme;
  String? get bearerFormat => _bearerFormat;
  OAuthFlows? get flows => _flows;
  String? get openIdConnectUrl => _openIdConnectUrl;

  SecurityScheme.fromJson(Map<String, dynamic> json) :
    _type = json['type'],
    _description = json['description'],
    _name = json['name'],
    _inValue = json['in'],
    _scheme = json['scheme'],
    _bearerFormat = json['bearerFormat'],
    _flows = (json['flows'] == null) ? null : OAuthFlows.fromJson(json['flows']),
    _openIdConnectUrl = json['openIdConnectUrl'];
}


/// Allows configuration of the supported OAuth Flows.
class OAuthFlows {
  OAuthFlows({OAuthFlow? implicit, OAuthFlow? password, OAuthFlow? clientCredentials, OAuthFlow? authorizationCode}) : _implicit = implicit, _password = password, _clientCredentials = clientCredentials, _authorizationCode = authorizationCode;

  /// Configuration for the OAuth Implicit flow
  final OAuthFlow? _implicit;
  /// Configuration for the OAuth Resource Owner Password flow
  final OAuthFlow? _password;
  /// Configuration for the OAuth Client Credentials flow.  Previously called application in OpenAPI 2.0.
  final OAuthFlow? _clientCredentials;
  /// Configuration for the OAuth Authorization Code flow.  Previously called accessCode in OpenAPI 2.0.
  final OAuthFlow? _authorizationCode;

  OAuthFlow? get implicit => _implicit;
  OAuthFlow? get password => _password;
  OAuthFlow? get clientCredentials => _clientCredentials;
  OAuthFlow? get authorizationCode => _authorizationCode;

  OAuthFlows.fromJson(Map<String, dynamic> json) :
    _implicit = (json['implicit'] == null) ? null : OAuthFlow.fromJson(json['implicit']),
    _password = (json['password'] == null) ? null : OAuthFlow.fromJson(json['password']),
    _clientCredentials = (json['clientCredentials'] == null) ? null : OAuthFlow.fromJson(json['clientCredentials']),
    _authorizationCode = (json['authorizationCode'] == null) ? null : OAuthFlow.fromJson(json['authorizationCode']);
}


/// Configuration details for a supported OAuth Flow
class OAuthFlow {
  OAuthFlow({String? authorizationUrl, String? tokenUrl, String? refreshUrl, Map<String, String>? scopes}) : _authorizationUrl = authorizationUrl, _tokenUrl = tokenUrl, _refreshUrl = refreshUrl, _scopes = scopes;

  /// oauth2 ("implicit", "authorizationCode")
  final String? _authorizationUrl;
  /// oauth2 ("password", "clientCredentials", "authorizationCode")
  final String? _tokenUrl;
  /// oauth2
  final String? _refreshUrl;
  /// oauth2
  final Map<String, String>? _scopes;

  String? get authorizationUrl => _authorizationUrl;
  String? get tokenUrl => _tokenUrl;
  String? get refreshUrl => _refreshUrl;
  Map<String, String>? get scopes => _scopes;

  OAuthFlow.fromJson(Map<String, dynamic> json) :
    _authorizationUrl = json['authorizationUrl'],
    _tokenUrl = json['tokenUrl'],
    _refreshUrl = json['refreshUrl'],
    _scopes = (json['scopes'] == null) ? null : (json['scopes'] as Map<String, dynamic>).map<String, String>((key, value) => MapEntry(key, value as String));
}


/// Lists the required security schemes to execute this operation.
/// The name used for each property MUST correspond to a security scheme declared in the Security Schemes under the Components Object.
/// Security Requirement Objects that contain multiple schemes require that all schemes MUST be satisfied for a request to be authorized.
/// This enables support for scenarios where multiple query parameters or HTTP headers are required to convey security information.
/// When a list of Security Requirement Objects is defined on the Open API object or Operation Object, only one of Security Requirement Objects in the list needs to be satisfied to authorize the request.
class SecurityRequirement {
  SecurityRequirement({required Map<String, List<String>> nameMap}) : _nameMap = nameMap;

  /// Each name MUST correspond to a security scheme which is declared in the Security Schemes under the Components Object. If the security scheme is of type "oauth2" or "openIdConnect", then the value is a list of scope names required for the execution. For other security scheme types, the array MUST be empty.
  final Map<String, List<String>> _nameMap;

  Map<String, List<String>> get nameMap => _nameMap;

  SecurityRequirement.fromJson(Map<String, dynamic> json) :
    _nameMap = json.map<String, List<String>>((key, value) => MapEntry(key, (value as List<dynamic>).map<String>((item) => item as String).toList()));
}

 
class RuntimeExpression {
  RuntimeExpression(this.expression);

  String expression;

  RuntimeExpression.fromJson(Map<String, dynamic> json) : expression = json as String;
}

class Any {
  dynamic value;

  Any.fromJson(Map<String, dynamic> json) : value = json;
}

///
class SchemaOrReference {
  SchemaOrReference(this.schema, this.reference);

  Schema? schema;
  Reference? reference;

  SchemaOrReference.fromJson(Map<String, dynamic> json) :
    schema = (json['\$ref'] == null) ? Schema.fromJson(json) : null,
    reference = (json['\$ref'] == null) ? null : Reference(ref: json['\$ref']);
}

///
class ResponseOrReference {
  ResponseOrReference(this.response, this.reference);

  Response? response;
  Reference? reference;

  ResponseOrReference.fromJson(Map<String, dynamic> json) :
    response = (json['\$ref'] == null) ? Response.fromJson(json) : null,
    reference = (json['\$ref'] == null) ? null : Reference(ref: json['\$ref']);
}

///
class ParameterOrReference {
  ParameterOrReference(this.parameter, this.reference);

  Parameter? parameter;
  Reference? reference;

  ParameterOrReference.fromJson(Map<String, dynamic> json) :
    parameter = (json['\$ref'] == null) ? Parameter.fromJson(json) : null,
    reference = (json['\$ref'] == null) ? null : Reference(ref: json['\$ref']);
}

///
class ExampleOrReference {
  ExampleOrReference(this.example, this.reference);

  Example? example;
  Reference? reference;

  ExampleOrReference.fromJson(Map<String, dynamic> json) :
    example = (json['\$ref'] == null) ? Example.fromJson(json) : null,
    reference = (json['\$ref'] == null) ? null : Reference(ref: json['\$ref']);
}

///
class RequestBodyOrReference {
  RequestBodyOrReference(this.requestBody, this.reference);

  RequestBody? requestBody;
  Reference? reference;

  RequestBodyOrReference.fromJson(Map<String, dynamic> json) :
    requestBody = (json['\$ref'] == null) ? RequestBody.fromJson(json) : null,
    reference = (json['\$ref'] == null) ? null : Reference(ref: json['\$ref']);
}

///
class HeaderOrReference {
  HeaderOrReference(this.header, this.reference);

  Header? header;
  Reference? reference;

  HeaderOrReference.fromJson(Map<String, dynamic> json) :
    header = (json['\$ref'] == null) ? Header.fromJson(json) : null,
    reference = (json['\$ref'] == null) ? null : Reference(ref: json['\$ref']);
}

///
class SecuritySchemeOrReference {
  SecuritySchemeOrReference(this.securityScheme, this.reference);

  SecurityScheme? securityScheme;
  Reference? reference;

  SecuritySchemeOrReference.fromJson(Map<String, dynamic> json) :
    securityScheme = (json['\$ref'] == null) ? SecurityScheme.fromJson(json) : null,
    reference = (json['\$ref'] == null) ? null : Reference(ref: json['\$ref']);
}

///
class LinkOrReference {
  LinkOrReference(this.link, this.reference);

  Link? link;
  Reference? reference;

  LinkOrReference.fromJson(Map<String, dynamic> json) :
    link = (json['\$ref'] == null) ? Link.fromJson(json) : null,
    reference = (json['\$ref'] == null) ? null : Reference(ref: json['\$ref']);
}

///
class CallbackOrReference {
  CallbackOrReference(this.callback, this.reference);

  Callback? callback;
  Reference? reference;

  CallbackOrReference.fromJson(Map<String, dynamic> json) :
    callback = (json['\$ref'] == null) ? Callback.fromJson(json) : null,
    reference = (json['\$ref'] == null) ? null : Reference(ref: json['\$ref']);
}

///
class AnyOrRuntimeExpression {
  AnyOrRuntimeExpression(this.any, this.runtimeExpression);

  Any? any;
  RuntimeExpression? runtimeExpression;

  AnyOrRuntimeExpression.fromJson(Map<String, dynamic> json) :
    any = (json['\$ref'] == null) ? Any.fromJson(json) : null,
    runtimeExpression = (json['\$ref'] == null) ? null : RuntimeExpression(json as String);
}
