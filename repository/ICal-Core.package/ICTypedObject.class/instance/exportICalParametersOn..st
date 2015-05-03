exporting
exportICalParametersOn: anExpoter
	super exportICalParametersOn: anExpoter.
	self types do: [ :each |
		anExpoter exportParameter: 'TYPE' value: each ]