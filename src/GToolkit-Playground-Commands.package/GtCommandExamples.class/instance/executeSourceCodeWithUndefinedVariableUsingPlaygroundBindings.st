code evaluation
executeSourceCodeWithUndefinedVariableUsingPlaygroundBindings
	<gtExample>
	<label: 'Evaluate a source code with undefined variable using playground bindings'>
	| aCommand |
	aCommand := self evaluateSourceCodeCommand.
	aCommand code: 'aValue := 4 factorial'.
	aCommand bindings: GtPlaygroundBindings new.
	aCommand execute.
	self assert: aCommand isException not.
	self assert: aCommand result equals: 24.
	self assert: (aCommand bindings bindingOf: #aValue) notNil.
	self assert: (aCommand bindings bindingOf: #aValue) value equals: 24.
	^ aCommand