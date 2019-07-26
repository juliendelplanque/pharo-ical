"
I am the representation of a RECUR ical's rule.

According to RFC 2445,
The purpose of this object is: 'This value type is used to identify properties that contain a recurrence rule specification.'

I have some class message to instanciate me with predefined frequency.
For example:

ICRecurrenceRule daily. ""Create a daily reccurence rule.""
ICRecurrenceRule minutely. ""Create a minutely reccurence rule.""

I can only take frequencies defined in the array returned bu the message ICRecurrenceRule>>possibleFrequencies and I have class message that wrap each frequency.
"
Class {
	#name : #ICRecurrenceRule,
	#superclass : #Object,
	#instVars : [
		'frequency',
		'interval',
		'seconds',
		'minutes',
		'hours',
		'weekdays',
		'monthdays',
		'yeardays',
		'weeknumbers',
		'monthnumbers',
		'positions',
		'weekStartday',
		'repetition'
	],
	#category : 'ICal-Core-Model'
}

{ #category : #parsing }
ICRecurrenceRule class >> byday: aString on: aRule [
	| firstLetterIndex day occurrence |
	firstLetterIndex := aString findFirst: [ :each | each isLetter ].
	firstLetterIndex = 1
		ifTrue: [ aRule addWeekday: aString asUppercase ]
		ifFalse: [
			day := (aString allButFirst: firstLetterIndex - 1) asUppercase.
			occurrence := Integer fromICalString: (aString first:  firstLetterIndex - 1).
			aRule addWeekday: day occurrence: occurrence ]
]

{ #category : #parsing }
ICRecurrenceRule class >> byhour: aString on: aRule [
	aRule addHour: (Integer fromICalString: aString)
]

{ #category : #parsing }
ICRecurrenceRule class >> byminute: aString on: aRule [
	aRule addMinute: (Integer fromICalString: aString)
]

{ #category : #parsing }
ICRecurrenceRule class >> bymonth: aString on: aRule [
	aRule addMonthnumber: (Integer fromICalString: aString)
]

{ #category : #parsing }
ICRecurrenceRule class >> bymonthday: aString on: aRule [
	aRule addMonthday: (Integer fromICalString: aString)
]

{ #category : #parsing }
ICRecurrenceRule class >> bysecond: aString on: aRule [
	aRule addSecond: (Integer fromICalString: aString)
]

{ #category : #parsing }
ICRecurrenceRule class >> bysetpos: aString on: aRule [
	aRule addPosition: (Integer fromICalString: aString)
]

{ #category : #parsing }
ICRecurrenceRule class >> byweekno: aString on: aRule [
	aRule addWeeknumber: (Integer fromICalString: aString)
]

{ #category : #parsing }
ICRecurrenceRule class >> byyearday: aString on: aRule [
	aRule addYearday: (Integer fromICalString: aString)
]

{ #category : #parsing }
ICRecurrenceRule class >> count: aString on: aRule [
	aRule count: (Integer fromICalString: aString)
]

{ #category : #'instance creation' }
ICRecurrenceRule class >> daily [
	^self frequency: self frequencyDaily 
]

{ #category : #private }
ICRecurrenceRule class >> dateAndTimeClass [
	^ICConversion dateAndTimeClass
]

{ #category : #parsing }
ICRecurrenceRule class >> freq: aString on: aRule [
	aRule frequency: aString asUppercase
]

{ #category : #'instance creation' }
ICRecurrenceRule class >> frequency: aString [
	^self new
		frequency: aString;
		yourself
]

{ #category : #accessing }
ICRecurrenceRule class >> frequencyDaily [
	^'DAILY'
]

{ #category : #accessing }
ICRecurrenceRule class >> frequencyHourly [
	^'HOURLY'
]

{ #category : #accessing }
ICRecurrenceRule class >> frequencyMinutely [
	^'MINUTELY'
]

{ #category : #accessing }
ICRecurrenceRule class >> frequencyMonthly [
	^'MONTHLY'
]

{ #category : #accessing }
ICRecurrenceRule class >> frequencySecondly [
	^'SECONDLY'
]

{ #category : #accessing }
ICRecurrenceRule class >> frequencyWeekly [
	^'WEEKLY'
]

{ #category : #accessing }
ICRecurrenceRule class >> frequencyYearly [
	^'YEARLY'
]

{ #category : #'instance creation' }
ICRecurrenceRule class >> fromICalString: aString [
	| inst parts key values |
	inst := self new.
	(aString substrings: ';')
		do: [ :property | 
			parts := property substrings: '='.
			key := parts first.
			values := parts second substrings: ','.
			values
				do: [ :each | 
					self
						perform: (key asLowercase , ':on:') asSymbol
						withArguments: (Array with: each with: inst) ] ].
	^ inst
]

{ #category : #'instance creation' }
ICRecurrenceRule class >> hourly [
	^self frequency: self frequencyHourly 
]

{ #category : #accessing }
ICRecurrenceRule class >> iCalType [
	^'RECUR'
]

{ #category : #parsing }
ICRecurrenceRule class >> interval: aString on: aRule [
	aRule interval: (Integer fromICalString: aString)
]

{ #category : #'instance creation' }
ICRecurrenceRule class >> minutely [
	^self frequency: self frequencyMinutely 
]

{ #category : #'instance creation' }
ICRecurrenceRule class >> monthly [
	^self frequency: self frequencyMonthly  
]

{ #category : #accessing }
ICRecurrenceRule class >> possibleFrequencies [
	^OrderedCollection new
		add: self frequencySecondly;
		add: self frequencyMinutely;
		add: self frequencyHourly;
		add: self frequencyDaily;
		add: self frequencyWeekly;
		add: self frequencyMonthly; 
		add: self frequencyYearly;
		yourself
]

{ #category : #accessing }
ICRecurrenceRule class >> possibleWeekdays [
	^#(
		'SU'
		'MO'
		'TU'
		'WE'
		'TH'
		'FR'
		'SA'
	)
]

{ #category : #'instance creation' }
ICRecurrenceRule class >> secondly [
	^self frequency: self frequencySecondly
]

{ #category : #parsing }
ICRecurrenceRule class >> until: aString on: aRule [
	aRule until: (self dateAndTimeClass fromICalString: aString)
]

{ #category : #'instance creation' }
ICRecurrenceRule class >> weekly [
	^self frequency: self frequencyWeekly 
]

{ #category : #parsing }
ICRecurrenceRule class >> wkst: aString on: aRule [
	aRule weekStartday: aString asUppercase
]

{ #category : #'instance creation' }
ICRecurrenceRule class >> yearly [
	^self frequency: self frequencyYearly 
]

{ #category : #parsing }
ICRecurrenceRule >> addDatesTo: anArray [ 
	self shouldBeImplemented.
]

{ #category : #parsing }
ICRecurrenceRule >> addDatesTo: anArray starting: aTimepoint [ 
	self shouldBeImplemented.
]

{ #category : #adding }
ICRecurrenceRule >> addHour: anInteger [
	self hours add: anInteger
]

{ #category : #adding }
ICRecurrenceRule >> addMinute: anInteger [
	self minutes add: anInteger
]

{ #category : #adding }
ICRecurrenceRule >> addMonthday: anInteger [
	self monthdays add: anInteger
]

{ #category : #adding }
ICRecurrenceRule >> addMonthnumber: anInteger [
	self monthnumbers add: anInteger
]

{ #category : #adding }
ICRecurrenceRule >> addPosition: anInteger [
	self positions add: anInteger
]

{ #category : #adding }
ICRecurrenceRule >> addSecond: anInteger [
	self seconds add: anInteger
]

{ #category : #adding }
ICRecurrenceRule >> addWeekday: aString [
	self weekdays add: aString
]

{ #category : #adding }
ICRecurrenceRule >> addWeekday: aString occurrence: anInteger [
	self weekdays add: aString -> anInteger
]

{ #category : #adding }
ICRecurrenceRule >> addWeeknumber: anInteger [
	self weeknumbers add: anInteger
]

{ #category : #adding }
ICRecurrenceRule >> addYearday: anInteger [
	self yeardays add: anInteger
]

{ #category : #converting }
ICRecurrenceRule >> asICalString [
	^String streamContents: [ :stream |
		self printFrequencyOn: stream.
		self hasRepetition
			ifTrue: [
				self printCommaOn: stream.
				self printRepetitonOn: stream ].
		self hasInterval
			ifTrue: [
				self printCommaOn: stream.
				self printIntervalOn: stream ].
		self hasSeconds
			ifTrue: [
				self printCommaOn: stream.
				self printSecondsOn: stream ].
		self hasMinutes
			ifTrue: [
				self printCommaOn: stream.
				self printMinutesOn: stream ].
		self hasHours
			ifTrue: [
				self printCommaOn: stream.
				self printHoursOn: stream ].
		self hasWeekdays
			ifTrue: [ 
				self printCommaOn: stream.
				self printWeekdaysOn: stream ].
		self hasMonthdays
			ifTrue: [ 
				self printCommaOn: stream.
				self printMonthdaysOn: stream ].
		self hasYeardays
			ifTrue: [ 
				self printCommaOn: stream.
				self printYeardaysOn: stream ].
		self hasWeeknumbers
			ifTrue: [ 
				self printCommaOn: stream.
				self printWeeknumbersOn: stream ].
		self hasMonthnumbers
			ifTrue: [ 
				self printCommaOn: stream.
				self printMonthnumbersOn: stream ].
		self hasPositions
			ifTrue: [ 
				self printCommaOn: stream.
				self printPositionsnumbersOn: stream. ].
		self hasWeekStartday
			ifTrue: [ 
				self printCommaOn: stream.
				self printWeekStartdayOn: stream ] ]
]

{ #category : #converting }
ICRecurrenceRule >> asRecurrenceScheduleFor: anEvent [
	^ ICRecurrenceSchedule fromEvent: anEvent forRule: self
]

{ #category : #accessing }
ICRecurrenceRule >> count: anInteger [ 
	repetition := anInteger
]

{ #category : #accessing }
ICRecurrenceRule >> frequency [
	^frequency
]

{ #category : #accessing }
ICRecurrenceRule >> frequency: aString [ 
	frequency := aString
]

{ #category : #testing }
ICRecurrenceRule >> hasHours [
	^self hours notEmpty
]

{ #category : #testing }
ICRecurrenceRule >> hasInterval [
	^self interval notNil
]

{ #category : #testing }
ICRecurrenceRule >> hasMinutes [
	^self minutes notEmpty
]

{ #category : #testing }
ICRecurrenceRule >> hasMonthdays [
	^self monthdays notEmpty
]

{ #category : #testing }
ICRecurrenceRule >> hasMonthnumbers [
	^self monthnumbers notEmpty
]

{ #category : #testing }
ICRecurrenceRule >> hasPositions [
	^self positions notEmpty
]

{ #category : #testing }
ICRecurrenceRule >> hasRepetition [
	^self repetition notNil
]

{ #category : #testing }
ICRecurrenceRule >> hasSeconds [
	^self seconds notEmpty
]

{ #category : #testing }
ICRecurrenceRule >> hasWeekStartday [
	^self weekStartday notNil
]

{ #category : #testing }
ICRecurrenceRule >> hasWeekdays [
	^self weekdays notEmpty
]

{ #category : #testing }
ICRecurrenceRule >> hasWeeknumbers [
	^self weeknumbers notEmpty
]

{ #category : #testing }
ICRecurrenceRule >> hasYeardays [
	^self yeardays notEmpty
]

{ #category : #accessing }
ICRecurrenceRule >> hours [
	^hours
]

{ #category : #accessing }
ICRecurrenceRule >> hours: aCollection [ 
	hours := aCollection
]

{ #category : #'initialize-release' }
ICRecurrenceRule >> initialize [
	super initialize.
	self seconds: Set new.
	self minutes: Set new.
	self hours: Set new.
	self weekdays: Set new.
	self monthdays: Set new.	
	self yeardays: Set new.
	self weeknumbers: Set new.
	self monthnumbers: Set new.
	self positions: Set new.
]

{ #category : #accessing }
ICRecurrenceRule >> interval [
	^interval
]

{ #category : #accessing }
ICRecurrenceRule >> interval: anInteger [ 
	interval := anInteger
]

{ #category : #testing }
ICRecurrenceRule >> isValid [
	^self repetition notNil
]

{ #category : #accessing }
ICRecurrenceRule >> minutes [
	^minutes
]

{ #category : #accessing }
ICRecurrenceRule >> minutes: aCollection [ 
	minutes := aCollection
]

{ #category : #accessing }
ICRecurrenceRule >> monthdays [
	^monthdays
]

{ #category : #accessing }
ICRecurrenceRule >> monthdays: aCollection [ 
	monthdays := aCollection
]

{ #category : #accessing }
ICRecurrenceRule >> monthnumbers [
	^monthnumbers
]

{ #category : #accessing }
ICRecurrenceRule >> monthnumbers: aCollection [ 
	monthnumbers := aCollection
]

{ #category : #accessing }
ICRecurrenceRule >> positions [
	^positions
]

{ #category : #accessing }
ICRecurrenceRule >> positions: aCollection [ 
	positions := aCollection
]

{ #category : #private }
ICRecurrenceRule >> printCommaOn: aStream [
	aStream nextPut: $;
]

{ #category : #private }
ICRecurrenceRule >> printFrequencyOn: aStream [
	aStream
		nextPutAll: 'FREQ=';
		nextPutAll: self frequency
]

{ #category : #private }
ICRecurrenceRule >> printHoursOn: aStream [
	self
		printIntegers: self hours
		title: 'BYHOUR'
		on: aStream
]

{ #category : #private }
ICRecurrenceRule >> printIntegers: aCollection title: aString on: aStream [
	aStream
		nextPutAll: aString;
		nextPut: $=.
	aCollection
		do: [ :each | aStream nextPutAll: each asICalString ]
		separatedBy: [ aStream nextPut: $, ]
]

{ #category : #private }
ICRecurrenceRule >> printIntervalOn: aStream [
	aStream
		nextPutAll: 'INTERVAL=';
		nextPutAll: self interval asICalString
]

{ #category : #private }
ICRecurrenceRule >> printMinutesOn: aStream [
	self
		printIntegers: self minutes
		title: 'BYMINUTE'
		on: aStream
]

{ #category : #private }
ICRecurrenceRule >> printMonthdaysOn: aStream [
	self
		printIntegers: self monthdays
		title: 'BYMONTHDAY'
		on: aStream
]

{ #category : #private }
ICRecurrenceRule >> printMonthnumbersOn: aStream [
	self
		printIntegers: self monthnumbers
		title: 'BYMONTH'
		on: aStream
]

{ #category : #private }
ICRecurrenceRule >> printPositionsnumbersOn: aStream [
	self
		printIntegers: self positions
		title: 'BYSETPOS'
		on: aStream
]

{ #category : #private }
ICRecurrenceRule >> printRepetitonOn: aStream [
	self repetition isInteger
		ifTrue: [
			aStream
				nextPutAll: 'COUNT=';
				nextPutAll: self repetition asICalString ]
		ifFalse: [
			aStream
			nextPutAll: 'UNTIL=';
				nextPutAll: self repetition asICalUtcString ]
]

{ #category : #private }
ICRecurrenceRule >> printSecondsOn: aStream [
	self
		printIntegers: self seconds
		title: 'BYSECOND'
		on: aStream
]

{ #category : #private }
ICRecurrenceRule >> printWeekStartdayOn: aStream [
	aStream
		nextPutAll: 'WKST=';
		nextPutAll: self weekStartday
]

{ #category : #private }
ICRecurrenceRule >> printWeekdaysOn: aStream [
	aStream nextPutAll: 'BYDAY='.
	(self weekdays sorted: [ :a | a isString ifTrue: [ a ] ifFalse: [ a key ] ] asSortFunction)
		do: [ :each |
			each isString
				ifTrue: [ aStream nextPutAll: each ]
				ifFalse: [
					aStream
						nextPutAll: each value asICalString; "occurrence"
						nextPutAll: each key asICalString "day" ] ]
		separatedBy: [ aStream nextPut: $, ]
]

{ #category : #private }
ICRecurrenceRule >> printWeeknumbersOn: aStream [
	self
		printIntegers: self weeknumbers
		title: 'BYWEEKNO'
		on: aStream
]

{ #category : #private }
ICRecurrenceRule >> printYeardaysOn: aStream [
	self
		printIntegers: self yeardays
		title: 'BYYEARDAY'
		on: aStream
]

{ #category : #accessing }
ICRecurrenceRule >> repetition [
	^repetition
]

{ #category : #accessing }
ICRecurrenceRule >> seconds [
	^seconds
]

{ #category : #accessing }
ICRecurrenceRule >> seconds: aCollection [ 
	seconds := aCollection
]

{ #category : #accessing }
ICRecurrenceRule >> until: aDateOrDateAndTime [ 
	repetition := aDateOrDateAndTime
]

{ #category : #accessing }
ICRecurrenceRule >> weekStartday [
	^weekStartday
]

{ #category : #accessing }
ICRecurrenceRule >> weekStartday: aString [ 
	weekStartday := aString
]

{ #category : #accessing }
ICRecurrenceRule >> weekdays [
	^weekdays
]

{ #category : #accessing }
ICRecurrenceRule >> weekdays: aString [ 
	weekdays := aString
]

{ #category : #accessing }
ICRecurrenceRule >> weeknumbers [
	^weeknumbers
]

{ #category : #accessing }
ICRecurrenceRule >> weeknumbers: aCollection [ 
	weeknumbers := aCollection
]

{ #category : #accessing }
ICRecurrenceRule >> yeardays [
	^yeardays
]

{ #category : #accessing }
ICRecurrenceRule >> yeardays: aCollection [ 
	yeardays := aCollection
]
