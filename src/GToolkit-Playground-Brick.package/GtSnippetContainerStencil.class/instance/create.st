api - instantiation
create
	<return: #BlElement>

	^ BlElement new
		look: GtSnippetContainterLook;
		addChild: self child asElement