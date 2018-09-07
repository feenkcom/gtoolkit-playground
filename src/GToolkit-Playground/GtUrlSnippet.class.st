Class {
	#name : #GtUrlSnippet,
	#superclass : #GtCodeSnippet,
	#instVars : [
		'response',
		'responseVariableName',
		'variableBindings'
	],
	#category : #'GToolkit-Playground-Model'
}

{ #category : #accessing }
GtUrlSnippet class >> typeName [
	"Return a playground snippet type name.
	It should be an unique name among all playground snippet types."
	<return: #String>
	^ 'url'
]

{ #category : #visitor }
GtUrlSnippet >> accept: aVisitor [
	^ aVisitor visitGtUrlSnippet: self
]

{ #category : #initialization }
GtUrlSnippet >> defaultSourceCode [
	^ 'https://feenk.com'
]

{ #category : #initialization }
GtUrlSnippet >> defaultStyler [
	^ BrTextNullStyler new
]

{ #category : #'public access' }
GtUrlSnippet >> evaluate [
	| aCommand aFuture |
	aCommand := (GtUrlGetResponseCommand snippet: self) asErrorCatchingCommand.
	aFuture := aCommand future.
	aFuture onSuccessDo: [ :aResult |
		self 
			notifyAboutResult: aCommand result 
			exception: aCommand isException 
			spawn: false.
		response := aCommand result.
		self variableBindings at: self responseVariableName put: response ]
]

{ #category : #initialization }
GtUrlSnippet >> initialize [
	super initialize.
	response := nil.
	responseVariableName := #aResponse.
	self variableBindings: GtPlaygroundBindings new.

]

{ #category : #accessing }
GtUrlSnippet >> response [
	<return: #ZnReponse or: #Exception or: nil>
	^ response
]

{ #category : #accessing }
GtUrlSnippet >> responseVariableName [
	<return: #Symbol>
	^ responseVariableName
]

{ #category : #accessing }
GtUrlSnippet >> responseVariableName: aStringOrSymbol [
	responseVariableName := aStringOrSymbol asSymbol.
	self response ifNil: [ ^ self ].
	self variableBindings at: self responseVariableName put: self response.
]

{ #category : #converting }
GtUrlSnippet >> stencilBuilderClass [
	"Return a stencil builder class that knows how to display a snippet in Bloc"
	<return: #GtSnippetStencilBuilder>
	^ GtUrlSnippetStencilBuilder
]

{ #category : #accessing }
GtUrlSnippet >> url [
	<return: #String>
	^ self sourceCode
]

{ #category : #accessing }
GtUrlSnippet >> url: aZnUrlString [
	^ self sourceCode: aZnUrlString
]

{ #category : #accessing }
GtUrlSnippet >> variableBindings [
	<return: #GtBindingsTrait>

	^ variableBindings
]

{ #category : #accessing }
GtUrlSnippet >> variableBindings: aGtBindingsTrait [
	self 
		assert: [ aGtBindingsTrait notNil ] 
		description: [ 'Variable bindings must be non-nil' ].

	variableBindings := aGtBindingsTrait.
]
