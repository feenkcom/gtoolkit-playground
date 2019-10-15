Extension { #name : #GtPlayBook }

{ #category : #'*GToolkit-Playground-XDoc' }
GtPlayBook >> gtActionXDocSpotterFor: anAction [
	<gtAction>
	^ anAction explicit
		forPlayground;
		stencil: [ :aBrTab | self xdocPlayBookSpotterIn: aBrTab ]
]

{ #category : #'*GToolkit-Playground-XDoc' }
GtPlayBook >> saveToXDoc [
	self storePlayBookInto: (XdFile new
		streamingStrategy: XdStreamingStrategy bytes).
]

{ #category : #'*GToolkit-Playground-XDoc' }
GtPlayBook >> storePlayBookInto: aXdFile [ 
	| aText aTitle aDescription |
	aText := self string.
	aTitle := aText first: (aText size min: 60).
	aTitle := aTitle replace: [ :eachCharacter | 
		eachCharacter isSeparator ifTrue: [ Character space ] ifFalse: [ eachCharacter ] ]. 
	aDescription := aText.

	aXdFile writer
		authorName: Author name;
		title: aTitle;
		description: aDescription;
		playbook: self;
		write
]

{ #category : #'*GToolkit-Playground-XDoc' }
GtPlayBook >> xdocPlayBookSpotterIn: aBrTab [
	| look |
	^ BrButton new
		look:
			BrGlamorousButtonWithIconLook
				+
					(look := BrGlamorousWithDropdownLook
						stencil: [ | model |
							model := GtSpotter new
								initializeWith: XdPlaygroundSpotterStart new.
							model announcer
								when: GtSpotterActOn
								do: [ :anEvent | 
									| anXdFile aNewPlayBook |
									anXdFile := anEvent realItem.
									aNewPlayBook := GtPlayBook fromXdFile: anXdFile.
									anEvent actedUpon: true.
									aNewPlayBook subscribeExternalTools.
									self
										announce:
											(GtPlayBookChangeRequestedAnnoucement new
												oldPlayBook: self;
												newPlayBook: aNewPlayBook) ].
							model announcer
								when: GtSpotterExitAnnouncement
								do: [ :e | look hide ].
							BlElement new
								look:
									(BrGlamorousDropdownLook new
										handle:
											(BrButton new
												look:
													BrGlamorousButtonWithIconLook - BrGlamorousWithLabelTooltipLook
														- BrGlamorousButtonExteriorLook;
												icon: BrGlamorousIcons search asElement;
												label: 'Playground History';
												yourself);
										content:
											(GtSpotterElement new
												spotterModel: model;
												size: 600 @ 400;
												yourself);
										yourself);
								background: BrGlamorousColors secondaryHeaderBackgroundColor;
								yourself ]);
		icon: BrGlamorousIcons search asElement;
		label: 'Playground History';
		yourself
]

{ #category : #'*GToolkit-Playground-XDoc' }
GtPlayBook >> xdocSaving [
	<playBookHandler>
	| aXdFile aFileReference |
	aFileReference := XdPlaygroundSettings directory
		/ (XdUtility playgroundFileNameFromDateAndTime: DateAndTime now).
	aXdFile := XdFile new.
	aXdFile streamingStrategy: (XdStreamingStrategy file: aFileReference).
	self
		when: GtPageSnippetEvaluatedAnnouncement
		do: [ :anAnnuncement | self storePlayBookInto: aXdFile ]
]
