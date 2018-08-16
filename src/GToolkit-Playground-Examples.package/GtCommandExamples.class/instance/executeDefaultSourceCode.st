code evaluation
executeDefaultSourceCode
	<gtExample>
	<label: 'Evaluate a default source code command'>
	| aCommand |
	aCommand := self evaluateSourceCodeCommand.
	aCommand execute.
	self assert: aCommand isException not.
	self assert: aCommand result isNil.
	^ aCommand