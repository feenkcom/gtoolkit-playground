actions
evaluatePharo
	<gtExample>
	<label: 'Evaluate a Pharo code snippet'>
	| aSnippet aResult |
	aSnippet := self pharoSnippet.
	aSnippet sourceCode: 'aVariable := 42'.
	aResult := aSnippet evaluate.
	self assert: aResult equals: 42.
	^ aSnippet