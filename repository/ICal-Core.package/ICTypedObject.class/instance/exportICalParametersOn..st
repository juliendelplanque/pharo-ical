exporting
exportICalParametersOn: anExpoter
	super exportICalParametersOn: anExpoter.
	self types sorted do: [ :each |
		anExpoter exportParameter: 'TYPE' value: each ]