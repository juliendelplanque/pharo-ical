utilities
createDateAndTime: aString parameters: aDictionary
	| iCalType timezone  tzid |
	iCalType := aDictionary at: 'VALUE' ifAbsent: [ DateAndTime iCalType ].
	tzid := aDictionary at: 'TZID' ifAbsent: [ nil ].
	tzid isNil ifFalse: [
		timezone := self product timezoneAt: tzid ].
	^(ICConversion propertyClassFor: iCalType)
		fromICalString: aString
		parameters: aDictionary
		timezone: timezone