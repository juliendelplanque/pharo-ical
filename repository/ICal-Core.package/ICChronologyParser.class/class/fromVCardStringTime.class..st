time
fromVCardStringTime: aString class: aClass
	| fraction nanos hourMinuteSecond |
	hourMinuteSecond := self splitHourMinuteSecondVCard: aString.
	^(aString includes: $.)
		ifFalse: [ aClass
			hour: hourMinuteSecond first
			minute: hourMinuteSecond second
			second: hourMinuteSecond third ]
		ifTrue: [
			fraction := (aString copyAfter: $.) copyUpTo: $Z.
			nanos := fraction asNumber * (10 raisedTo: 9 - fraction size).
			aClass
				hour: hourMinuteSecond first
				minute: hourMinuteSecond second
				second: hourMinuteSecond third
				nanosecond: nanos ]