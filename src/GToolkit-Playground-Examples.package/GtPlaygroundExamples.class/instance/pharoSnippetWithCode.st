model
pharoSnippetWithCode
	<gtExample>
	<label: 'A Pharo snippet with a code'>
	| aSnippet |
	aSnippet := self pharoSnippet.
	aSnippet content: 'aValue := 42'.
	self assert: aSnippet content asString equals: 'aValue := 42'.
	^ aSnippet