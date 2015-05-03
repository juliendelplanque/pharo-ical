parsing
parseHackForOldFormat: paramName value: paramValue	
	paramName = 'BASE64'
		ifTrue: [
			self parameters at: 'ENCODING'put: 'B'.
			self parameters at: 'VALUE' put: ByteArray iCalType ]
		ifFalse: [
			self addParameter: 'TYPE' value: paramName ]
	