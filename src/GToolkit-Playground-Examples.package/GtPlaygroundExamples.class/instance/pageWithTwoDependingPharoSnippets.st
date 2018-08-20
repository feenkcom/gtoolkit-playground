model - page and book
pageWithTwoDependingPharoSnippets
	<gtExample>
	<label: 'A playground page with two Pharo snippets'>
	| aPage |
	aPage := self page.
	aPage replaceSnippet: aPage snippets first by: (self pharoSnippet sourceCode: 'aValue := 42.').
	aPage addSnippet: (self pharoSnippet sourceCode: 'aValue := aValue + 21').
	self assert: aPage snippets size equals: 2.
	self assert: aPage snippets second sourceCode equals: 'aValue := aValue + 21'.
	^ aPage