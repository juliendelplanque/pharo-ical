*ICal-Core
unescapeBackslashes: aString
	^aString replaceStrings: (Array
		with: '\n' -> (String with: Character cr)
		with: '\N' -> (String with: Character cr)
		with: '\,' -> ','
		with: '\;' -> ';'
		with: '\\' -> '\')