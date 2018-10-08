Class {
	#name : #GtPharoSnippetLook,
	#superclass : #GtCodeSnippetLook,
	#instVars : [
		'completionController'
	],
	#category : #'GToolkit-Playground-Snippet - Looks'
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
			combination: (BlKeyCombination builder primary; key: Key return; build);
			action: [ :aShortcut | self snippet requestSnippetSplit ]);
		addShortcut: (BlShortcut new
			combination: (BlKeyCombination builder primary; key: Key delete; build);
			action: [ :aShortcut | self snippet requestSnippetMerge ]);
		addShortcut: (BlShortcut new
			combination: (BlKeyCombination builder primary; key: Key d; build);
			action: [ :aShortcut | self snippet evaluate ]);
		addShortcut: (BlShortcut new
			combination: (BlKeyCombination builder primary; key: Key g; build);
			action: [ :aShortcut | self snippet evaluateAndGo ]);
		addShortcut: (BlShortcut new
			combination: (BlKeyCombination builder primary; key: Key i; build);
			action: [ :aShortcut | self snippet evaluateAndGo ]);
		addShortcut: (BlShortcut new
			combination: (BlKeyCombination builder primary; key: Key p; build);
			action: [ :aShortcut | self inform: self snippet evaluate printString ]);
		addShortcut: (BlShortcut new
				combination: (BlKeyCombination builder primary; key: Key r; build);
				action: [ GtRenameAction pharoRenameSnippetLocalsOn: editorElement ]).
]

{ #category : #accessing }
GtPharoSnippetLook >> snippet: aGtSnippet [
	super snippet: aGtSnippet.
	self attachCompletionController.
]
