model - page and book
playBook
	<gtExample>
	<label: 'A basic play book'>
	| aPlayBook |
	aPlayBook := GtPlayBook new.
	self assert: aPlayBook pages size equals: 1.
	self assert: aPlayBook pages first snippets size equals: 1.
	self assert: aPlayBook pages first snippets first sourceCode equals: ''.
	self assert: aPlayBook pages first snippets first typeName equals: 'pharo'.
	^ aPlayBook