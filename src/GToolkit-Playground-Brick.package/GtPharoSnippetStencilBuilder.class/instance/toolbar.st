private
toolbar
	<return: #BlElement or: nil>
	| aMenu anElements aContainer |
	aMenu := CmdMenu activatedBy: GtVerticalToolbarActivation.
	aMenu buildInContext: self context.
	anElements := aMenu buildToolbarElements.
	anElements ifEmpty: [ ^ nil ].
	aContainer := BlElement new
		layout: BlLinearLayout vertical alignTopCenter;
		constraintsDo: [ :c |
			c horizontal fitContent.
			c vertical matchParent ];
		clipChildren: false.
	aContainer addChildren: anElements.
	^ aContainer