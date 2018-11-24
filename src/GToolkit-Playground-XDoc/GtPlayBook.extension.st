Extension { #name : #GtPlayBook }

{ #category : #'*GToolkit-Playground-XDoc' }
GtPlayBook >> gtActionXdocFor: anAction [
	<gtAction>
	^ anAction dropdown 
		category: #playground;
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
	allXdocFiles := aFileReference filesMatching: '*.', XdConstants xdocExtension.
	allXdocFiles sort: [ :a :b | a modificationTime > b modificationTime ].
	aList := BrSimpleList new.
	aList 
		stencil: [ :eachXdocFile :index |
			BlTextElement new
				text: (self playBookNameFrom: eachXdocFile);
				constraintsDo: [ :c | c horizontal matchParent ];
				padding: (BlInsets all: 5);
				when: BlClickEvent do: [ :anEvent  |
					| aNewPlayBook |
					anEvent consumed: true.
					aList selectOne: index.
					aNewPlayBook := self readPlayBookFrom: eachXdocFile.
					aNewPlayBook ifNotNil: [  
						self announce: (GtPlayBookChangeRequestedAnnoucement new 
							oldPlayBook: self; 
							newPlayBook: aNewPlayBook) ] ] ];
		display: allXdocFiles;
		constraintsDo: [ :c | 
			c padding: (BlInsets top: 10).
			c vertical exact: 300.
			c horizontal exact: 200 ].
	^ aList
]

{ #category : #'*GToolkit-Playground-XDoc' }
GtPlayBook >> xdocSaving [
	<playBookHandler>
	| anXdocPlaybookHandler aFileReference |
	aFileReference := FileLocator localDirectory / 'xdocs' / 
		(XdUtility playgroundFileNameFromDateAndTime: DateAndTime now).
	aFileReference parent ensureCreateDirectory. 
	anXdocPlaybookHandler := XdFile new.
	anXdocPlaybookHandler streamingStrategy: (XdStreamingStrategy file: aFileReference).
	self 
		subscribe: GtPageSnippetEvaluatedAnnouncement 
		do: [ :anAnnuncement | self storePlayBookInto: anXdocPlaybookHandler ]
]
