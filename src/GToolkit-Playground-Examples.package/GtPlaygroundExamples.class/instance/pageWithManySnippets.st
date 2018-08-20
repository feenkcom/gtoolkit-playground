model - page and book
pageWithManySnippets
	<gtExample>
	| aPage | 
	aPage := self page.
	10 timesRepeat: [  
		aPage addSnippet: (GtPharoSnippet new sourceCode: 'aValue := ', 100 atRandom asString ).
		aPage addSnippet: (GtPharoSnippet new sourceCode: 'aValue := aValue + 21 + ', 100 atRandom asString) ].
	self assert: aPage snippets size equals: 21.
	^ aPage