model
pageWithCode
	<gtExample>
	<label: 'A basic playground page with one Pharo snippet'>
	| aPage |
	aPage := self page.
	aPage snippets first content: 'aValue := 42.'.
	self assert: aPage snippets first content asString equals: 'aValue := 42.'.
	^ aPage