api - instantiation
create
	<return: #BrSimpleList>

	^ BrSimpleList new 
		display: self page snippets;
		stencil: [ :eachSnippet | 
			(GtPlaygroundSnippetContainerStencil new snippet: eachSnippet) asElement ].