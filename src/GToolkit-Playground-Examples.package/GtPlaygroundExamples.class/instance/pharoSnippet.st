model
pharoSnippet
	<gtExample>
	<label: 'A basic Pharo snippet'>
	| aSnippet |
	aSnippet := GtPharoSnippet new.
	self assert: aSnippet contents asString equals: ''.
	self assert: aSnippet typeName equals: 'pharo'.
	^ aSnippet