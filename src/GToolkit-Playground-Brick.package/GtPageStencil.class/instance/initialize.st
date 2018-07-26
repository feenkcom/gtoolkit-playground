initialization
initialize
	super initialize.
	values := #().
	stencil := [ :eachSnippet | BlElement new ] asStencil.