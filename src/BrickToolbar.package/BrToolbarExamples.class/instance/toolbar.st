accessing
toolbar
	<gtExample>
	| aToolbar aToolbarItem |
	aToolbar := BrToolbar new.
	aToolbar look: BrToolbarLook.
	aToolbarItem := BrToolbarItem new.
	aToolbarItem look: BrToolbarItemLook.
	aToolbarItem stencil: [ 
		BrButton new 
			look: BrMaterialToggleLabelledLook;
			label: 'Hello'; 
			action: [ self inform: 'Click on Hello' ] ].
	aToolbarItem := BrToolbarItem new.
	aToolbarItem look: BrToolbarItemLook.
	aToolbarItem stencil: [ 
		BrButton new 
			look: BrMaterialToggleLabelledLook;
			label: 'GToolkit'; 
			action: [ self inform: 'Click on GToolkit' ] ].
	aToolbar addItem: aToolbarItem.
	^ aToolbar