Class {
	#name : #XdPlaygroundExamples,
	#superclass : #Object,
	#traits : 'XdManifestJsonMappingTrait + XdConstantsTrait',
	#classTraits : 'XdManifestJsonMappingTrait classTrait + XdConstantsTrait classTrait',
	#category : #'GToolkit-Playground-XDoc-Examples'
}

{ #category : #playbook }
XdPlaygroundExamples >> playbook [
	<gtExample>
	
	| aPlaybook |
	aPlaybook := GtPlayBook newDefault.
	aPlaybook pages first snippets first sourceCode: '1+2'.
	^ aPlaybook.
]

{ #category : #reading }
XdPlaygroundExamples >> readPlaybookDocument [
	<gtExample>
	| aWrittenXdFile aReader aXdReadFile aZip aPlayBookZipMember |
	aWrittenXdFile := self writePlaybookDocument.
	aReader := self reader.
	aXdReadFile := aReader
		streamingStrategy: aWrittenXdFile streamingStrategy;
		read.
	self assert: aXdReadFile notNil.
	self assert: aXdReadFile manifest notNil.
	self assert: aXdReadFile manifest documents size equals: 1.
	self
		assert: aXdReadFile manifest documents first type
		equals: XdType playbook.
	self
		assert: aXdReadFile manifest documents first components size
		equals: 1.
	self
		assert: aXdReadFile manifest documents first components first link
		equals: '1'.
	self assert: aXdReadFile manifest attachments size equals: 1.
	self assert: aXdReadFile manifest attachments first id equals: '1'.
	self
		assert: aXdReadFile manifest attachments first fileName
		equals: 'main.playbook'.
	self
		assert: aXdReadFile manifest attachments first fileSize
		equals: 58.
	self assert: aXdReadFile streamingStrategy notNil.
	self assert: aXdReadFile exists.
	self assert: aXdReadFile streamingStrategy zip members size equals: 3.
	aZip := aXdReadFile streamingStrategy zip.
	self assert: aZip members size equals: 3.
	aPlayBookZipMember := aZip members detect: [ :eachMember | 
		eachMember fileName endsWith: self constants playBookExtension ].
	self 
		assert: aPlayBookZipMember contents asByteArray utf8Decoded 
		equals: '{"pages":[{"snippets":[{"Pharo":{"source_code":"1+2"}}]}]}'.	
	^ aXdReadFile
	
]

{ #category : #reading }
XdPlaygroundExamples >> readPlaybookDocumentFromFile [
	<gtExample>
	| aWrittenXdFile aReader aXdReadFile aZip aPlayBookZipMember |
	aWrittenXdFile := self writePlaybookDocumentToFile.
	aReader := self reader.
	aXdReadFile := aReader
		streamingStrategy: aWrittenXdFile streamingStrategy;
		read.
	self assert: aXdReadFile notNil.
	self assert: aXdReadFile manifest notNil.
	self assert: aXdReadFile manifest documents size equals: 1.
	self
		assert: aXdReadFile manifest documents first type
		equals: XdType playbook.
	self
		assert: aXdReadFile manifest documents first components size
		equals: 1.
	self
		assert: aXdReadFile manifest documents first components first link
		equals: '1'.
	self assert: aXdReadFile manifest attachments size equals: 1.
	self assert: aXdReadFile manifest attachments first id equals: '1'.
	self
		assert: aXdReadFile manifest attachments first fileName
		equals: 'main.playbook'.
	self
		assert: aXdReadFile manifest attachments first fileSize
		equals: 58.
	self assert: aXdReadFile streamingStrategy notNil.
	self assert: aXdReadFile exists.
	self assert: aXdReadFile streamingStrategy zip members size equals: 3.
	aZip := aXdReadFile streamingStrategy zip.
	self assert: aZip members size equals: 3.
	aPlayBookZipMember := aZip members detect: [ :eachMember | 
		eachMember fileName endsWith: self constants playBookExtension ].
	self 
		assert: aPlayBookZipMember contents asByteArray utf8Decoded 
		equals: '{"pages":[{"snippets":[{"Pharo":{"source_code":"1+2"}}]}]}'.	
	^ aXdReadFile
	
]

{ #category : #reading }
XdPlaygroundExamples >> readPlaybookDocumentFromFileOnDisk [
	<gtExample>
	| aWrittenXdFile aReader aXdReadFile aZip aPlayBookZipMember |
	aWrittenXdFile := self writePlaybookDocumentToFileOnDisk.
	aReader := self reader.
	aXdReadFile := aReader
		streamingStrategy: aWrittenXdFile streamingStrategy;
		read.
	self assert: aXdReadFile notNil.
	self assert: aXdReadFile manifest notNil.
	self assert: aXdReadFile manifest documents size equals: 1.
	self
		assert: aXdReadFile manifest documents first type
		equals: XdType playbook.
	self
		assert: aXdReadFile manifest documents first components size
		equals: 1.
	self
		assert: aXdReadFile manifest documents first components first link
		equals: '1'.
	self assert: aXdReadFile manifest attachments size equals: 1.
	self assert: aXdReadFile manifest attachments first id equals: '1'.
	self
		assert: aXdReadFile manifest attachments first fileName
		equals: 'main.playbook'.
	self
		assert: aXdReadFile manifest attachments first fileSize
		equals: 58.
	self assert: aXdReadFile streamingStrategy notNil.
	self assert: aXdReadFile exists.
	self assert: aXdReadFile streamingStrategy zip members size equals: 3.
	aZip := aXdReadFile streamingStrategy zip.
	self assert: aZip members size equals: 3.
	aPlayBookZipMember := aZip members detect: [ :eachMember | 
		eachMember fileName endsWith: self constants playBookExtension ].
	self 
		assert: aPlayBookZipMember contents asByteArray utf8Decoded 
		equals: '{"pages":[{"snippets":[{"Pharo":{"source_code":"1+2"}}]}]}'.	
	^ aXdReadFile
	
]

{ #category : #accessing }
XdPlaygroundExamples >> reader [
	<gtExample>
	^ XdReaderWriterExamples new reader
]

{ #category : #writing }
XdPlaygroundExamples >> writePlaybookDocument [

	<gtExample>
	| aWriter aXdFile |
	aWriter := self writer.
	aXdFile := aWriter
		streamingStrategy: XdStreamingStrategy bytes;
		playbook: self playbook;
		write.
	self assert: aXdFile notNil.
	self assert: aXdFile manifest notNil.
	self assert: aXdFile manifest documents size equals: 1.
	self
		assert: aXdFile manifest documents first type
		equals: XdType playbook.
	self
		assert: aXdFile manifest documents first components size
		equals: 1.
	self
		assert: aXdFile manifest documents first components first link
		equals: '1'.
	self assert: aXdFile manifest attachments size equals: 1.
	self assert: aXdFile manifest attachments first id equals: '1'.
	self
		assert: aXdFile manifest attachments first fileName
		equals: 'main.playbook'.
	self
		assert: aXdFile manifest attachments first fileSize
		equals: 58.
	self assert: aXdFile streamingStrategy notNil.
	self assert: aXdFile exists.
	self assert: aXdFile streamingStrategy zip members size equals: 3.
	^ aXdFile
]

{ #category : #writing }
XdPlaygroundExamples >> writePlaybookDocumentToFile [

	<gtExample>
	| aStorage aWriter aXdFile aPlayBookFileReference |
	aStorage := GtFileSystemExamples new.
	aPlayBookFileReference := aStorage rootDirectory / 'playbook.xdoc'.
	self assert: aPlayBookFileReference exists not.
	aWriter := self writer.
	aXdFile := aWriter
		streamingStrategy: (XdStreamingStrategy file: aPlayBookFileReference);
		playbook: self playbook;
		write.
	self assert: aXdFile notNil.
	self assert: aXdFile manifest notNil.
	self assert: aXdFile manifest documents size equals: 1.
	self
		assert: aXdFile manifest documents first type
		equals: XdType playbook.
	self
		assert: aXdFile manifest documents first components size
		equals: 1.
	self
		assert: aXdFile manifest documents first components first link
		equals: '1'.
	self assert: aXdFile manifest attachments size equals: 1.
	self assert: aXdFile manifest attachments first id equals: '1'.
	self
		assert: aXdFile manifest attachments first fileName
		equals: 'main.playbook'.
	self
		assert: aXdFile manifest attachments first fileSize
		equals: 58.
	self assert: aXdFile streamingStrategy notNil.
	self assert: aXdFile exists.
	self assert: aXdFile streamingStrategy zip members size equals: 3.
	self assert: aPlayBookFileReference exists.
	^ aXdFile
]

{ #category : #writing }
XdPlaygroundExamples >> writePlaybookDocumentToFileOnDisk [

	<gtExample>
	| aWriter aXdFile aPlayBookFileReference |
	aPlayBookFileReference := FileReference 
		newTempFilePrefix: 'testing-file' 
		suffix: self constants xdocExtension.
	aPlayBookFileReference ensureDelete.
	self assert: aPlayBookFileReference exists not.
	aWriter := self writer.
	aXdFile := aWriter
		streamingStrategy: (XdStreamingStrategy file: aPlayBookFileReference);
		playbook: self playbook;
		write.
	self assert: aXdFile notNil.
	self assert: aXdFile manifest notNil.
	self assert: aXdFile manifest documents size equals: 1.
	self
		assert: aXdFile manifest documents first type
		equals: XdType playbook.
	self
		assert: aXdFile manifest documents first components size
		equals: 1.
	self
		assert: aXdFile manifest documents first components first link
		equals: '1'.
	self assert: aXdFile manifest attachments size equals: 1.
	self assert: aXdFile manifest attachments first id equals: '1'.
	self
		assert: aXdFile manifest attachments first fileName
		equals: 'main.playbook'.
	self
		assert: aXdFile manifest attachments first fileSize
		equals: 58.
	self assert: aXdFile streamingStrategy notNil.
	self assert: aXdFile exists.
	self assert: aXdFile streamingStrategy zip members size equals: 3.
	self assert: aPlayBookFileReference exists.
	^ aXdFile
]

{ #category : #accessing }
XdPlaygroundExamples >> writer [
	<gtExample>
	^ XdReaderWriterExamples new writer
]
