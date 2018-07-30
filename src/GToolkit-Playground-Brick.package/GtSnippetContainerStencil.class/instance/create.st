api - instantiation
create
	<return: #BlElement>

	^ BlElement new
		look: GtSnippetContainerLook;
		addChild: self child asElement