api - instantiation
buildDefault
	<return: #BrStencil>

	^ GtPageStencil new 
		values: self page snippets;
		stencil: GtSnippetContainerStencilBuilder new.