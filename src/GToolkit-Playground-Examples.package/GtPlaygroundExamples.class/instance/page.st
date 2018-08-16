model
page
	<gtExample>
	<label: 'A basic playground page with one Pharo snippet'>
	| aPage |
	aPage := GtPage new.
	self assert: aPage snippets size equals: 1.
	self assert: aPage snippets first typeName equals: 'pharo'.
	self assert: aPage snippets first sourceCode equals: ''.
	self assert: aPage bindings class equals: GtPlaygroundBindings.
	self assert: aPage snippets first variableBindings equals: aPage bindings.
	^ aPage