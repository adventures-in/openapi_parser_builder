# Build openapi clients from the OpenApi specification

## Usage

A simple usage example:

```dart
import 'package:openapi_client_builder/builder.dart';

main() {
  var awesome = new Awesome();
}
```

## Testing 

For faster iterations, we save the html string generated when running the builder.  If the markdown changes, a new html string should be saved for the tests. 

- a quick way to do this is to change the `client_builder.dart` to use `html` in place of `combinedOutput` in `buildStep.writeAsString`, then copy the html from `schema_classes.dart` to `test/data/openapi_spec_html.dart`.

## Data cleaning

Each data cleaning listed below was committed separately, with a commit message of the form: 'Data clean: -subheading-' (referring to the subheadings below)

### add spaces to OAuth Flows table

I made some assumptions about the contents of [OpenAPI-Specification-3.0.1](https://github.com/OAI/OpenAPI-Specification/blob/master/versions/3.0.1.md)

eg. items in tables are always separated with ' | '

I had to edit the md file to make this true.
- added spaces to items in 'OAuth Flows Object' table

### add extra '/' to /| separator

When the markdown is converted to html, the /| separator (used to indicate union types) becomes just '|' nd is thus indistinguidable from the table separator in the markdown ('|' in markdown which also becomes '|' in the html).

### add spaces to more tables

- 'summary' member of Path Item Object
- 'securitySchemes' member of Components Object
