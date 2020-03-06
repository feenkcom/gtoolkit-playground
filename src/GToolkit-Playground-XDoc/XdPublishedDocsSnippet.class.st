Class {
	#name : #XdPublishedDocsSnippet,
	#superclass : #GtSnippet,
	#category : #'GToolkit-Playground-XDoc'
}

{ #category : #accessing }
XdPublishedDocsSnippet class >> typeName [
	<return: #String>
	"Return a playground snippet type name.
	It should be an unique name among all playground snippet types."
	^ 'Published XDocs'
]

{ #category : #converting }
XdPublishedDocsSnippet >> asElement [
	| aList |
	aList := BrColumnedList new.
	aList display: [ XdClient new downloadList ].
	aList column
		title: 'Item';
		stencil: [ :anXdFileInfo :index | 
			BrLabel new 
				look: BrGlamorousListLabelLook;
				text: anXdFileInfo titleAndAuthor;
				padding: (BlInsets top: 3 left: 10 bottom: 3 right: 0);
				hMatchParent
			 ].
	"aList look: BrShadowLook."
	aList background: Color white.
	aList addEventHandler: (GtInspectorListToSelectHandler new
		transformation: [ :anXdFileInfo | 
			XdClient new downloadXDocUsingFileInfo: anXdFileInfo ]).
	aList constraintsDo: [ :c | 
		c padding: (BlInsets top: 10 bottom: 10).
		c horizontal matchParent.
		c vertical exact: 150 ].
	^ aList
]

{ #category : #converting }
XdPublishedDocsSnippet >> asStencilBuilder [
	^ self
]

{ #category : #'api - instantiation' }
XdPublishedDocsSnippet >> bind: aSnippet to: aSnippetElement [
]
