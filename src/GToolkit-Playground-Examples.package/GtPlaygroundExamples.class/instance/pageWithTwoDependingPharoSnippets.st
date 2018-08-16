model
pageWithTwoDependingPharoSnippets
	<gtExample>
	<label: 'A playground page with two Pharo snippets'>
	| aPage |
	aPage := self page.
	aPage snippets first sourceCode: 'aValue := 42.'.
	aPage addSnippet: (self pharoSnippet sourceCode: 'aValue := aValue + 21').
	self assert: aPage snippets size equals: 2.
	self assert: aPage snippets first sourceCode equals: 'aValue := 42.'.
	self assert: aPage snippets second sourceCode equals: 'aValue := aValue + 21'.
	^ aPage