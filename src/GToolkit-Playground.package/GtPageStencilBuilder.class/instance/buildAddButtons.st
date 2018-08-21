private - commands
buildAddButtons
	| aToolbar |
	aToolbar := BrToolbar new.
	aToolbar look: BrToolbarLook horizontal.

	self availableSnippets do: [ :eachSnippetClass | 
		| aButton |
	
		aButton := BrButton new.
		aButton look: BrMaterialToggleLabelledLook.
		aButton label: eachSnippetClass new typeName.
		aButton action: [ self page addSnippet: eachSnippetClass new ].
			
		aToolbar addItem: aButton ].
	^ aToolbar