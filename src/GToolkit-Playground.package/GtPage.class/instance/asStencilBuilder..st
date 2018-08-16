as yet unclassified
asStencilBuilder: aStencilBuilderClass
	"Return a stencil builder that knows how to build a page stencil"
	<return: #GtPageStencilBuilder>
	^ aStencilBuilderClass new page: self