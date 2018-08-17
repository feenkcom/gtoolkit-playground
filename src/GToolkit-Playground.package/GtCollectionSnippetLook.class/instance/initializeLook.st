initialization
initializeLook
	super initializeLook.
	self availableSnippetClasses do: [ :eachSnippetClass | 
		| anItem |
		anItem := BrToolbarItem new.
		anItem look: BrToolbarItemLook + BrMouseHoverLook + BrMouseClickLook.
		anItem stencil: [ 
			| aButton |
			aButton := BrButton new.
			aButton look: BrLabelLook + BrMaterialButtonLayoutLook + BrMaterialRoundedLook + BrMaterialToggleBackgroundLook.
			aButton label: eachSnippetClass new typeName.
			aButton action: [ 
				self addSnippet: eachSnippetClass ] ].
		toolbar addItem: anItem ].
	self widgetContent addChild: toolbar as: #toobar.