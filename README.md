# Build openapi client builders from the OpenApi specification

## Usage

A simple usage example:

```dart
import 'package:openapi_client_builder_builder/openapi_client_builder_builder.dart';

main() {
  var awesome = new Awesome();
}
```

## Data cleaning

Each data cleaning listed below was committed separately, with a commit message of the form: 'Data clean: -subheading-' (referring to the subheadings below)

### add spaces to OAuth Flows table

I made some assumptions about the contents of [OpenAPI-Specification-3.0.1](https://github.com/OAI/OpenAPI-Specification/blob/master/versions/3.0.1.md)

eg. items in tables are always separated with ' | '

I had to edit the md file to make this true.
- added spaces to items in 'OAuth Flows Object' table

### add extra '/' to /| separator

When the markdown is converted to html, the /| separator (used to indicate union types) becomes just '|' nd is thus indistinguidable from the table separator in the markdown ('|' in markdown which also becomes '|' in the html).