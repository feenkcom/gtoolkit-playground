Class {
	#name : #GtPageLook,
	#superclass : #BrLook,
	#category : #'GToolkit-Playground-Page'
}

{ #category : #initialization }
GtPageLook >> initializeLook [
	super initializeLook.

	self widgetDo: [ :anElement | 
		anElement constraintsDo: [ :c | 
			c vertical matchParent. 
			c horizontal matchParent. ] ]
]
