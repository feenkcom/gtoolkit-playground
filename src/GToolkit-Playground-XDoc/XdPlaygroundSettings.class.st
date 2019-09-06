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
	^ FileLocator localDirectory / 'xdocs'
]

{ #category : #accessing }
XdPlaygroundSettings class >> directory [
	directory ifNil: [ directory := self defaultDirectory ].
	directory ensureCreateDirectory.
	^ directory
]

{ #category : #accessing }
XdPlaygroundSettings class >> directory: anObject [
	directory := anObject
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
