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
	#category : #'GToolkit-Playground-Snippet - Looks'
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
	toolbar := BrToolbar new.
	toolbar look: BrGlamorousToolbarLook.
	changes
		add: (#(content toobar) asBrLookChildAddAsChangeWithValue: [ toolbar ])
]

{ #category : #initialization }
GtCollectionSnippetLook >> initializeListeners [
	super initializeListeners.
	
	self when: GtSnippetChanged do: [ :anEvent | self snippet: anEvent snippet ].
]

{ #category : #initialization }
GtCollectionSnippetLook >> initializeLook [
	super initializeLook.
	self availableSnippetClasses
		do: [ :eachSnippetClass | 
			| anItem |
			anItem := BrButton new.
			anItem margin: (BlInsets all: 2).
			anItem
				look: BrGlamorousButtonExteriorRectangularLook + BrGlamorousButtonLabelLook.
			anItem label: eachSnippetClass new typeName.
			anItem action: [ self addSnippet: eachSnippetClass ].
			toolbar addItem: anItem ]
]

{ #category : #initialization }
GtCollectionSnippetLook >> initializeRequests [
	super initializeRequests.
	
	self request: GtSnippetRequest new.
]

{ #category : #accessing }
GtCollectionSnippetLook >> snippet [
	snippet ifNil: [ self snippet: GtCollectionSnippet new ].
	^ snippet
]

{ #category : #accessing }
GtCollectionSnippetLook >> snippet: aGtSnippet [
	snippet := aGtSnippet.
]
