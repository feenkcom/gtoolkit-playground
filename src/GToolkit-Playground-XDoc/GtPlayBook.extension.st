Extension { #name : #GtPlayBook }

{ #category : #'*GToolkit-Playground-XDoc' }
GtPlayBook >> gtActionXDocSpotterFor: anAction [
	<gtAction>
	^ anAction explicit
		forPlayground;
		stencil: [ :aBrTab | self xdocPlayBookSpotterIn: aBrTab ]
]

{ #category : #'*GToolkit-Playground-XDoc' }
GtPlayBook >> saveToXDoc [
	self storePlayBookInto: (XdFile new
		streamingStrategy: XdStreamingStrategy bytes).
]

{ #category : #'*GToolkit-Playground-XDoc' }
GtPlayBook >> storePlayBookInto: aXdFile [ 
	| aText aTitle aDescription |
	XdPlaygroundSettings directory isWritable ifFalse: [ ^self ].
	aText := self string.
	aTitle := aText first: (aText size min: 60).
	aTitle := aTitle replace: [ :eachCharacter | 
		eachCharacter isSeparator ifTrue: [ Character space ] ifFalse: [ eachCharacter ] ]. 
	aDescription := aText.

	aXdFile writer
		authorName: Author name;
		title: aTitle;
		description: aDescription;
		playbook: self;
		write
]

{ #category : #'*GToolkit-Playground-XDoc' }
GtPlayBook >> xdocPlayBookSpotterIn: aBrTab [
	^ GtSpotterDropdownButtonStencil new
		id: GtPlaygroundSpotterButtonId;
		receiver: XdPlaygroundSpotterStart selector: #new;
		tooltip: 'Search Playground History';
		actOn: [ :anActOnEvent :anXdFile :theButton | 
			| aNewPlayBook |
			aNewPlayBook := (anXdFile isKindOf: XdFile) 
				ifTrue: [ GtPlayBook fromXdFile: anXdFile ]
				ifFalse: [ anXdFile ].
			aNewPlayBook subscribeExternalTools.
			self announce: (GtPlayBookChangeRequestedAnnoucement new
				oldPlayBook: self;
				newPlayBook: aNewPlayBook).
			anActOnEvent beActed ];
		asElement.
]

{ #category : #'*GToolkit-Playground-XDoc' }
GtPlayBook >> xdocSaving [
	<playBookHandler>
	| aXdFile aFileReference |
	aFileReference := XdPlaygroundSettings directory
		/ (XdUtility playgroundFileNameFromDateAndTime: DateAndTime now).
	aXdFile := XdFile new.
	aXdFile streamingStrategy: (XdStreamingStrategy file: aFileReference).
	self
		when: GtPageSnippetEvaluatedAnnouncement
		do: [ :anAnnuncement | self storePlayBookInto: aXdFile ]
]
