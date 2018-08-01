*GToolkit-Playground-Commands
buildToolbarItemsUsing: aCommandActivator

	^{
		BrToolbarItem new
			stencil: [ 
				BrButton new
					look: BrMaterialToggleLabelledLook;
					action: [ aCommandActivator executeCommand ];
					"icon: self browserTabActionIcon"
					label: aCommandActivator commandDescription ]
	}