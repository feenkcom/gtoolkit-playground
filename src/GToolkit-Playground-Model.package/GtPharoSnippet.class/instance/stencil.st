accessing
stencil
	"Return a stencil that knows how to display a snippet in Bloc"
	<return: #BrStencil>
	^ GtPharoSnippetStencil new snippet: self