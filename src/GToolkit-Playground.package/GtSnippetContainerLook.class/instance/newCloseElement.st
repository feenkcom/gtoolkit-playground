instance creation
newCloseElement
	"Instantiate and return a new element playing a role of an arrow
	used to show / hide a preview"
	<return: #BlElement>

	| anElement |
	anElement := self newPlusElement.
	anElement transform rotateBy: 45; apply.
	^ anElement.