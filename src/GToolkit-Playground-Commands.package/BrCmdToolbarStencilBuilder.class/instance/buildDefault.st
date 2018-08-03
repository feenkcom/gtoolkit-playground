building
buildDefault
	<return: #BlElement>
	| aMenu anElements aToolbar |
	aMenu := CmdMenu activatedBy: self activationClass.
	aMenu buildInContext: self context.
	anElements := aMenu buildToolbarItems.
	anElements do: [ :eachElement | 
		eachElement look: BrToolbarItemLook + BrMouseHoverLook + BrMouseClickLook ].
	aToolbar := BrToolbar new.
	aToolbar look: BrToolbarLook vertical.
	aToolbar addChildren: anElements.
	^ aToolbar