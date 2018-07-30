api - instantiation
create
	<return: #BrEditorElement>

	| aContainer anEditor |
	aContainer := BlElement new.
	aContainer look: GtPharoSnippetLook.
	
	anEditor := BrEditorElement new 
		editor: (BrTextEditor new text: self text);
		look: GtTextEditorLook.		
	aContainer addChild: anEditor.
	
	self toolbar ifNotNil: [ :aToolbar |
		aContainer addChild: aToolbar ].
	
	^ aContainer