model - snippets
pharoSnippetWithSelection
	<gtExample>
	<label: 'A Pharo snippet with a code'>
	| aSnippet |
	aSnippet := self pharoSnippetWithCode.
	aSnippet editor select: aSnippet sourceCode size - 1 to: aSnippet sourceCode size.
	self assert: aSnippet selection equals: '7'.
	^ aSnippet