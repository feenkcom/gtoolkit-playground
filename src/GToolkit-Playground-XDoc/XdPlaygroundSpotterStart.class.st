Class {
	#name : #XdPlaygroundSpotterStart,
	#superclass : #Object,
	#category : #'GToolkit-Playground-XDoc-Spotter'
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
XdPlaygroundSpotterStart >> gtSpotterForListOfPlayBooksFor: aStep [
	<gtSearch>
	aStep listProcessor
		priority: 18;
		title: 'List of Playgrounds';
		items: [  
			| aSnippet |
			aSnippet := String streamContents: [ :aStream | 
				aStream
					nextPutAll: XdPlaygroundSettings name;
					space;
					nextPutAll: #xdStoredPlaygroundsDirectory asString;
					space;
					nextPutAll: #filesMatching:;
					space;
					nextPutAll: '''*.';
					nextPutAll: XdConstants xdocExtension;
					nextPut: $' ].
			{ GtPlayBook newWithCodeSnippetContent: aSnippet } ];
		itemsLimit: Float infinity;
		itemName: [ :eachGtPlayBook | 'List of Playgrounds' ];
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
