accessing
toolbar
	<gtExample>
	| aToolbar |
	aToolbar := BrToolbar new.
	aToolbar look: BrToolbarLook.
	aToolbar addItem: self toolbarItemHello.
	aToolbar addItem: self toolbarItemGToolkit.
	self assert: aToolbar numberOfItems equals: 2.
	^ aToolbar