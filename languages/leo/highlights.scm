; Comments
(comment) @comment

; Declarations and control flow
(keyword) @keyword
(visibility) @property

; Built-in types and special values
(builtin_type) @type.builtin
(boolean) @boolean
(none) @constant.builtin
(special_expression) @variable.special

; Names and locators
(annotation) @attribute
(program_id) @module
(locator) @module
(identifier) @variable

; Literals
(numeric_literal) @number
(address_literal) @string.special
(string) @string

; Operators and punctuation
(operator) @operator

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
