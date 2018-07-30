*GToolkit-Playground-Commands
buildToolbarElementsUsing: aCommandActivator

	^{
		BrButton new
			look: BrMaterialToggleLabelledLook;
			action: [ aCommandActivator executeCommand ];
			"icon: self browserTabActionIcon"
			label: aCommandActivator commandDescription
	}