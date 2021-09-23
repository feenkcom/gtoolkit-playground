Class {
	#name : #GtPlaygroundPharoSnippetExamples,
	#superclass : #Object,
	#category : #'GToolkit-Playground-Examples'
}

{ #category : #model }
GtPlaygroundPharoSnippetExamples >> page [
	<gtExample>
	<label: 'A basic playground page with one Pharo snippet'>
	| aPage |
	aPage := GtPlayPage new.
	self assert: aPage snippets size equals: 0.
	self assert: aPage bindings class equals: GtSnippetBindings.
	^ aPage
]

{ #category : #model }
GtPlaygroundPharoSnippetExamples >> pageWithTwoPharoSnippets [
	<gtExample>
	<label: 'A playground page with two Pharo snippets'>
	| aPage |
	aPage := self page.
	aPage addSnippet: (self pharoSnippet sourceCode: 'aValue := 42.').
	aPage addSnippet: (self pharoSnippet sourceCode: 'aValue := 72.').
	self assert: aPage snippets size equals: 2.
	self assert: aPage snippets first sourceCode equals: 'aValue := 42.'.
	self assert: aPage snippets second sourceCode equals: 'aValue := 72.'.
	^ aPage
]

{ #category : #model }
GtPlaygroundPharoSnippetExamples >> pharoSnippet [
	<gtExample>
	<label: 'A basic Pharo snippet'>
	| aSnippet |
	aSnippet := GtCoderSnippet new.
	self assert: aSnippet sourceCode equals: ''.
	self assert: aSnippet typeName equals: 'pharo'.
	^ aSnippet
]
