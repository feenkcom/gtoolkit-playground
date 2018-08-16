private
updateTabs
	tabGroup viewModel tabs copy do: [ :eachTab | 
		tabGroup removeTab: eachTab widget ].
	self playBook pages do: [ :eachPage | 
		self updateTab: eachPage ]