Class {
	#name : #GtPageLook,
	#superclass : #BrLook,
	#category : #'GToolkit-Playground-Page'
}

{ #category : #initialization }
GtPageLook >> initialize [
	super initialize.
	changes
		add:
			(#(widget constraints vertical resizer)
				asBrLookPropertyChangeWithValue: BlLayoutResizer matchParent).
	changes
		add:
			(#(widget constraints horizontal resizer)
				asBrLookPropertyChangeWithValue: BlLayoutResizer matchParent)
]
