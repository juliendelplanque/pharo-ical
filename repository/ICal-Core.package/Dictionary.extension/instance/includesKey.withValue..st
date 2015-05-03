*ICal-Core
includesKey: aKey withValue: aValue
	^(self includesKey: aKey)
		and: [ (self at: aKey) = aValue ]