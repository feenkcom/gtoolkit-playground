as yet unclassified
snippetType
	"Return a unique snippet item type per snippet class for the infinite list element.
	My subclasses may override me if they need a deeper customisation of element holder creation and binding logic"
	<return: #GtSnippetType>

	^ GtSnippetType of: self