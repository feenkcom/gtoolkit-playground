code evaluation
evaluateSourceCodeCommand
	<gtExample>
	<label: 'Evaluate source code command'>
	| aCommand |
	aCommand := GtEvaluateSourceCodeCommand new.
	self assert: aCommand code isString.
	self assert: aCommand isException not.
	self assert: aCommand bindingsStrategy notNil.
	self assert: aCommand result isNil.
	^ aCommand