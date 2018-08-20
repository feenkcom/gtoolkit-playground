model - page and book
page
	<gtExample>
	<label: 'A basic playground page with one Pharo snippet'>
	| aPage |
	aPage := GtPlayPage new.
	self assert: aPage snippets size equals: 1.
	self assert: aPage snippets first typeName equals: 'collection'.
	self assert: aPage bindings class equals: GtPlaygroundBindings.
	^ aPage