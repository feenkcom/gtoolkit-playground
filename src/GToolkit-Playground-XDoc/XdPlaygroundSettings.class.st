Class {
	#name : #XdPlaygroundSettings,
	#superclass : #Object,
	#classInstVars : [
		'directory'
	],
	#category : #'GToolkit-Playground-XDoc'
}

{ #category : #defaults }
XdPlaygroundSettings class >> defaultDirectory [ 
	| aDirectory |
	aDirectory := FileLocator localDirectory / 'xdocs'.
	aDirectory ensureCreateDirectory.
	^ aDirectory
]

{ #category : #accessing }
XdPlaygroundSettings class >> directory [
	directory isNil ifTrue: [ 
		directory := self defaultDirectory.
		"self initializeSettings" ].
	self 
		assert: [ directory exists ]
		description: [ 'The directory with playgrounds must exist' ].
	^ directory
]

{ #category : #accessing }
XdPlaygroundSettings class >> directory: aFileReference [
	self 
		assert: [ aFileReference asFileReference exists ] 
		description: [ 'The directory with playgrounds must exist' ].
	directory := aFileReference
]

{ #category : #initialization }
XdPlaygroundSettings class >> initializeSettings [
	Smalltalk 
		at: #SystemSettingsPersistence 
		ifPresent: [ :aClass | | aTree theNodes | 
			aTree := aClass default settingTree.
			theNodes := aTree deeplySelect: [ :node | node receiverPackage name beginsWith: 'GToolkit-Playground' ].
			aClass updateSettingNodes: theNodes ]
]

{ #category : #accessing }
XdPlaygroundSettings class >> playBooks [
	<return: #Array of: #GtPlayBook>
	"Used PlayBooks must be subscribed to external tools: #subscribeExternalTools"
	^ self xdocFiles 
		collect: [ :eachXdFile | 
			eachXdFile streamingStrategy zip members
				detect: [ :aMember | aMember fileName endsWith: XdConstants playBookExtension ]
				ifFound: [ :aPlayBookMember | 
					| aJsonString |
					aJsonString := aPlayBookMember contents asByteArray utf8Decoded.
					XdPlayBookJsonMapping readPlayBook: aJsonString ]
				ifNone: [ nil ] ]
		thenSelect: #isNotNil
]

{ #category : #settings }
XdPlaygroundSettings class >> storedPlaygroundsDirectoryOn: aBuilder [ 
	<systemsettings>
	
	(aBuilder setting: #xdStoredPlaygroundsDirectoryString)
		parent: #xdoc;
		target: self;
		type: #Directory;
		description: 'Local directory with stored Playgrounds in XDoc format';
		label: 'Directory with stored Playgrounds'

]

{ #category : #settings }
XdPlaygroundSettings class >> xdStoredPlaygroundsDirectoryString [
	^ self directory
]

{ #category : #settings }
XdPlaygroundSettings class >> xdStoredPlaygroundsDirectoryString: aString [
	^ self directory: aString
]

{ #category : #accessing }
XdPlaygroundSettings class >> xdocFileReferences [
	<return: #Array of: #FileReference>
	| allXdocFiles |
	allXdocFiles := self directory filesMatching: '*.' , XdConstants xdocExtension.
	allXdocFiles sort: [ :a :b | a modificationTime > b modificationTime ].
	^ allXdocFiles
]

{ #category : #accessing }
XdPlaygroundSettings class >> xdocFiles [
	<return: #Array of: #XdFile>
	^ self xdocFileReferences 
		collect: [ :eachFile | 
			XdUtility xdocFileFromFileReference: eachFile ]
		thenSelect: [ :eachFile | eachFile exists ]
]
