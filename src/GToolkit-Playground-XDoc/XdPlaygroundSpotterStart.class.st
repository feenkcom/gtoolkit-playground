Class {
	#name : #XdPlaygroundSpotterStart,
	#superclass : #Object,
	#category : #'GToolkit-Playground-XDoc'
}

{ #category : #'gt-spotter' }
XdPlaygroundSpotterStart >> gtSpotterForEmptyPlayBookFor: aStep [
	<gtSearch>
	aStep listProcessor
		priority: 10;
		title: 'Empty Playground';
		items: [ { GtPlayBook newDefault } ];
		itemsLimit: Float infinity;
		itemName: [ :eachGtPlayBook | 'Empty Playground' ];
		filter: GTFilterSubstring
]

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
