; Comments
(comment) @comment

; Declarations and instruction keywords
(keyword) @keyword

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
(program_id) @module
(locator) @module
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
] @punctuation.delimiter
