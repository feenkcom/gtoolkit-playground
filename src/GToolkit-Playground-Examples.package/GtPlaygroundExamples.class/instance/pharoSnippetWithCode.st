model
pharoSnippetWithCode
	<gtExample>
	<label: 'A Pharo snippet with a code'>
	| aSnippet |
	aSnippet := self pharoSnippet.
	aSnippet contents: 'aValue := 42'.
	self assert: aSnippet contents asString equals: 'aValue := 42'.
	^ aSnippet