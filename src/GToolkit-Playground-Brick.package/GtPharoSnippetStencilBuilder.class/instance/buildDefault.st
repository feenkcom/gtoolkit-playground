api - instantiation
buildDefault
	<return: #BlElement>

	| aContainer aContext |
	aContainer := BlElement new.
	aContainer look: GtPharoSnippetLook.
	aContext := GtPharoSnippetContext new.
	aContext tool: aContainer.
	aContext snippet: self snippet.
	aContainer 
		addChild: (GtPharoTextEditorStencil new 
				text: self snippet content;
				bindings: self snippet bindings; 
				classOrMetaClass: self snippet classOrMetaClass) asElement
			as: #textEditor;
		addChild: (BrToolbarCommanderBuilder new
				context: aContext;
				activationClass: GtPharoSnippetToolbarActivation;
				build) asElement
			as: #toolBar.
	^ aContainer