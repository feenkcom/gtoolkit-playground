model
pageWithCode
	<gtExample>
	<label: 'A basic playground page with one Pharo snippet'>
	| aPage |
	aPage := self page.
	aPage snippets first sourceCode: 'aValue := 42.'.
	self assert: aPage snippets first sourceCode equals: 'aValue := 42.'.
	^ aPage