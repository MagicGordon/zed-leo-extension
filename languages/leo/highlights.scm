; Comments
(comment) @comment

; Declarations and control flow
[
  (program_keyword)
  (import_keyword)
  (const_keyword)
  (interface_keyword)
  (struct_keyword)
  (record_keyword)
  (mapping_keyword)
  (storage_keyword)
  (constructor_keyword)
  (function_keyword)
  (transition_keyword)
  (inline_keyword)
  (final_keyword)
  (script_keyword)
  (fn_keyword)
  (async_keyword)
  (keyword)
] @keyword

(visibility) @property

; Built-in types and special values
(builtin_type) @type.builtin
(boolean) @boolean
(none) @constant.builtin
(special_expression) @variable.special
(special_path) @variable.special
(underscore) @variable.special

; Names and locators
(program_declaration
  name: (program_id) @module)

(import_declaration
  path: (_) @module)

(const_declaration
  name: (identifier) @constant)

[
  (interface_declaration
    name: (identifier) @type)
  (struct_declaration
    name: (identifier) @type)
  (record_declaration
    name: (identifier) @type)
]

[
  (mapping_declaration
    name: (identifier) @property)
  (storage_declaration
    name: (identifier) @property)
]

[
  (function_declaration
    name: (identifier) @function)
  (test_function_declaration
    name: (identifier) @function)
  (transition_declaration
    name: (identifier) @function)
  (inline_declaration
    name: (identifier) @function)
  (finalizer_declaration
    name: (identifier) @function)
  (script_declaration
    name: (identifier) @function)
  (fn_declaration
    name: (identifier) @function)
]

(constructor_declaration
  (constructor_keyword) @function)

(annotation) @attribute
(test_annotation) @attribute
(program_id) @module
(locator) @module
(identifier) @variable

; Literals
(numeric_literal) @number
(address_literal) @string.special
(string) @string

; Operators and punctuation
(operator) @operator
(arrow_operator) @operator

[
  ";"
  ":"
  ","
  "."
  "::"
  "("
  ")"
  "["
  "]"
  "{"
  "}"
] @punctuation.delimiter
