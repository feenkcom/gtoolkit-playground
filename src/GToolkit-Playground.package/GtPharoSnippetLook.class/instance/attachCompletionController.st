private
attachCompletionController
	| aCompletionStrategy |
	completionController ifNotNil: #uninstall.
	aCompletionStrategy := GtPharoCompletionStrategy newForSnippet.
	aCompletionStrategy classOrMetaClass: nil class.
	completionController := GtCompletionController
		on: editorElement
		strategy: aCompletionStrategy.
	completionController install