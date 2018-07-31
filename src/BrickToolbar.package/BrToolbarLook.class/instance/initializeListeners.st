initialization
initializeListeners
	super initializeListeners.
	self when: BrToolbarItemAddedEvent do: [ :anEvent | self onItemAdded: anEvent item ].
	"self when: BrTabRemovedEvent do: [ :anEvent | self onTabRemoved: anEvent tab ].
	self when: BrTabsChangedEvent do: [ :anEvent | self onTabsChanged: anEvent tabs ]"