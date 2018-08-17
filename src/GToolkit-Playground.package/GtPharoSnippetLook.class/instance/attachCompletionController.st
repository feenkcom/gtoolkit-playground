private
attachCompletionController
	| aCompletionStrategy |
	completionController ifNotNil: #uninstall.
	aCompletionStrategy := GtPharoCompletionStrategy newForExpression.
	aCompletionStrategy classOrMetaClass: nil class.
	completionController := GtCompletionController
		on: editorElement
		strategy: aCompletionStrategy.
	completionController install