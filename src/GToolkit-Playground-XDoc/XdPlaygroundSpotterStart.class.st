Class {
	#name : #XdPlaygroundSpotterStart,
	#superclass : #Object,
	#category : #'GToolkit-Playground-XDoc'
}

{ #category : #'gt-spotter' }
XdPlaygroundSpotterStart >> gtSpotterForXDocPlayBooksFor: aStep [
	<gtSearch>
	aStep listProcessor
		priority: 0;
		title: 'Playgrounds';
		items: [ XdPlaygroundSettings playBooks ];
		itemsLimit: Float infinity;
		itemName: [ :eachGtPlayBook | eachGtPlayBook string ];
		filter: GTFilterSubstring
]
