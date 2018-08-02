example
example
	<gtExample>
	| aPage | 
	aPage := self new.
	aPage constraintsDo: [ :c |
		c horizontal matchParent.
		c vertical matchParent ].
	aPage addStencil: (GtPharoSnippet new content: 'aValue := 42').
	aPage addStencil: (GtPharoSnippet new content: 'aValue := aValue + 21').
	^ aPage