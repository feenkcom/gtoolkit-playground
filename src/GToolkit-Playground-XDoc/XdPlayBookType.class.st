Class {
	#name : #XdPlayBookType,
	#superclass : #XdType,
	#category : #'GToolkit-Playground-XDoc-Model'
}

{ #category : #testing }
XdPlayBookType class >> matchesMimeType: aZnMimeType [
	"Return true if the document type is equivalent to the Zinc MIME type"
	<return: #Boolean>
	^ aZnMimeType matches: GtFilePlayBookTypeResolver mimeType
]

{ #category : #actions }
XdPlayBookType class >> openDocument: aXdDocument ofXdFileInPharo: aXdFile [ 
	| theAttachments aMember aPlayBook |
	self
		assert: [ aXdDocument notNil ] 
		description: [ 'XDoc document must be non-nil' ].
	self
		assert: [ aXdFile notNil ] 
		description: [ 'XDoc file must be non-nil' ].
	self
		assert: [ aXdFile exists ] 
		description: [ 'XDoc file must exist' ].
	theAttachments := aXdFile manifest attachmentsForDocument: aXdDocument.
	aMember := aXdFile memberNamed: theAttachments first fileName.
	aPlayBook := XdPlayBookJsonMapping readPlayBook: aMember gtContents.
	^ GtInspector openOnPlayBook: aPlayBook
]

{ #category : #accessing }
XdPlayBookType class >> typeString [
	"Return a unique string that represents the type"
	<return: #String>
	^ 'gtoolkit-playbook'
]
