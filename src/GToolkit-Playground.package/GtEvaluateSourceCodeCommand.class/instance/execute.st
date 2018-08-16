execution
execute
	| aCompiler |
	aCompiler := self class compiler
		source: self sourceCode "readStream" "Looks like it can be a String instead of readSream";
		context: nil "TODO: what is context? evaluation uses `context method methodClass`";
		receiver: nil "TODO: what is receiver? evaluation uses `receiver class` if context is nil";
		bindings: self bindingsStrategy;
		requestor: self requestor. "TODO: requestor should be an editor?
			evaluation uses `requestor selection` to evaluate only selected part"
	[ 
		result := aCompiler evaluate.
		"evaluation does: 
			`receiver withArgs: context or #() executeMethod: 
				parse uses `noPattern`, 
					if context is not nil, `context tempNames` is used in `rewriteTempsForContext:`
				doSemanticAnalysis uses: 
					`compilationContext failBlock` on an exception
					`compilationContext scope newMethodScope to validate source code
						`lookupVariableForWrite:` uses `scope lookupVar: aVarNameString"
		"parseExpression uses `parserClass` and `optionParseErrors` to parse faulty expressions"
		isException := false.
	] on: Error, OCSemanticWarning do: [ :anException | 
		result := anException.
		isException := true.
	].
	"self inform: result printString."