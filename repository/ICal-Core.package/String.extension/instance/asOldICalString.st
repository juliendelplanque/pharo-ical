*ICal-Core
asOldICalString
	^self replaceStrings: (Array
		with: ',' -> '\,'
		with: ';' -> '\;'
		with: '\' -> '\\'
		with: (String cr) -> '=0D'
		with: (String lf) -> '=0A')