code evaluation
executeSourceCodeWithUndefinedVariable
	<gtExample>
	<label: 'Evaluate a source code with undefined variable'>
	| aCommand |
	aCommand := self evaluateSourceCodeCommand.
	aCommand sourceCode: 'aValue := 4 factorial'.
	aCommand execute.
	self assert: aCommand isException.
	self assert: aCommand result notNil.
	self assert: aCommand result node name equals: #aValue.
	^ aCommand