hooks
onItemAdded: aBrToolbarItemModel
	
	"aBrToolbarItemModel 
		when: BrTabSelectedEvent do: [ :anEvent | self onTabSelected: anEvent currentTarget ]."
	self flag: 'maybe hovering (mouse enter, mouse leave) events should be here?'.
	
	self notifyItemAdded: aBrToolbarItemModel.
	
	"if user adds a tab marked as selected we should force select it"
	"aBrToolbarItemModel isSelected
		ifTrue: [ ^ self onTabSelected: aBrToolbarItemModel ]."
	
	"the first added tab should be selected by default"
	"self tabs size = 1
		ifTrue: [ aBrToolbarItemModel select ]"