Class {
	#name : #ICChronologyParser,
	#superclass : #Object,
	#category : 'ICal-Core-IO'
}

{ #category : #'date-time' }
ICChronologyParser class >> fromICalDateAndTimeString: aString class: aClass [
	| yearMonthDay hourMinuteSecond |
	yearMonthDay := self splitYearMonthDayICal: (aString first: 8).
	aString size > 8 
		ifTrue: [hourMinuteSecond := self splitHourMinuteSecondICal: (aString  allButFirst: 9)]
		ifFalse: [hourMinuteSecond := #(0 0 0) ].
	^ (aString size > 15 and: [ (aString at: 16) = $Z ])
		ifTrue: [
			aClass
				year: yearMonthDay first
				month: yearMonthDay second
				day: yearMonthDay third
				hour: hourMinuteSecond first
				minute: hourMinuteSecond second
				second: hourMinuteSecond third
				offset: Duration zero ]
		ifFalse: [
			aClass
				year: yearMonthDay first
				month: yearMonthDay second
				day: yearMonthDay third
				hour: hourMinuteSecond first
				minute: hourMinuteSecond second
				second: hourMinuteSecond third ]

]

{ #category : #date }
ICChronologyParser class >> fromICalDateString: aString class: aClass [
	| yearMonthDay |
	yearMonthDay := self splitYearMonthDayICal: aString.
	^aClass
		year: (yearMonthDay first)
		month: (yearMonthDay second)
		day: (yearMonthDay third)
]

{ #category : #duration }
ICChronologyParser class >> fromICalDuractionString: aString class: aClass [
	| positive value weeks days hours minutes seconds duration |
	positive := aString first ~= $-.
	value := aString copyAfter: $P.
	^(value includes: $W)
		ifTrue: [
			weeks := (value copyUpTo: $W) asInteger.
			aClass weeks: (positive ifTrue: [ weeks ] ifFalse: [ weeks negated ] )]
		ifFalse: [
			days := hours := minutes := seconds := 0.
			self flag: #XXX. "copy pasted code"
			(value includes: $D) ifTrue: [
				days := (value copyUpTo: $D) asInteger.
				value := value copyAfter: $D ].
			(value includes: $H) ifTrue: [
				hours := (value copyUpTo: $H) asInteger.
				value := value copyAfter: $H ].
			(value includes: $M) ifTrue: [
				minutes := (value copyUpTo: $M) asInteger.
				value := value copyAfter: $M ].
			(value includes: $S) ifTrue: [
				seconds := (value copyUpTo: $S) asInteger.
				value := value copyAfter: $S ].
			duration := aClass days: days hours: hours minutes: minutes seconds: seconds.
			positive
				ifTrue: [ duration ]
				ifFalse: [ duration negated ] ]
		
]

{ #category : #time }
ICChronologyParser class >> fromICalTimeString: aString class: aClass [
	| hourMinuteSecond |
	self flag: #todo. "last = z utc"
	hourMinuteSecond := self splitHourMinuteSecondICal: aString.
	^aClass
		hour: hourMinuteSecond first
		minute: hourMinuteSecond second
		second: hourMinuteSecond third.
]

{ #category : #'date-time' }
ICChronologyParser class >> fromVCardDateAndTimeString: aString class: aClass [
	| yearMonthDay hourMinuteSecond |
	yearMonthDay := self splitYearMonthDayVCard: (aString copyUpTo: $T).
	hourMinuteSecond := self splitHourMinuteSecondVCard: (aString copyAfter: $T).
	"aString includes: $T"
	^aClass
		year: yearMonthDay first
		month: yearMonthDay second
		day: yearMonthDay third
		hour: hourMinuteSecond first
		minute: hourMinuteSecond second
		second: hourMinuteSecond third
]

{ #category : #date }
ICChronologyParser class >> fromVCardDateString: aString class: aClass [
	^(aString includesSubstring: '-')
		ifFalse: [ self fromICalDateString: aString class: aClass ]
		ifTrue:  [
			| yearMonthDay |
			yearMonthDay := self splitYearMonthDayVCard: aString.
			aClass
				year: (yearMonthDay first)
				month: (yearMonthDay second)
				day: (yearMonthDay third) ]	
]

{ #category : #time }
ICChronologyParser class >> fromVCardStringTime: aString class: aClass [
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
]

{ #category : #time }
ICChronologyParser class >> splitHourMinuteSecondICal: aString [
	^Array
		with: (aString first: 2) asInteger
		with: (aString copyFrom: 3 to: 4) asInteger
		with: (aString copyFrom: 5 to: 6) asInteger.
]

{ #category : #time }
ICChronologyParser class >> splitHourMinuteSecondVCard: aString [
	^self splitHourMinuteSecondICal: ((aString copyUpTo: $.) reject: [ :each | each = $: ])
]

{ #category : #date }
ICChronologyParser class >> splitYearMonthDayICal: aString [
	^Array
		with: (aString first: 4) asInteger
	     with: (aString copyFrom: 5 to: 6) asInteger
	     with: (aString copyFrom: 7 to: 8) asInteger
]

{ #category : #date }
ICChronologyParser class >> splitYearMonthDayVCard: aString [
	^self splitYearMonthDayICal: (aString reject: [ :each | each = $- ])
]
