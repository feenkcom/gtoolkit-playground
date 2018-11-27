Class {
	#name : #GtCoderSnippet,
	#superclass : #GtSnippet,
	#instVars : [
		'coder'
	],
	#category : #'GToolkit-Playground-Model'
}

{ #category : #accessing }
GtCoderSnippet class >> typeName [
	"Return a playground snippet type name.
	It should be an unique name among all playground snippet types."
	<return: #String>

	^ 'pharo-snippet'
]

{ #category : #visitor }
GtCoderSnippet >> accept: aVisitor [
	^ aVisitor visitGtPharoSnippet: self
]

{ #category : #converting }
GtCoderSnippet >> asStencilBuilder [
	^ coder
]

{ #category : #'initialize-release' }
GtCoderSnippet >> initialize [
	super initialize.
	coder := GtPharoSnippetCoder new
]

{ #category : #accessing }
GtCoderSnippet >> sourceCode [
	^ self text asString
]

{ #category : #accessing }
GtCoderSnippet >> sourceCode: aString [
	coder source: aString
]

{ #category : #converting }
GtCoderSnippet >> stencilBuilderClass [
	"Return a stencil builder class that knows how to display a snippet in Bloc"
	<return: #GtSnippetStencilBuilder>
	^ nil
]

{ #category : #accessing }
GtCoderSnippet >> text [
	^ coder sourceEditor text
]

{ #category : #accessing }
GtCoderSnippet >> variableBindings: aGtPlaygroundBindings [
	coder variableBindings: aGtPlaygroundBindings
]
