model
pageWithCode
	<gtExample>
	<label: 'A basic playground page with one Pharo snippet'>
	| aPage |
	aPage := self page.
	aPage snippets first contents: 'aValue := 42.'.
	self assert: aPage snippets first contents asString equals: 'aValue := 42.'.
	^ aPage