code evaluation
executeSourceCode
	<gtExample>
	<label: 'Evaluate a source code'>
	| aCommand |
	aCommand := self evaluateSourceCodeCommand.
	aCommand code: '4 factorial'.
	aCommand execute.
	self assert: aCommand isException not.
	self assert: aCommand result equals: 24.
	^ aCommand