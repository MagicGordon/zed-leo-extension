(test_function_declaration
  name: (identifier) @run @test
  (#set! tag leo-test))

(function_declaration
  name: (identifier) @run @function
  (#set! tag leo-run))

(transition_declaration
  name: (identifier) @run @function
  (#set! tag leo-run))
