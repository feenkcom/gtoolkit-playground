Class {
	#name : #GtEvaluateSourceCodeCommand,
	#superclass : #GtPlaygroundCommand,
	#instVars : [
		'result',
		'isException',
		'bindingsStrategy',
		'sourceCode',
		'requestor',
		'receiver'
	],
	#category : #'GToolkit-Playground-Commands'
}

{ #category : #accessing }
GtEvaluateSourceCodeCommand >> bindingsStrategy [
	<return: #GtBindingStrategy>
	^ bindingsStrategy
]

{ #category : #accessing }
GtEvaluateSourceCodeCommand >> bindingsStrategy: aBindingsStrategy [
	self 
		assert: [ aBindingsStrategy notNil ] 
		description: [ 'Bindings strategy must be non-nil' ].
	bindingsStrategy := aBindingsStrategy
]

{ #category : #accessing }
GtEvaluateSourceCodeCommand >> catchingErrors [
	"Return an error or collections of errors to catch during a command execution"
	^ Error, OCSemanticWarning
]

{ #category : #execution }
GtEvaluateSourceCodeCommand >> execute [
	| aCompiler |
	aCompiler := self class compiler
		source: self sourceCode "readStream" "Looks like it can be a String instead of readSream";
		context: nil "TODO: what is context? evaluation uses `context method methodClass`";
		receiver: self receiver "TODO: what is receiver? evaluation uses `receiver class` if context is nil";
		bindings: self bindingsStrategy;
		requestor: self requestor. "TODO: requestor should be an editor?
			evaluation uses `requestor selection` to evaluate only selected part"
	[ 
		result := aCompiler evaluate.
		"evaluation does: 
			`receiver withArgs: context or #() executeMethod: 
				parse uses `noPattern`, 
					if context is not nil, `context tempNames` is used in `rewriteTempsForContext:`
				doSemanticAnalysis uses: 
					`compilationContext failBlock` on an exception
					`compilationContext scope newMethodScope to validate source code
						`lookupVariableForWrite:` uses `scope lookupVar: aVarNameString"
		"parseExpression uses `parserClass` and `optionParseErrors` to parse faulty expressions"
		isException := false.
	] on: Error, OCSemanticWarning do: [ :anException | 
		result := anException.
		isException := true.
	].
]

{ #category : #initialization }
GtEvaluateSourceCodeCommand >> initialize [
	super initialize.
	sourceCode := 'nil'.
	result := nil.
	isException := false.
	bindingsStrategy := GtPlaygroundBindingStrategy new.
]

{ #category : #accessing }
GtEvaluateSourceCodeCommand >> isException [
	"Return true, if evaluation raised an exception"
	<return: #Boolean>
	^ isException
]

{ #category : #accessing }
GtEvaluateSourceCodeCommand >> receiver [
	^ receiver
]

{ #category : #accessing }
GtEvaluateSourceCodeCommand >> receiver: anObject [
	receiver := anObject
]

{ #category : #accessing }
GtEvaluateSourceCodeCommand >> requestor [
	^ requestor
]

{ #category : #accessing }
GtEvaluateSourceCodeCommand >> requestor: anObject [
	requestor := anObject
]

{ #category : #accessing }
GtEvaluateSourceCodeCommand >> result [
	"Return a source code evaluation result"
	^ result
]

{ #category : #accessing }
GtEvaluateSourceCodeCommand >> sourceCode [
	<return: #String>
	^ sourceCode
]

{ #category : #accessing }
GtEvaluateSourceCodeCommand >> sourceCode: aString [
	self
		assert: [ aString notNil ] 
		description: [ 'Source code must be non-nil' ].
	sourceCode := aString asString
]

{ #category : #accessing }
GtEvaluateSourceCodeCommand >> variableBindings [
	<return: #GtBindingsTrait>
	^ bindingsStrategy bindings
]

{ #category : #accessing }
GtEvaluateSourceCodeCommand >> variableBindings: aGtBindingsTrait [
	self 
		assert: [ aGtBindingsTrait notNil ] 
		description: [ 'Bindings must be non-nil' ].
	bindingsStrategy bindings: aGtBindingsTrait
]
