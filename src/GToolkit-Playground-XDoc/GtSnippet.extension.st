Extension { #name : #GtSnippet }

{ #category : #'*GToolkit-Playground-XDoc' }
GtSnippet class >> xdocSnippetMappingFor: aNeoJSONMapper [
	"define a NeoJSON mapping that is used to read and write JSON snippet representations"
	^ self subclassResponsibility
]
