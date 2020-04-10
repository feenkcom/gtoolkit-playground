Extension { #name : #GtCoderSnippet }

{ #category : #'*GToolkit-Playground-XDoc' }
GtCoderSnippet class >> xdocSnippetMappingFor: aNeoJSONMapper [
	aNeoJSONMapper 
		for: self do: [ :mapping | 
			(mapping mapAccessor: #sourceCode to: #source_code) ]
]
