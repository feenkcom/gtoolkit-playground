Extension { #name : #XdWriter }

{ #category : #'*GToolkit-Playground-XDoc' }
XdWriter >> playbook: aPlayBook [
	| aJsonString |
	aJsonString := XdPlayBookJsonMapping writePlayBook: aPlayBook.
	self 
		documentType: XdPlayBookType;
		attachment: 'main', self constants playBookExtension text: aJsonString
]
