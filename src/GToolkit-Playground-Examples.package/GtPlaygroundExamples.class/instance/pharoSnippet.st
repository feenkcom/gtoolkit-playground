model - snippets
pharoSnippet
	<gtExample>
	<label: 'A basic Pharo snippet'>
	| aSnippet |
	aSnippet := GtPharoSnippet new.
	self assert: aSnippet sourceCode equals: ''.
	self assert: aSnippet typeName equals: 'pharo'.
	^ aSnippet