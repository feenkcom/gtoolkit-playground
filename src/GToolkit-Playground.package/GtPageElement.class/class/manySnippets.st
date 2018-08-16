example
manySnippets
	<gtExample>
	| aPage | 
	aPage := self new.
	aPage constraintsDo: [ :c |
		c horizontal matchParent.
		c vertical matchParent ].
	10 timesRepeat: [  
		aPage addSnippet: (GtPharoSnippet new content: 'aValue := ', 100 atRandom asString ).
		aPage addSnippet: (GtPharoSnippet new content: 'aValue := aValue + 21 + ', 100 atRandom asString) ].
	^ aPage