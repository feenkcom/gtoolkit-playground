Class {
	#name : #GtPharoSnippetLook,
	#superclass : #GtCodeSnippetLook,
	#instVars : [
		'completionController'
	],
	#category : 'GToolkit-Playground-Snippet - Looks'
}

{ #category : #private }
GtPharoSnippetLook >> attachCompletionController [
	| aCompletionStrategy |
	completionController ifNotNil: #uninstall.
	aCompletionStrategy := GtPharoCompletionStrategy newForSnippet.
	aCompletionStrategy classOrMetaClass: nil class.
	completionController := GtCompletionController
		on: editorElement
		strategy: aCompletionStrategy.
	completionController install
]

{ #category : #initialization }
GtPharoSnippetLook >> initializeLook [
	super initializeLook.
	self attachCompletionController
]

{ #category : #private }
GtPharoSnippetLook >> registerKeyBindings [
	editorElement 
		addShortcut: (BlShortcut new
			combination: (BlKeyCombination builder meta; key: Key return; build);
			action: [ :aShortcut | self snippet requestSnippetSplit ]);
		addShortcut: (BlShortcut new
			combination: (BlKeyCombination builder meta; shift; key: Key return; build);
			action: [ :aShortcut | self snippet requestSnippetMerge ]);
		addShortcut: (BlShortcut new
			combination: (BlKeyCombination builder meta; key: Key d; build);
			action: [ :aShortcut | self snippet evaluate ]);
		addShortcut: (BlShortcut new
			combination: (BlKeyCombination builder meta; key: Key g; build);
			action: [ :aShortcut | self snippet evaluateAndGo ]);
		addShortcut: (BlShortcut new
			combination: (BlKeyCombination builder meta; key: Key i; build);
			action: [ :aShortcut | self snippet evaluateAndGo ]);
		addShortcut: (BlShortcut new
			combination: (BlKeyCombination builder meta; key: Key p; build);
			action: [ :aShortcut | self inform: self snippet evaluate printString ]).
]

{ #category : #accessing }
GtPharoSnippetLook >> snippet: aGtSnippet [
	super snippet: aGtSnippet.
	self attachCompletionController.
]
