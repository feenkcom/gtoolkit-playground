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
	| rootContainerElement expanderContainer |
	
	expanderContainer := BrExpander new.
	expanderContainer
		vFitContent;
		hMatchParent.
	expanderContainer expand.
	expanderContainer look: GtCoderExpanderLook new.
	expanderContainer header: [ BlElement new ].
	expanderContainer content: [
		document asElementWithoutSaveAction ].
	
	rootContainerElement := BlElement new.
	rootContainerElement
		constraintsDo: [ :c | 
			c vertical fitContent.
			c horizontal matchParent ].
	rootContainerElement addChild: expanderContainer.
	rootContainerElement
		clipChildren: false;
		look: (GtSnippetContainerLook new snippet: self) 
			+ BrLayoutLook linearVertical vFitContent hMatchParent;
		border: BlBorder empty;
		padding: BlInsets empty;
		background: BlBackground transparent.
	^ rootContainerElement
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
	document := GtDocument new.
	self documentContent: ''.
]

{ #category : #converting }
GtDocumentSnippet >> stencilBuilderClass [
	"Return a stencil builder class that knows how to display a snippet in Bloc"
	<return: #GtSnippetStencilBuilder>
	^ nil
]

{ #category : #accessing }
GtDocumentSnippet >> text [
	<return: #BlText>
	^ self document text
]

{ #category : #accessing }
GtDocumentSnippet >> variableBindings [ 
	^ self document variableBindings
]

{ #category : #accessing }
GtDocumentSnippet >> variableBindings: aGtPlaygroundBindings [ 
	self document variableBindings: aGtPlaygroundBindings
]
