model
pageWithTwoPharoSnippets
	<gtExample>
	<label: 'A playground page with two Pharo snippets'>
	| aPage |
	aPage := self page.
	aPage snippets first contents: 'aValue := 42.'.
	aPage addSnippet: (self pharoSnippet contents: 'aValue := 72.').
	self assert: aPage snippets size equals: 2.
	self assert: aPage snippets first contents asString equals: 'aValue := 42.'.
	self assert: aPage snippets second contents asString equals: 'aValue := 72.'.
	^ aPage