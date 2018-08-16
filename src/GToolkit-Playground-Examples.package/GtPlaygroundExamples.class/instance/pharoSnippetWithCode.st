model
pharoSnippetWithCode
	<gtExample>
	<label: 'A Pharo snippet with a code'>
	| aSnippet |
	aSnippet := self pharoSnippet.
	aSnippet sourceCode: 'aValue := 42'.
	self assert: aSnippet sourceCode equals: 'aValue := 42'.
	^ aSnippet