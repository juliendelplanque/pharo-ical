accessing
memoryUsage
	| params  |
	params := SmalltalkImage current getVMParameters.
	^(params at: 2) printStringHex asLowercase
