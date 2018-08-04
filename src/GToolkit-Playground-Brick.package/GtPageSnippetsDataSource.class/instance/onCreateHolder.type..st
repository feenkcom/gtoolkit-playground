instance creation
onCreateHolder: anInfiniteElement type: aSnippetType
	"Override to create an ElementHolder for an item type.
	use ===BlElementHolder of: element=== to create a holder for an element"
	<return: #GtSnippetElementHolder>

	^ aSnippetType newHolder