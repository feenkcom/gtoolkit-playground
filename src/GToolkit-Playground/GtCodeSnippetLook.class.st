Class {
	#name : #GtCodeSnippetLook,
	#superclass : #BrLook,
	#traits : 'GtPlaygroundConstantsTrait',
	#classTraits : 'GtPlaygroundConstantsTrait classTrait',
	#instVars : [
		'snippet',
		'editorElement'
	],
	#category : #'GToolkit-Playground-Snippet - Looks'
}

{ #category : #defaults }
GtCodeSnippetLook >> defaultSnippet [
	^ GtPharoSnippet new
]

{ #category : #initialization }
GtCodeSnippetLook >> initialize [
	super initialize.
	editorElement := BrEditorElement new.
	editorElement look: BrGlamorousTextAreaLook.
]

{ #category : #initialization }
GtCodeSnippetLook >> initializeListeners [
	super initializeListeners.
	
	self when: GtSnippetChanged do: [ :anEvent | self snippet: anEvent snippet ]
]

{ #category : #initialization }
GtCodeSnippetLook >> initializeLook [
	super initializeLook.
	self widgetContent addChild: editorElement as: self constants editorElementName.
	self registerKeyBindings.
]

{ #category : #initialization }
GtCodeSnippetLook >> initializeRequests [
	super initializeRequests.
	
	self request: GtSnippetRequest new.
]

{ #category : #private }
GtCodeSnippetLook >> registerKeyBindings [
	"Register Bloc key bindings if necessary"
]

{ #category : #'announcement handling' }
GtCodeSnippetLook >> requestFocusAnnouncement: aGtSnippetFocusRequestAnnouncement [
	self widgetDo: [ editorElement requestFocus ].
]

{ #category : #accessing }
GtCodeSnippetLook >> snippet [
	snippet ifNil: [ self snippet: self defaultSnippet ].
	^ snippet
]

{ #category : #accessing }
GtCodeSnippetLook >> snippet: aGtSnippet [
	self unsubscribeFromSnippet: snippet.
	snippet := aGtSnippet.
	editorElement editor: snippet editor.
	self subscribeToSnippet: aGtSnippet.
]

{ #category : #'announcement registration' }
GtCodeSnippetLook >> subscribeToSnippet: aGtSnippet [
	aGtSnippet 
		subscribe: GtSnippetFocusRequestAnnouncement 
		send: #requestFocusAnnouncement: 
		to: self 
		for: self
]

{ #category : #'announcement registration' }
GtCodeSnippetLook >> unsubscribeFromSnippet: aGtSnippetOrNil [
	aGtSnippetOrNil ifNil: [ ^ self ].
	aGtSnippetOrNil unsubscribe: self.
]
