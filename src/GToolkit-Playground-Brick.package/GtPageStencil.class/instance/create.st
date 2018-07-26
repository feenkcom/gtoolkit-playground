api - instantiation
create
	<return: #BrSimpleList>

	^ BrSimpleList new 
		display: self values;
		stencil: self stencil.