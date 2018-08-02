model
pharoSnippet
	<gtExample>
	<label: 'A basic Pharo snippet'>
	| aSnippet |
	aSnippet := GtPharoSnippet new.
	self assert: aSnippet content asString equals: ''.
	self assert: aSnippet typeName equals: 'pharo'.
	^ aSnippet