api - instantiation
create
	<return: #BlElement>

	^ BlElement new
		look: GtPlaygroundSnippetContainterLook;
		addChild: self snippet asElement