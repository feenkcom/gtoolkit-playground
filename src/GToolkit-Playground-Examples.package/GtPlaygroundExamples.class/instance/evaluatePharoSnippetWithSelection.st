actions
evaluatePharoSnippetWithSelection
	<gtExample>
	<label: 'Evaluate a Pharo code snippet'>
		| aSnippet aResult aText |
	aSnippet := self pharoSnippetWithSelection.
	aResult := aSnippet evaluate.
	self assert: aResult equals: 7.
	aText := aSnippet editor selectedText.
	^ aSnippet