completer
completer
	<gtExample>
	| snippetElement textEditorElement completionStrategy completionController |
	snippetElement := self pharoSnippet asElement.
	textEditorElement := snippetElement childNamed: #textEditor.
	completionStrategy := GtPharoCompletionStrategy newForExpression.
	completionStrategy classOrMetaClass: nil class.
	completionController := GtCompletionController on: textEditorElement strategy: completionStrategy.
	completionController install.
	^ snippetElement