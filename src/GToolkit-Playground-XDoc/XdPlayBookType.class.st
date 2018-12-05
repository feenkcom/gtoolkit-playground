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

{ #category : #accessing }
XdPlayBookType class >> typeString [
	"Return a unique string that represents the type"
	<return: #String>
	^ 'gtoolkit-playbook'
]
