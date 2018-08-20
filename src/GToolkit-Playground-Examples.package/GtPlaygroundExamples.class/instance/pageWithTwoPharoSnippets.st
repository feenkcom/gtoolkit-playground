model - page and book
pageWithTwoPharoSnippets
	<gtExample>
	<label: 'A playground page with two Pharo snippets'>
	| aPage |
	aPage := self page.
	aPage snippets first sourceCode: 'aValue := 42.'.
	aPage addSnippet: (self pharoSnippet sourceCode: 'aValue := 72.').
	self assert: aPage snippets size equals: 2.
	self assert: aPage snippets first sourceCode equals: 'aValue := 42.'.
	self assert: aPage snippets second sourceCode equals: 'aValue := 72.'.
	^ aPage