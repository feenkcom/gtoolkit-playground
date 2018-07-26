api - instantiation
buildDefault
	<return: #BrStencil>

	^ GtSnippetContainerStencil new
		child: self snippet asStencilBuilder