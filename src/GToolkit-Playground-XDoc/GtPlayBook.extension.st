Extension { #name : #GtPlayBook }

{ #category : #'*GToolkit-Playground-XDoc' }
GtPlayBook >> gtActionXDocSpotterFor: anAction [
	<gtAction>
	^ anAction explicit
		forPlayground;
		stencil: [ :aBrTab | self xdocPlayBookSpotterIn: aBrTab ]
]

{ #category : #'*GToolkit-Playground-XDoc' }
GtPlayBook >> gtActionXdocFor: anAction [
	"<gtAction>"
	^ anAction dropdown 
		forPlayground;
		icon: BrGlamorousIcons menu;
		help: 'Stored XDoc Playgrounds';
		popup: [ self xdocPlayBookListElement ]
]

{ #category : #'*GToolkit-Playground-XDoc' }
GtPlayBook >> playBookNameFrom: eachXdocFile [
	| anXdFile |
	anXdFile := self xdocFileFrom: eachXdocFile.
	^ anXdFile manifest title 
		ifEmpty: [ eachXdocFile basename asRopedText ]
		ifNotEmpty: #asRopedText.
]

{ #category : #'*GToolkit-Playground-XDoc' }
GtPlayBook >> readPlayBookFrom: eachFile [
	| aPlayBookMember aXdFile aJsonString aPlayBook |
	aXdFile := self xdocFileFrom: eachFile.
	aXdFile exists ifFalse: [ ^ nil ].
	aPlayBookMember := aXdFile streamingStrategy zip members
		detect:
			[ :aMember | aMember fileName endsWith: XdConstants playBookExtension ].
	aJsonString := aPlayBookMember contents asByteArray utf8Decoded.
	aPlayBook := XdPlayBookJsonMapping readPlayBook: aJsonString.
	aPlayBook subscribeExternalTools.
	^ aPlayBook
]

{ #category : #'*GToolkit-Playground-XDoc' }
GtPlayBook >> saveToXDoc [
	self storePlayBookInto: (XdFile new
		streamingStrategy: XdStreamingStrategy bytes).
]

{ #category : #'*GToolkit-Playground-XDoc' }
GtPlayBook >> storePlayBookInto: aXdFile [ 
	| aText aTitle aDescription |
	aText := String streamContents: [ :aStream |
		self pages do: [ :eachPage | 
			eachPage snippets do: [ :eachSnippet |
				eachSnippet isUserSnippet ifTrue: [ 
					aStream nextPutAll: eachSnippet text asString; cr ] ] ] ].
	aTitle := aText first: (aText size min: 40).
	aTitle := aTitle replace: [ :eachCharacter | 
		eachCharacter isSeparator ifTrue: [ Character space ] ifFalse: [ eachCharacter ] ]. 
	aDescription := aText first: (aText size min: 100).

	aXdFile writer
		authorName: Author name;
		title: aTitle;
		description: aDescription;
		playbook: self;
		write
]

{ #category : #'*GToolkit-Playground-XDoc' }
GtPlayBook >> xdocFileFrom: eachFile [
	^ XdReader new
		streamingStrategy: (XdStreamingStrategy file: eachFile);
		onError: [ :anError | XdFile empty ];
		read
]

{ #category : #'*GToolkit-Playground-XDoc' }
GtPlayBook >> xdocPlayBookListElement [
	| aFileReference aList allXdocFiles |
	aFileReference := FileLocator localDirectory / 'xdocs'.
	aFileReference ensureCreateDirectory.
	allXdocFiles := aFileReference
		filesMatching: '*.' , XdConstants xdocExtension.
	allXdocFiles
		sort: [ :a :b | a modificationTime > b modificationTime ].
	aList := BrSimpleList new.
	aList
		stencil: [ :eachXdocFile :index | 
			BlTextElement new
				text: (self playBookNameFrom: eachXdocFile);
				padding: (BlInsets all: 5);
				when: BlClickEvent
					do: [ :anEvent | 
					| aNewPlayBook |
					anEvent consumed: true.
					aList selectOne: index.
					aNewPlayBook := self readPlayBookFrom: eachXdocFile.
					aNewPlayBook
						ifNotNil: [ self
								announce:
									(GtPlayBookChangeRequestedAnnoucement new
										oldPlayBook: self;
										newPlayBook: aNewPlayBook) ] ] ];
		display: allXdocFiles;
		padding: (BlInsets all: 5);
		hFitContent;
		vFitContent.
	^ aList
]

{ #category : #'*GToolkit-Playground-XDoc' }
GtPlayBook >> xdocPlayBookSpotterIn: aBrTab [
	| aSpotterDropdown |
	aSpotterDropdown := BrDropdown new.
	aSpotterDropdown
		look: (BrGlamorousDropdownLook new backgroundPaint: BrGlamorousColors secondaryHeaderBackgroundColor);
		toggle: [
			BrButton new
				look: (BrGlamorousButtonWithIconLook + BrGlamorousDropdownToggleLook);
				icon: BrGlamorousIcons search asElement;
				label: 'Playground History' ];
		popup: [
			| model |
			model := GtSpotter new initializeWith: XdPlaygroundSpotterStart new.
			model announcer
				when: GtSpotterActOn
				do: [ :anEvent |
					| aNewPlayBook |
					aNewPlayBook := anEvent realItem.
					anEvent actedUpon: true.
					aNewPlayBook subscribeExternalTools.
					self announce: (GtPlayBookChangeRequestedAnnoucement new
						oldPlayBook: self;
						newPlayBook: aNewPlayBook) ].
			model announcer
				when: GtSpotterExitAnnouncement
				do: [ :e | aSpotterDropdown collapse ].
			GtSpotterElementWithPreview new
				spotterModel: model;
				size: 600@400;
				margin: (BlInsets all: 1);
				geometry: (BlRectangle cornerRadius: 4);
				yourself ].
		
	^ aSpotterDropdown
]

{ #category : #'*GToolkit-Playground-XDoc' }
GtPlayBook >> xdocSaving [
	<playBookHandler>
	| aXdFile aFileReference |
	aFileReference := FileLocator localDirectory / 'xdocs' / 
		(XdUtility playgroundFileNameFromDateAndTime: DateAndTime now).
	aFileReference parent ensureCreateDirectory. 
	aXdFile := XdFile new.
	aXdFile streamingStrategy: (XdStreamingStrategy file: aFileReference).
	self 
		subscribe: GtPageSnippetEvaluatedAnnouncement 
		do: [ :anAnnuncement | self storePlayBookInto: aXdFile ]
]
