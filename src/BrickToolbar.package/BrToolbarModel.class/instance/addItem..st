adding
addItem: aBrToolbarItemModel
	self items add: aBrToolbarItemModel.
	self onItemAdded: aBrToolbarItemModel.