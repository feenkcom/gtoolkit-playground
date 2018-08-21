instance creation
newCloseElement
	<return: #BlElement>

	^ GtInspectorRoundButtonStencil small asElement
		icon: (GtInspectorPlusIconStencil close thickness: 0.5; radius: 4; asElement);
		yourself