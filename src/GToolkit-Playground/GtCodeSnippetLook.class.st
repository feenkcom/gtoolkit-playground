Class {
	#name : #GtCodeSnippetLook,
	#superclass : #BrLook,
	#traits : 'GtPlaygroundConstantsTrait',
	#classTraits : 'GtPlaygroundConstantsTrait classTrait',
	#instVars : [
		'snippet',
		'editorElement'
	],
	#category : 'GToolkit-Playground-Snippet - Looks'
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
	self snippet: self defaultSnippet.
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

{ #category : #accessing }
GtCodeSnippetLook >> snippet [
	^ snippet
]

{ #category : #accessing }
GtCodeSnippetLook >> snippet: aGtSnippet [
	snippet := aGtSnippet.
	editorElement editor: snippet editor.
]
