actions
evaluatePharo
	<gtExample>
	<label: 'Evaluate a Pharo code snippet'>
	| aSnippet aResult |
	aSnippet := self pharoSnippet.
	aSnippet contents: 'aVariable := 42'.
	aSnippet evaluate.
	aResult := aSnippet lastResult.
	self assert: aResult equals: 42.
	^ aSnippet