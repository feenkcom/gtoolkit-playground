initialization
newEnterButton
	| aButton aText |
	aButton := BrButton new.
	aButton look: BrLabelLook 
		"+ BrGlamorousButtonExteriorLook"
		+ (BrLayoutLook linearHorizontal 
			fitContent constraintsDo: [ :c |
				c linear vertical alignBottom.
				c linear horizontal alignRight. ]).
	aText := 'Press Enter to download' asRopedText fontSize: 11.
	aButton label: aText.
	aButton action: [ self snippet evaluate ].
	aButton
		background: Color white;
		geometry: (BlRectangle cornerRadius: 2).
	^ aButton