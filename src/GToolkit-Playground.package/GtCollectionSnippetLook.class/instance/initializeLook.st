initialization
initializeLook
	super initializeLook.

	self availableSnippetClasses do: [ :eachSnippetClass | 
		| anItem |
		anItem := BrButton new.
		anItem margin: (BlInsets all: 2).
		anItem look: BrGlamorousButtonExteriorRectangularLook + BrGlamorousButtonLabelLook.
		anItem label: eachSnippetClass new typeName.
		anItem action: [ self addSnippet: eachSnippetClass ].
		toolbar addItem: anItem ].
	self widgetContent addChild: toolbar as: #toobar.