*ICal-Core
asICalString
	^ICCalendarVersion value >= 2.0
		ifTrue: [ self asNewICalString ]
		ifFalse: [ self asOldICalString ]