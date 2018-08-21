instance creation
newPlusElement
	<return: #BlElement>

	^ GtInspectorRoundButtonStencil small asElement
		icon: (GtInspectorPlusIconStencil add thickness: 0.5; radius: 4; asElement);
		yourself