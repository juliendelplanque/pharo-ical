*ICal-Core
asICalString
	^self asString
		replaceStrings: (Array
			with: '%2D' -> '-'
			with: '%2E' -> '.'
			with: '%5F' -> '_'
			with: '%7E' -> '~')