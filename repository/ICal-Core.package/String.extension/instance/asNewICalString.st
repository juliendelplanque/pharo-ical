*ICal-Core
asNewICalString
	^self replaceStrings: (Array
		with: '\' -> '\\'
		with: ',' -> '\,'
		with: ';' -> '\;'
		with: (String with: Character cr) -> '\n')