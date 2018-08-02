api - instantiation
buildDefault
	<return: #BrStencil>
	BrSimpleList new 
		display: self page snippets;
		stencil: GtSnippetContainerStencilBuilder new.