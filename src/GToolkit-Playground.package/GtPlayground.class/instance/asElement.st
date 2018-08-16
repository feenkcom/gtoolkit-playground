converting
asElement
	<return: #BlElement>
	^ BlElement new
		look: GtPlaygroundLook + BrLayoutLook linearVertical matchParent;
		viewModel: (GtPlaygroundWidgetModel new playground: self)