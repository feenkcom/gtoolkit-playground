Class {
	#name : #GtPageLook,
	#superclass : #BrLook,
	#category : #'GToolkit-Playground-Page'
}

{ #category : #initialization }
GtPageLook >> initialize [
	super initialize.
	self
		addChangeProperty: #(widget constraints vertical resizer)
		with: BlLayoutResizer matchParent.
	self
		addChangeProperty: #(widget constraints horizontal resizer)
		with: BlLayoutResizer matchParent
]
