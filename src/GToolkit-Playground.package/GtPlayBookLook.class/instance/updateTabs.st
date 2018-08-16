private
updateTabs
	tabGroup viewModel tabs copy do: [ :eachTab | 
		tabGroup removeTab: eachTab widget ].
	self playground pages do: [ :eachPage | 
		self updateTab: eachPage ]