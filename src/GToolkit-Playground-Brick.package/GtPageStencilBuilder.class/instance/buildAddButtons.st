private - commands
buildAddButtons

	| aToolbar |
	aToolbar := BrToolbar new.
	aToolbar look: BrToolbarLook horizontal.
	self availableSnippets do: [ :eachSnippetClass | 
		| anItem |
		anItem := BrToolbarItem new.
		anItem look: BrToolbarItemLook + BrMouseHoverLook + BrMouseClickLook.
		anItem stencil: [ 
			| aButton |
			aButton := BrButton new.
			aButton look: BrMaterialToggleLabelledLook.
			aButton label: eachSnippetClass new typeName.
			aButton action: [ 
				self page addSnippet: eachSnippetClass new ] ].
		aToolbar addItem: anItem ].
	^ aToolbar