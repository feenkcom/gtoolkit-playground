api - instantiation
buildDefault
	<return: #BrStencil>

	^ GtPageStencil new 
		values: self page snippets;
		stencil: [ :eachSnippet | 
			(GtSnippetContainerStencilBuilder new snippet: eachSnippet) ].