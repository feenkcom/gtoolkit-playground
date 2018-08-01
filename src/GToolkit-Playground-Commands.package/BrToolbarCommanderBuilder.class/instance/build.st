building
build
	<return: #BlElement>
	| aMenu anElements aContainer |
	aMenu := CmdMenu activatedBy: self activationClass.
	aMenu buildInContext: self context.
	anElements := aMenu buildToolbarItems.
	anElements do: [ :eachElement | 
		eachElement look: BrToolbarItemLook ].
	aContainer := BrToolbar new.
	aContainer look: BrToolbarLook vertical.
	aContainer addChildren: anElements.
	^ aContainer