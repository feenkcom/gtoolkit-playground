accessing
removeItemsOnButtonClick
	<gtExample>
	<label: 'Add toolbar items on a button click'>
	| aToolbar aToolbarItem |
	aToolbar := self addItemsOnButtonClick.
	aToolbarItem := self toolbarItem.
	aToolbarItem stencil: [ 
		BrButton new 
			look: BrMaterialToggleLabelledLook;
			label: 'Remove'; 
			action: [ | aSize anIndex aModel |
				aSize := aToolbar numberOfItems.
				anIndex := ((aSize - 3) max: 0) atRandom + 3.
				anIndex <= aSize ifTrue: [ 
					aModel := aToolbar items at: anIndex.
					aModel widgetDo: [ :aWidget |
						aToolbar removeItem: aWidget.
						self inform: 'Item at index ', anIndex asString, ' removed'.
						self assert: aToolbar numberOfItems equals: aSize - 1 ] ] ] ].
	aToolbar addItem: aToolbarItem.
	self assert: aToolbar numberOfItems equals: 2.
	^ aToolbar