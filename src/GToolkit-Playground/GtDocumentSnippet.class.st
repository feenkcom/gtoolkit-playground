Class {
	#name : #GtDocumentSnippet,
	#superclass : #GtSnippet,
	#instVars : [
		'document'
	],
	#category : #'GToolkit-Playground-Model'
}

{ #category : #accessing }
GtDocumentSnippet class >> typeName [
	"Return a playground snippet type name.
	It should be an unique name among all playground snippet types."
	<return: #String>

	^ 'document'
]

{ #category : #visitor }
GtDocumentSnippet >> accept: aVisitor [
	self flag: 'TODO'
]

{ #category : #converting }
GtDocumentSnippet >> asElement [
	| anExpanderElement |
	
	anExpanderElement := BrExpander new
		vFitContent;
		hMatchParent;
		expand;
		aptitude: GtCoderExpanderAptitude new;
		addAptitude: (BrLayoutResizerAptitude new inherit: document);
		header: [ BlElement new ];
		content: [ document ].
	
	^ BrFrame new
		vFitContent;
		hMatchParent;
		aptitude: (GtSnippetContainerAptitude new snippet: self);
		addChild: anExpanderElement
]

{ #category : #converting }
GtDocumentSnippet >> asStencilBuilder [
	^ self
]

{ #category : #'api - instantiation' }
GtDocumentSnippet >> bind: aSnippet to: aSnippetElement [
]

{ #category : #accessing }
GtDocumentSnippet >> document [
	^ document
]

{ #category : #accessing }
GtDocumentSnippet >> documentContent: aStringOrRope [
	self 
		assert: [ aStringOrRope notNil ] 
		description: [ 'The contents should be initialized (a string or rope)' ].
	self document text: aStringOrRope asRopedText.
]

{ #category : #initialization }
GtDocumentSnippet >> initialize [
	super initialize.
	document := GtDocumenter new.
	document normalFontSize: 14.
	document vFitContent.
	self documentContent: ''.
]

{ #category : #converting }
GtDocumentSnippet >> stencilBuilderClass [
	"Return a stencil builder class that knows how to display a snippet in Bloc"
	<return: #GtSnippetStencilBuilder>
	^ nil
]

{ #category : #accessing }
GtDocumentSnippet >> string [
	<return: #String>
	^ self document string
]

{ #category : #accessing }
GtDocumentSnippet >> string: aString [
	^ self text: aString
]

{ #category : #accessing }
GtDocumentSnippet >> text [
	<return: #BlText>
	^ self document text
]

{ #category : #accessing }
GtDocumentSnippet >> text: aStringOrRope [
	^ self document text: aStringOrRope
]

{ #category : #accessing }
GtDocumentSnippet >> variableBindings [ 
	^ self document variableBindings
]

{ #category : #accessing }
GtDocumentSnippet >> variableBindings: aGtPlaygroundBindings [ 
	self document variableBindings: aGtPlaygroundBindings
]
