private - styling
styleEvaluatedCodeWithResult: aResult
	GtMarkEvaluatedCodeCommand new
		editor: self editor;
		result: aResult;
		execute