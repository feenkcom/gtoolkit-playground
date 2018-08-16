private
updateTab: aGtPage
	| aTab |
	aTab := BrTab new
				look: BrMaterialTabLabelledLook;
				padding: (BlInsets all: 10);
				label: aGtPage title;
				stencil: [ aGtPage asElement margin: (BlInsets all: 10) ]";
				actionsStencil: view actions".
	tabGroup addTab: aTab.