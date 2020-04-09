Extension { #name : #GtDocumentSnippet }

{ #category : #'*GToolkit-Playground-XDoc' }
GtDocumentSnippet class >> xdocSnippetMappingFor: aNeoJSONMapper [
	aNeoJSONMapper 
		for: self do: [ :mapping | 
			(mapping mapAccessor: #string to: #content) ]
]
