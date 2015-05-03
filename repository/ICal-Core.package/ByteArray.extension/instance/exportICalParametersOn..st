*ICal-Core
exportICalParametersOn: anExpoter
	super exportICalParametersOn: anExpoter.
	anExpoter isVCard ifTrue: [
		anExpoter exportParameter: 'ENCODING' value: 'b' ]