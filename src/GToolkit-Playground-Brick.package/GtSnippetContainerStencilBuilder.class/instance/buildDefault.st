api - instantiation
buildDefault
	<return: #BlElement>
	^ BlElement new
		look: GtSnippetContainerLook;
		addChild: self rowValue asElement