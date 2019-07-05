Class {
	#name : #GtSnippetRenameRequestedAnnoucement,
	#superclass : #GtSnippetAnnoucement,
	#instVars : [
		'variableName',
		'interestedSnippets'
	],
	#category : #'GToolkit-Playground-Announcements'
}

{ #category : #accessing }
GtSnippetRenameRequestedAnnoucement >> interestedSnippets [
	^ interestedSnippets
]

{ #category : #accessing }
GtSnippetRenameRequestedAnnoucement >> interestedSnippets: anObject [
	interestedSnippets := anObject
]

{ #category : #accessing }
GtSnippetRenameRequestedAnnoucement >> variableName [
	^ variableName
]

{ #category : #accessing }
GtSnippetRenameRequestedAnnoucement >> variableName: aString [
	variableName := aString
]
