Class {
	#name : #XdPlayBookFilter,
	#superclass : #GTFilterSubstring,
	#category : #'GToolkit-Playground-XDoc'
}

{ #category : #public }
XdPlayBookFilter >> gtListFilter [
	^ GTFilterSubstring new
]

{ #category : #'private-model' }
XdPlayBookFilter >> itemFilterNameFor: anXdFile [
	^ anXdFile manifest description
]
