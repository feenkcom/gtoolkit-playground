Class {
	#name : #XdPlayBookJsonMapping,
	#superclass : #Object,
	#traits : 'TXdBasicJsonMapping',
	#classTraits : 'TXdBasicJsonMapping classTrait',
	#category : #'GToolkit-Playground-XDoc-Json'
}

{ #category : #'mapping - model' }
XdPlayBookJsonMapping class >> collectionOfPagesMappingFor: aNeoJSONMapper [
	aNeoJSONMapper
		for: #CollectionOfPages customDo: [ :mapping |
	      mapping listOfElementSchema: GtPlayPage ].
	self playPageMappingFor: aNeoJSONMapper.
]

{ #category : #'mapping - model' }
XdPlayBookJsonMapping class >> collectionOfSnippetsMappingFor: aNeoJSONMapper [
	aNeoJSONMapper
		for: #CollectionOfSnippets customDo: [ :mapping |
	      mapping reader: [ :jsonReader |
				jsonReader listClass streamContents: [ :stream |
					jsonReader parseListDo: [ | element |
						element := jsonReader nextAs: #SnippetTypeAndValue.
						stream nextPut: element ] ] ].
			mapping writer: [ :jsonWriter :list | 
				jsonWriter writeListStreamingDo: [ :listWriter |
					list do: [ :each | 
						each isUserSnippet ifTrue: [
							listWriter writeElement: each as: #SnippetTypeAndValue ] ] ] ] ].
	self snippetTypeNameAndValueMappingFor: aNeoJSONMapper.
]

{ #category : #'mapping - model' }
XdPlayBookJsonMapping class >> individualSnippetMappingsFor: aNeoJSONMapper [
	^ GtSnippet availableSnippetClasses do: [ :eachSnippetClass |
		eachSnippetClass xdocSnippetMappingFor: aNeoJSONMapper ]
]

{ #category : #'mapping - model' }
XdPlayBookJsonMapping class >> playBookMappingFor: aNeoJSONMapper [
	aNeoJSONMapper
		for: GtPlayBook do: [ :mapping |
	      (mapping mapAccessor: #pages) valueSchema: #CollectionOfPages ].
	self collectionOfPagesMappingFor: aNeoJSONMapper.
]

{ #category : #'mapping - model' }
XdPlayBookJsonMapping class >> playPageMappingFor: aNeoJSONMapper [
	aNeoJSONMapper
		for: GtPlayPage do: [ :mapping |
	      (mapping mapAccessor: #snippets) valueSchema: #CollectionOfSnippets ].
	self collectionOfSnippetsMappingFor: aNeoJSONMapper.
]

{ #category : #'api - convenience' }
XdPlayBookJsonMapping class >> readPlayBook: aJsonString [
	^ self 
		read: GtPlayBook
		withMapping: #playBookMappingFor: 
		from: aJsonString readStream
]

{ #category : #'api - convenience' }
XdPlayBookJsonMapping class >> readPlayPage: aJsonString [
	^ self 
		read: GtPlayPage 
		withMapping: #playPageMappingFor: 
		from: aJsonString readStream
]

{ #category : #'mapping - model' }
XdPlayBookJsonMapping class >> snippetTypeNameAndValueMappingFor: aNeoJSONMapper [
	aNeoJSONMapper
		for: #SnippetTypeAndValue customDo: [ :mapping |
	      mapping reader: [ :jsonReader | | aGtSnippet | 
					jsonReader parseMapKeysDo: [ :aKey | | anElementSchema |
						anElementSchema := GtSnippet availableSnippetClasses 
							detect: [ :each | each typeName asLowercase = aKey asLowercase ].
						self assert: anElementSchema isUserSnippet.
						self assert: aGtSnippet isNil.
						aGtSnippet := jsonReader nextAs: anElementSchema ].
					aGtSnippet ].
			mapping writer: [ :jsonWriter :object | 
				object isUserSnippet ifTrue: [ 
					(jsonWriter mappingFor: object class ifAbsent: [ nil ])
						ifNotNil: [ 
							jsonWriter writeMapStreamingDo: [ :mapWriter | 
								mapWriter writeKey: object typeName value: object ] ]						
					 ] ] ].
	self individualSnippetMappingsFor: aNeoJSONMapper.
]

{ #category : #'api - convenience' }
XdPlayBookJsonMapping class >> writePlayBook: aGtPlayBook [
	^ self 
		write: aGtPlayBook 
		mappedTo: #playBookMappingFor:
]

{ #category : #'api - convenience' }
XdPlayBookJsonMapping class >> writePlayPage: aGtPlayPage [
	^ self 
		write: aGtPlayPage 
		mappedTo: #playPageMappingFor:
]
