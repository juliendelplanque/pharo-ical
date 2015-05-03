accessing
stringConversionBlock
	stringConversionBlock isNil ifTrue: [
		stringConversionBlock := [ :value | value ] ].
	^stringConversionBlock