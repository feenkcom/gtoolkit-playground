visiting
visitCommandActivator: aCommandActivator
	items add: (BrButtonModel new
		action: [ aCommandActivator executeCommand ];
		add: (BrLabelModel new text: aCommandActivator commandDescription))