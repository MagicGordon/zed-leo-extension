; Comments
(comment) @comment

; Declarations and instruction keywords
[
  (program_keyword)
  (import_keyword)
  (function_keyword)
  (transition_keyword)
  (closure_keyword)
  (struct_keyword)
  (record_keyword)
  (mapping_keyword)
  (finalize_keyword)
  (input_keyword)
  (output_keyword)
  (key_keyword)
  (value_keyword)
  (as_keyword)
  (into_keyword)
] @keyword

; Aleo VM opcodes
(opcode) @function

; Built-in types and type suffixes
(builtin_type) @type.builtin
(type_suffix) @type
(visibility) @property

; Registers and built-in operands
(register) @variable.special
(special_operand) @variable.special

; Program identifiers, locators, and names
(program_declaration
  name: (program_id) @module)

(import_declaration
  path: (program_id) @module)

[
  (record_declaration
    name: (identifier) @type)
  (struct_declaration
    name: (identifier) @type)
]

(mapping_declaration
  name: (identifier) @property)

[
  (closure_declaration
    name: (identifier) @function)
  (function_declaration
    name: (identifier) @function)
  (transition_declaration
    name: (identifier) @function)
  (finalize_declaration
    name: (identifier) @function)
]

[
  (program_id)
  (locator)
] @module

(identifier) @variable

; Literals
(typed_integer) @number
(address) @string.special
(signature) @string.special
(boolean) @boolean
(string) @string

; Punctuation
[
  ";"
  ":"
  ","
  "."
  "/"
  "["
  "]"
  "("
  ")"
  "{"
  "}"
] @punctuation.delimiter
