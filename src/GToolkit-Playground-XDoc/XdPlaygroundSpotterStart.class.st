Class {
	#name : #XdPlaygroundSpotterStart,
	#superclass : #Object,
	#category : #'GToolkit-Playground-XDoc'
}

{ #category : #printing }
XdPlaygroundSpotterStart >> gtDisplayString [
	^ 'Saved Playgrounds'
]

{ #category : #'gt-spotter' }
XdPlaygroundSpotterStart >> gtSpotterForEmptyPlayBookFor: aStep [
	<gtSearch>
	aStep listProcessor
		priority: 10;
		title: 'Empty Playground';
		items: [ { GtPlayBook newDefault } ];
		itemsLimit: Float infinity;
		itemName: [ :eachGtPlayBook | 'Empty Playground' ];
		previewElement: [ :aGtPlayBook | 
			aGtPlayBook pages size = 1
				ifFalse: [ aGtPlayBook asElement ]
				ifTrue: [ aGtPlayBook pages first asElement ] ];
		filter: GTFilterSubstring
]

{ #category : #'gt-spotter' }
XdPlaygroundSpotterStart >> gtSpotterForXDocPlayBooksFor: aStep [
	<gtSearch>
	aStep listProcessor
		priority: 0;
		title: 'Playgrounds';
		items: [ XdPlaygroundSettings xdocFiles ];
		itemName: [ :anXdFile | anXdFile manifest title ];
		previewObject: [ :anXdFile | GtPlayBook fromXdFile: anXdFile ];
		previewElement: [ :aGtPlayBook | 
			aGtPlayBook pages size = 1
				ifFalse: [ aGtPlayBook asElement ]
				ifTrue: [ aGtPlayBook pages first asElement ] ];
		itemsLimit: Float infinity;
		filter: XdPlayBookFilter 
]
