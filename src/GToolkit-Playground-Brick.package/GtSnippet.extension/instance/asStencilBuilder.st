*GToolkit-Playground-Brick
asStencilBuilder
	"Return a stencil that knows how to display a snippet in Bloc"
	<return: #GtSnippetStencilBuilder>
	^ self asStencilBuilder: self stencilBuilderClass