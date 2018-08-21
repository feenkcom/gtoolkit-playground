I am a look for a collection snippet. I provide a way to select the type of the snippet to create, for examples pharo code or url.

I am designed to work together with ${class:GtSnippetWidgetModel}$ and can be applied on the ${class:GtSnippetElement}$

Example:
[[[
GtSnippetElement new
	look: GtCollectionSnippetLook + BrLayoutLook linearVertical vFitContent hMatchParent
]]]
