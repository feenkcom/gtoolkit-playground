converting
asElement
	<return: #BlElement>
	^ BlElement new
		look: GtPlayBookLook + BrLayoutLook linearVertical matchParent;
		viewModel: (GtPlayBookWidgetModel new playground: self)