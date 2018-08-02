api - instantiation
buildDefault
	<return: #BrStencil>
	^ BrSimpleList new 
		display: (self page snippets copyWith: self buildAddButtons);
		stencil: GtSnippetContainerStencilBuilder new.