*ICal-Core
asVCardString
	^ICCardVersion value >= 3.0
		ifTrue: [ self asNewICalString ]
		ifFalse: [ self asOldICalString ]