exporting
exportICalParametersOn: anExpoter
	super exportICalParametersOn: anExpoter.
	self related isNil ifFalse: [
		anExpoter exportParameter: 'RELATED' value: self related ]