initialization
affect: aBrText in: anEditorElement
	| aButton |
	aButton := BlElement new.
	^ aButton
		size: 6 @ 6;
		margin:
			(BlInsets
				top: 6
				right: 2
				bottom: 0
				left: 2);
		background: self paint;
		geometry: BlEllipse new;
		addEventHandlerOn: BlClickEvent do: [ :anEvent | 
			aButton fireEvent: (GtPhlowObjectToSpawn new 
				object: result;
				sourceElement: aButton) ];
		yourself