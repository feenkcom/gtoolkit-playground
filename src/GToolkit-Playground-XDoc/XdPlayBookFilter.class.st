Class {
	#name : #XdPlayBookFilter,
	#superclass : #GtFilterSubstring,
	#category : #'GToolkit-Playground-XDoc-Spotter'
}

{ #category : #public }
XdPlayBookFilter >> gtListFilter [
	^ GtFilterSubstring new
]

{ #category : #'private-model' }
XdPlayBookFilter >> itemFilterNameFor: anXdFile [
	^ anXdFile manifest description
]
