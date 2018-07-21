api - instantiation
create
	<return: #BrSimpleList>

	^ BrSimpleList new 
		display: self page snippets;
		stencil: [ :eachSnippet | 
			(GtSnippetContainerStencil new snippet: eachSnippet) asElement ].