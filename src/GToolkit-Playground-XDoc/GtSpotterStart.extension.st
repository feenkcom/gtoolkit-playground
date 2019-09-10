Extension { #name : #GtSpotterStart }

{ #category : #'*GToolkit-Playground-XDoc' }
GtSpotterStart >> gtSpotterForXDocPlayBooksFor: aStep [
	<gtSearch>
	aStep listProcessor
		priority: 100;
		title: 'Playgrounds';
		items: [ XdPlaygroundSettings xdocFiles ];
		itemName: [ :anXdFile | anXdFile manifest title ];
		previewObject: [ :anXdFile | GtPlayBook fromXdFile: anXdFile ];
		previewElement: [ :aGtPlayBook | 
			aGtPlayBook pages size = 1
				ifFalse: [ aGtPlayBook asElement ]
				ifTrue: [ aGtPlayBook pages first asElement ] ];
		itemsLimit: Float infinity;
		filter: XdPlayBookFilter;
		wantsToDisplayOnEmptyQuery: false;
		actLogic: [ :anXdFile :theStep |
			theStep exit.
			GtInspector openOnPlayBook: (GtPlayBook fromXdFile: anXdFile) ]
]
