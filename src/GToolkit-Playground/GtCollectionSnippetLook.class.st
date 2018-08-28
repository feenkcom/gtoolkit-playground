"
I am a look for a collection snippet. I provide a way to select the type of the snippet to create, for examples pharo code or url.

I am designed to work together with ${class:GtSnippetWidgetModel}$ and can be applied on the ${class:GtSnippetElement}$

Example:
[[[
GtSnippetElement new
	look: GtCollectionSnippetLook + BrLayoutLook linearVertical vFitContent hMatchParent
]]]

"
Class {
	#name : #GtCollectionSnippetLook,
	#superclass : #BrLook,
	#instVars : [
		'snippet',
		'toolbar'
	],
	#category : 'GToolkit-Playground-Snippet - Looks'
}

{ #category : #adding }
GtCollectionSnippetLook >> addSnippet: aClass [ 
	self snippet requestSnippetReplacement: aClass
]

{ #category : #accessing }
GtCollectionSnippetLook >> availableSnippetClasses [
	^ self snippet availableSnippetClasses
]

{ #category : #initialization }
GtCollectionSnippetLook >> initialize [
	super initialize.
	snippet := GtCollectionSnippet new.
	toolbar := BrToolbar new.
	toolbar look: BrGlamorousToolbarLook
]

{ #category : #initialization }
GtCollectionSnippetLook >> initializeListeners [
	super initializeListeners.
	
	self when: GtSnippetChanged do: [ :anEvent | self snippet: anEvent snippet ].
]

{ #category : #initialization }
GtCollectionSnippetLook >> initializeLook [
	super initializeLook.

	self availableSnippetClasses do: [ :eachSnippetClass | 
		| anItem |
		anItem := BrButton new.
		anItem margin: (BlInsets all: 2).
		anItem look: BrGlamorousButtonExteriorRectangularLook + BrGlamorousButtonLabelLook.
		anItem label: eachSnippetClass new typeName.
		anItem action: [ self addSnippet: eachSnippetClass ].
		toolbar addItem: anItem ].
	self widgetContent addChild: toolbar as: #toobar
]

{ #category : #initialization }
GtCollectionSnippetLook >> initializeRequests [
	super initializeRequests.
	
	self request: GtSnippetRequest new.
]

{ #category : #accessing }
GtCollectionSnippetLook >> snippet [
	^ snippet
]

{ #category : #accessing }
GtCollectionSnippetLook >> snippet: aGtSnippet [
	snippet := aGtSnippet.
]
