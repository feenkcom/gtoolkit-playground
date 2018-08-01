accessing
toolbarItem
	<gtExample>
	<label: 'Basic toolbar item'>
	| aToolbarItem |
	aToolbarItem := BrToolbarItem new.
	aToolbarItem look: BrToolbarItemLook.
	self assert: aToolbarItem viewModel stencil notNil.
	^ aToolbarItem