gt-extension
gtLiveFor: aView
	<gtView>
	^ aView explicit
		title: 'Live' translated;
		stencil: self;
		priority: 10