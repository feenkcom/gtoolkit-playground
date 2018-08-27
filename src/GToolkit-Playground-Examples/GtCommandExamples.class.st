Class {
	#name : #GtCommandExamples,
	#superclass : #Object,
	#category : 'GToolkit-Playground-Examples'
}

{ #category : #'code evaluation' }
GtCommandExamples >> evaluateSourceCodeCommand [
	<gtExample>
	<label: 'Evaluate source code command'>
	| aCommand |
	aCommand := GtEvaluateSourceCodeCommand new.
	self assert: aCommand sourceCode isString.
	self assert: aCommand isException not.
	self assert: aCommand bindingsStrategy notNil.
	self assert: aCommand result isNil.
	self assert: aCommand receiver isNil.
	^ aCommand
]

{ #category : #'code evaluation' }
GtCommandExamples >> executeDefaultSourceCode [
	<gtExample>
	<label: 'Evaluate a default source code command'>
	| aCommand |
	aCommand := self evaluateSourceCodeCommand.
	aCommand execute.
	self assert: aCommand isException not.
	self assert: aCommand result isNil.
	^ aCommand
]

{ #category : #'code evaluation' }
GtCommandExamples >> executeSourceCode [
	<gtExample>
	<label: 'Evaluate a source code'>
	| aCommand |
	aCommand := self evaluateSourceCodeCommand.
	aCommand sourceCode: '4 factorial'.
	aCommand execute.
	self assert: aCommand isException not.
	self assert: aCommand result equals: 24.
	^ aCommand
]

{ #category : #'code evaluation' }
GtCommandExamples >> executeSourceCodeWithUndefinedVariable [
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
]

{ #category : #'code evaluation' }
GtCommandExamples >> executeSourceCodeWithUndefinedVariableUsingPlaygroundBindings [
	<gtExample>
	<label: 'Evaluate a source code with undefined variable using playground bindings'>
	| aCommand |
	aCommand := self evaluateSourceCodeCommand.
	aCommand sourceCode: 'aValue := 4 factorial'.
	aCommand variableBindings: GtPlaygroundBindings new.
	aCommand execute.
	self assert: aCommand isException not.
	self assert: aCommand result equals: 24.
	self assert: (aCommand variableBindings bindingOf: #aValue) notNil.
	self assert: (aCommand variableBindings bindingOf: #aValue) value equals: 24.
	^ aCommand
]
