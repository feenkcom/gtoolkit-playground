initialization
newInEditorToolbar
	^ BlOverlayElement new
		attachTo: editorElement;
		layout: BlLinearLayout horizontal;
		addChild: self newHorizontalFlexibleSpaceElement;
		addChild: (BrToolbar new
			look: BrToolbarLook horizontal + BrLayoutLook new alignCenterRight;
			constraintsDo: [ :c | 
				c vertical matchParent ];
			addChild: self newInEditorButton)