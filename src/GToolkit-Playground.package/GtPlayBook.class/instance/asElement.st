converting
asElement
	<return: #BlElement>
	^ BlElement new
		look: GtPlayBookLook + BrLayoutLook linearVertical matchParent;
		viewModel: (GtPlayBookWidgetModel new playBook: self)