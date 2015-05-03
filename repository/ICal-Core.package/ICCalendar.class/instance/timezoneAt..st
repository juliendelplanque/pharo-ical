timezones
timezoneAt: aTzid
	^self timezones
		detect: [ :each |
			(each id compare: aTzid caseSensitive: false) = 2 ]
		ifNone: [ nil ]