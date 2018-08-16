model
playground
	<gtExample>
	<label: 'A basic playground'>
	| aPlayground |
	aPlayground := GtPlayBook new.
	self assert: aPlayground pages size equals: 1.
	self assert: aPlayground pages first snippets size equals: 1.
	self assert: aPlayground pages first snippets first sourceCode equals: ''.
	self assert: aPlayground pages first snippets first typeName equals: 'pharo'.
	^ aPlayground