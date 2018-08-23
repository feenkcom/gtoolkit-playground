initialization
newProgressElement
	^ BlOverlayElement new
		background: Color white;
		addChild: self newProgressIndicatorElement as: #progress;
		look: BrProgressLook;
		viewModel: BrProgressModel new;
		attachTo: editorElement.