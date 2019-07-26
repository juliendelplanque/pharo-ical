Class {
	#name : #ICRFC2445ExamplesTests,
	#superclass : #ICScheduleEnumerationTests,
	#category : 'ICal-Tests-Core-Model-Schedule'
}

{ #category : #'rfc2445-rules' }
ICRFC2445ExamplesTests >> dailyUntilDec241997 [
	^ ICRecurrenceRule fromICalString: 'FREQ=DAILY;UNTIL=19971224T000000Z'
]

{ #category : #'rfc2445-rules' }
ICRFC2445ExamplesTests >> every10Days5Occurrences [
	^ ICRecurrenceRule fromICalString: 'FREQ=DAILY;INTERVAL=10;COUNT=5'
]

{ #category : #'rfc2445-rules' }
ICRFC2445ExamplesTests >> every15MinsFor6 [
	^ ICRecurrenceRule fromICalString: 'FREQ=MINUTELY;INTERVAL=15;COUNT=6'
]

{ #category : #'rfc2445-rules' }
ICRFC2445ExamplesTests >> every18MonthsOnThe10thThrough15thFor10 [
	event
		start:
			(self dateAndTimeClass
				year: 1997
				month: 9
				day: 10
				hour: 9
				minute: 0
				second: 0).
	^ ICRecurrenceRule fromICalString: 'FREQ=MONTHLY;INTERVAL=18;COUNT=10;BYMONTHDAY=10,11,12,13,14,15'
]

{ #category : #'rfc2445-rules' }
ICRFC2445ExamplesTests >> every20MinsBetween9AMAnd440PM [
	^ ICRecurrenceRule fromICalString: 'FREQ=MINUTELY;INTERVAL=20;BYHOUR=9,10,11,12,13,14,15,16'
]

{ #category : #'rfc2445-rules' }
ICRFC2445ExamplesTests >> every3HoursOnADay [
	"The RFC 2445 example appears to be wrong.
	See: http://www.imc.org/ietf-calendar/mail-archive/msg01848.html
	
	Example:
		FREQ=HOURLY;INTERVAL=3;UNTIL=19970902T170000Z
	The UNTIL value must be adjusted by the timezone offset.
	"

	| untilValue |
	untilValue := self dateAndTimeClass
		year: 1997
		month: 9
		day: 2
		hour: 17
		minute: 0
		second: 0.
	^ ICRecurrenceRule fromICalString: 'FREQ=HOURLY;INTERVAL=3;UNTIL=' , untilValue asICalString
]

{ #category : #'rfc2445-rules' }
ICRFC2445ExamplesTests >> every90MinsFor4 [
	^ ICRecurrenceRule fromICalString: 'FREQ=MINUTELY;INTERVAL=90;COUNT=4'
]

{ #category : #'rfc2445-rules' }
ICRFC2445ExamplesTests >> everyDayFor10 [
	^ ICRecurrenceRule fromICalString: 'FREQ=DAILY;COUNT=10'
]

{ #category : #'rfc2445-rules' }
ICRFC2445ExamplesTests >> everyDayInJanuaryFor3Years [
	"The RFC 2445 example appears to be wrong.
	See: http://www.imc.org/ietf-calendar/mail-archive/msg01848.html
	
	Example:
		FREQ=YEARLY;UNTIL=20000131T090000Z;BYMONTH=1;BYDAY=SU,MO,TU,WE,TH,FR,SA
	The UNTIL value must be adjusted by the timezone offset.
	"
	| untilValue |
	untilValue := (self dateAndTimeClass year: 2000 month: 1 day: 31 hour: 9 minute: 0 second: 0) asUTC.
	event
		start:
			(self dateAndTimeClass
				year: 1998
				month: 1
				day: 1
				hour: 9
				minute: 0
				second: 0).
	^ ICRecurrenceRule fromICalString: 'FREQ=YEARLY;UNTIL=', '', untilValue asICalUtcString, ';BYMONTH=1;BYDAY=SU,MO,TU,WE,TH,FR,SA'

]

{ #category : #'rfc2445-rules' }
ICRFC2445ExamplesTests >> everyDayInJanuaryFor3Years1 [
	"The RFC 2445 example appears to be wrong.
	See: http://www.imc.org/ietf-calendar/mail-archive/msg01848.html
	
	Example:
		FREQ=DAILY;UNTIL=20000131T090000Z;BYMONTH=1
	The UNTIL value must be adjusted by the timezone offset.
	"
	| untilValue |
	untilValue := (self dateAndTimeClass year: 2000 month: 1 day: 31 hour: 9 minute: 0 second: 0) asUTC.
	event
		start:
			(self dateAndTimeClass
				year: 1998
				month: 1
				day: 1
				hour: 9
				minute: 0
				second: 0).
	^ ICRecurrenceRule fromICalString: 'FREQ=DAILY;UNTIL=', '', untilValue asICalUtcString, ';BYMONTH=1'

]

{ #category : #'rfc2445-rules' }
ICRFC2445ExamplesTests >> everyOtherDayForever [
	^ ICRecurrenceRule fromICalString: 'FREQ=DAILY;INTERVAL=2'
]

{ #category : #'rfc2445-rules' }
ICRFC2445ExamplesTests >> everyOtherWeekForever [
	^ ICRecurrenceRule fromICalString: 'FREQ=WEEKLY;INTERVAL=2;WKST=SU'
]

{ #category : #'rfc2445-rules' }
ICRFC2445ExamplesTests >> everyOtherYearJanFebMarFor10 [
	event
		start:
			(self dateAndTimeClass
				year: 1997
				month: 3
				day: 10
				hour: 9
				minute: 0
				second: 0).
	^ ICRecurrenceRule fromICalString: 'FREQ=YEARLY;INTERVAL=2;COUNT=10;BYMONTH=1,2,3'
]

{ #category : #'rfc2445-rules' }
ICRFC2445ExamplesTests >> everyThirdYearOnTheFirstHundrethTwoHundrethDayFor10 [
	event
		start:
			(self dateAndTimeClass
				year: 1997
				month: 1
				day: 1
				hour: 9
				minute: 0
				second: 0).
	^ ICRecurrenceRule fromICalString: 'FREQ=YEARLY;INTERVAL=3;COUNT=10;BYYEARDAY=1,100,200'
]

{ #category : #'rfc2445-rules' }
ICRFC2445ExamplesTests >> everyThuInJunJulAugForever [
	event
		start:
			(self dateAndTimeClass
				year: 1997
				month: 6
				day: 5
				hour: 9
				minute: 0
				second: 0).
	^ ICRecurrenceRule fromICalString: 'FREQ=YEARLY;BYDAY=TH;BYMONTH=6,7,8'
]

{ #category : #'rfc2445-rules' }
ICRFC2445ExamplesTests >> everyThuInMarchForever [
	event
		start:
			(self dateAndTimeClass
				year: 1997
				month: 3
				day: 13
				hour: 9
				minute: 0
				second: 0).
	^ ICRecurrenceRule fromICalString: 'FREQ=YEARLY;BYMONTH=3;BYDAY=TH'
]

{ #category : #'rfc2445-rules' }
ICRFC2445ExamplesTests >> everyTuesdayEveryOtherMonth [
	^ ICRecurrenceRule fromICalString: 'FREQ=MONTHLY;INTERVAL=2;BYDAY=TU'
]

{ #category : #'rfc2445-rules' }
ICRFC2445ExamplesTests >> everyTwentiethMondayForever [
	event
		start:
			(self dateAndTimeClass
				year: 1997
				month: 5
				day: 19
				hour: 9
				minute: 0
				second: 0).
	^ ICRecurrenceRule fromICalString: 'FREQ=YEARLY;BYDAY=20MO'
]

{ #category : #'rfc2445-rules' }
ICRFC2445ExamplesTests >> firstSatAfterFirstSunForever [
	event
		start:
			(self dateAndTimeClass
				year: 1997
				month: 9
				day: 13
				hour: 9
				minute: 0
				second: 0).
	^ ICRecurrenceRule fromICalString: 'FREQ=MONTHLY;BYDAY=SA;BYMONTHDAY=7,8,9,10,11,12,13'
]

{ #category : #'rfc2445-rules' }
ICRFC2445ExamplesTests >> fridayThirteenthForever [
	event
		addExclusionDate:
			(self dateAndTimeClass
				year: 1997
				month: 9
				day: 2
				hour: 9
				minute: 0
				second: 0).
	^ ICRecurrenceRule fromICalString: 'FREQ=MONTHLY;BYDAY=FR;BYMONTHDAY=13'
]

{ #category : #'rfc2445-rules' }
ICRFC2445ExamplesTests >> mondayOfWeek20Forever [
	event
		start:
			(self dateAndTimeClass
				year: 1997
				month: 5
				day: 12
				hour: 9
				minute: 0
				second: 0).
	^ ICRecurrenceRule fromICalString: 'FREQ=YEARLY;BYWEEKNO=20;BYDAY=MO'
]

{ #category : #'rfc2445-rules' }
ICRFC2445ExamplesTests >> monthyFirstAndLastDayFor10 [
	event
		start:
			(self dateAndTimeClass
				year: 1997
				month: 9
				day: 30
				hour: 9
				minute: 0
				second: 0).
	^ ICRecurrenceRule fromICalString: 'FREQ=MONTHLY;COUNT=10;BYMONTHDAY=1,-1'
]

{ #category : #'rfc2445-rules' }
ICRFC2445ExamplesTests >> monthyFirstAndLastSundayFor10 [
	event
		start:
			(self dateAndTimeClass
				year: 1997
				month: 9
				day: 7
				hour: 9
				minute: 0
				second: 0).
	^ ICRecurrenceRule fromICalString: 'FREQ=MONTHLY;INTERVAL=2;COUNT=10;BYDAY=1SU,-1SU'
]

{ #category : #'rfc2445-rules' }
ICRFC2445ExamplesTests >> monthyFirstFridayFor10 [
	event
		start:
			(self dateAndTimeClass
				year: 1997
				month: 9
				day: 5
				hour: 9
				minute: 0
				second: 0).
	^ ICRecurrenceRule fromICalString: 'FREQ=MONTHLY;COUNT=10;BYDAY=1FR'
]

{ #category : #'rfc2445-rules' }
ICRFC2445ExamplesTests >> monthyFirstFridayUntilDec24 [
	event
		start:
			(self dateAndTimeClass
				year: 1997
				month: 9
				day: 5
				hour: 9
				minute: 0
				second: 0).
	^ ICRecurrenceRule fromICalString: 'FREQ=MONTHLY;UNTIL=19971224T000000Z;BYDAY=1FR'
]

{ #category : #'rfc2445-rules' }
ICRFC2445ExamplesTests >> monthySecondAndFifteenthFor10 [
	^ ICRecurrenceRule fromICalString: 'FREQ=MONTHLY;COUNT=10;BYMONTHDAY=2,15'
]

{ #category : #'rfc2445-rules' }
ICRFC2445ExamplesTests >> monthySecondToLastMondayFor6Months [
	event
		start:
			(self dateAndTimeClass
				year: 1997
				month: 9
				day: 22
				hour: 9
				minute: 0
				second: 0).
	^ ICRecurrenceRule fromICalString: 'FREQ=MONTHLY;COUNT=6;BYDAY=-2MO'
]

{ #category : #'rfc2445-rules' }
ICRFC2445ExamplesTests >> monthyThirdToLastDayForever [
	event
		start:
			(self dateAndTimeClass
				year: 1997
				month: 9
				day: 28
				hour: 9
				minute: 0
				second: 0).
	^ ICRecurrenceRule fromICalString: 'FREQ=MONTHLY;BYMONTHDAY=-3'
]

{ #category : #'rfc2445-rules' }
ICRFC2445ExamplesTests >> mwfEveryOtherWeek [
	"  Every other week on Monday, Wednesday and Friday until December 24,
   1997, but starting on Tuesday, September 2, 1997:"

	^ ICRecurrenceRule fromICalString: 'FREQ=WEEKLY;INTERVAL=2;UNTIL=19971224T000000Z;WKST=SU;BYDAY=MO,WE,FR'
]

{ #category : #'rfc2445-rules' }
ICRFC2445ExamplesTests >> secondToLastWeekday [
	event
		start:
			(self dateAndTimeClass
				year: 1997
				month: 9
				day: 29
				hour: 9
				minute: 0
				second: 0).
	^ ICRecurrenceRule fromICalString: 'FREQ=MONTHLY;BYDAY=MO,TU,WE,TH,FR;BYSETPOS=-2'
]

{ #category : #'rfc2445-tests' }
ICRFC2445ExamplesTests >> testdailyUntilDec241997 [
	| schedule dates timespan end nextDate oneDay generatedDates |
	event addRecurrenceRule: self dailyUntilDec241997.
	schedule := ICSchedule fromEvent: event.
	dates := OrderedCollection new.
	nextDate := event start.
	end := self dateAndTimeClass
		year: 1997
		month: 12
		day: 24
		hour: 0
		minute: 0
		second: 0.
	oneDay := self durationClass seconds: 86400.
	[ nextDate < end ]
		whileTrue: [ 
			dates add: nextDate.
			nextDate := nextDate + oneDay ].
	generatedDates := schedule dates.
	generatedDates doWithIndex: [ :eachDate :index | self assert: eachDate equals: (dates at: index) ].
	self
		assert: generatedDates first
		equals:
			(self dateAndTimeClass
				year: 1997
				month: 9
				day: 2
				hour: 9
				minute: 0
				second: 0).
	self
		assert: generatedDates last
		equals:
			(self dateAndTimeClass
				year: 1997
				month: 12
				day: 23
				hour: 9
				minute: 0
				second: 0)
]

{ #category : #'rfc2445-tests' }
ICRFC2445ExamplesTests >> testevery10Days5Occurrences [
	| schedule dates timespan end nextDate duration generatedDates |
	event addRecurrenceRule: self every10Days5Occurrences.
	schedule := ICSchedule fromEvent: event.
	dates := OrderedCollection new.
	nextDate := event start.
	duration := self durationClass seconds: 864000.
	end := nextDate + (duration * 4).
	[ nextDate <= end ]
		whileTrue: [ 
			dates add: nextDate.
			nextDate := nextDate + duration ].
	generatedDates := schedule dates.
	generatedDates doWithIndex: [ :eachDate :index | self assert: eachDate equals: (dates at: index) ].
	self assert: generatedDates size equals: 5.
	self
		assert: generatedDates first
		equals:
			(self dateAndTimeClass
				year: 1997
				month: 9
				day: 2
				hour: 9
				minute: 0
				second: 0).
	self
		assert: generatedDates last
		equals:
			(self dateAndTimeClass
				year: 1997
				month: 10
				day: 12
				hour: 9
				minute: 0
				second: 0)
]

{ #category : #'rfc2445-tests' }
ICRFC2445ExamplesTests >> testevery15MinsFor6 [
	| schedule dates timespan end nextDate duration count generatedDates |
	event addRecurrenceRule: self every15MinsFor6.
	schedule := ICSchedule fromEvent: event.
	dates := OrderedCollection new.
	nextDate := event start.
	count := 6.
	duration := self durationClass seconds: 60 * 15.
	end := nextDate + (duration * count).
	[ nextDate < end ]
		whileTrue: [ 
			dates add: nextDate.
			nextDate := nextDate + duration ].
	generatedDates := schedule dates.
	generatedDates doWithIndex: [ :eachDate :index | self assert: eachDate equals: (dates at: index) ].
	self
		assert: generatedDates first
		equals:
			(self dateAndTimeClass
				year: 1997
				month: 9
				day: 2
				hour: 9
				minute: 0
				second: 0).
	self
		assert: generatedDates last
		equals:
			(self dateAndTimeClass
				year: 1997
				month: 9
				day: 2
				hour: 10
				minute: 15
				second: 0)
]

{ #category : #'rfc2445-tests' }
ICRFC2445ExamplesTests >> testevery18MonthsOnThe10thThrough15thFor10 [
	| schedule generatedDates |
	event addRecurrenceRule: self every18MonthsOnThe10thThrough15thFor10.
	schedule := ICSchedule fromEvent: event.
	generatedDates := schedule dates.
	self assert: generatedDates size equals: 10.
	generatedDates
		do: [ :eachDate | 
			self assert: eachDate dayOfMonth < 16.
			self assert: eachDate dayOfMonth > 9 ].
	self
		assert: generatedDates first
		equals:
			(self dateAndTimeClass
				year: 1997
				month: 9
				day: 10
				hour: 9
				minute: 0
				second: 0).
	self
		assert: generatedDates last
		equals:
			(self dateAndTimeClass
				year: 1999
				month: 3
				day: 13
				hour: 9
				minute: 0
				second: 0)
]

{ #category : #'rfc2445-tests' }
ICRFC2445ExamplesTests >> testevery20MinsBetween9AMAnd440PM [
	| schedule generatedDates days end |
	event addRecurrenceRule: self every20MinsBetween9AMAnd440PM.
	schedule := ICSchedule fromEvent: event.
	days := 2.
	end := event start + (self durationClass seconds: 86399 * days).
	generatedDates := schedule datesBetween: event start and: end.
	self assert: generatedDates size equals: 24 * days.
	generatedDates
		do: [ :eachDate | 
			self assert: eachDate minute \\ 20 equals: 0.
			self assert: eachDate hour > 8.
			self assert: eachDate hour < 17 ].
	self
		assert: generatedDates first
		equals:
			(self dateAndTimeClass
				year: 1997
				month: 9
				day: 2
				hour: 9
				minute: 0
				second: 0).
	self
		assert: generatedDates last
		equals:
			(self dateAndTimeClass
				year: 1997
				month: 9
				day: 3
				hour: 16
				minute: 40
				second: 0)
]

{ #category : #'rfc2445-tests' }
ICRFC2445ExamplesTests >> testevery3HoursOnADay [
	| schedule dates timespan end nextDate duration generatedDates |
	event addRecurrenceRule: self every3HoursOnADay.
	schedule := ICSchedule fromEvent: event.
	dates := OrderedCollection new.
	nextDate := event start.
	duration := self durationClass seconds: 3600 * 3.
	end := self every3HoursOnADay repetition.
	[ nextDate < end ]
		whileTrue: [ 
			dates add: nextDate.
			nextDate := nextDate + duration ].
	generatedDates := schedule dates.
	generatedDates doWithIndex: [ :eachDate :index | self assert: eachDate equals: (dates at: index) ].
	self
		assert: generatedDates first
		equals:
			(self dateAndTimeClass
				year: 1997
				month: 9
				day: 2
				hour: 9
				minute: 0
				second: 0).
	self
		assert: generatedDates last
		equals:
			(self dateAndTimeClass
				year: 1997
				month: 9
				day: 2
				hour: 15
				minute: 0
				second: 0)
]

{ #category : #'rfc2445-tests' }
ICRFC2445ExamplesTests >> testevery90MinsFor4 [
	| schedule dates timespan end nextDate duration count generatedDates |
	event addRecurrenceRule: self every90MinsFor4.
	schedule := ICSchedule fromEvent: event.
	dates := OrderedCollection new.
	nextDate := event start.
	count := 4.
	duration := self durationClass seconds: 60 * 90.
	end := nextDate + (duration * count).
	[ nextDate < end ]
		whileTrue: [ 
			dates add: nextDate.
			nextDate := nextDate + duration ].
	generatedDates := schedule dates.
	generatedDates doWithIndex: [ :eachDate :index | self assert: eachDate equals: (dates at: index) ].
	self
		assert: generatedDates first
		equals:
			(self dateAndTimeClass
				year: 1997
				month: 9
				day: 2
				hour: 9
				minute: 0
				second: 0).
	self
		assert: generatedDates last
		equals:
			(self dateAndTimeClass
				year: 1997
				month: 9
				day: 2
				hour: 13
				minute: 30
				second: 0)
]

{ #category : #'rfc2445-tests' }
ICRFC2445ExamplesTests >> testeveryDayFor10 [
	| schedule dates generatedDates |
	event addRecurrenceRule: self everyDayFor10.
	schedule := ICSchedule fromEvent: event.
	dates := (0 to: 9) collect: [ :each | event start + (self durationClass days: each) ].
	generatedDates := schedule dates.
	generatedDates doWithIndex: [ :eachDate :index | self assert: eachDate equals: (dates at: index) ].
	self
		assert: generatedDates first
		equals:
			(self dateAndTimeClass
				year: 1997
				month: 9
				day: 2
				hour: 9
				minute: 0
				second: 0).
	self
		assert: generatedDates last
		equals:
			(self dateAndTimeClass
				year: 1997
				month: 9
				day: 11
				hour: 9
				minute: 0
				second: 0)
]

{ #category : #'rfc2445-tests' }
ICRFC2445ExamplesTests >> testeveryDayInJanuaryFor3Years [
	| schedule generatedDates days end |
	event addRecurrenceRule: self everyDayInJanuaryFor3Years.
	schedule := ICSchedule fromEvent: event.
	generatedDates := schedule dates.
	self assert: generatedDates size equals: 31 * 3.
	generatedDates
		do: [ :eachDate | 
			self assert: eachDate month equals: 1.
			self assert: eachDate year < 2007 ].
	self
		assert: generatedDates first
		equals:
			(self dateAndTimeClass
				year: 1998
				month: 1
				day: 1
				hour: 9
				minute: 0
				second: 0).
	self
		assert: generatedDates last
		equals:
			(self dateAndTimeClass
				year: 2000
				month: 1
				day: 31
				hour: 9
				minute: 0
				second: 0)
]

{ #category : #'rfc2445-tests' }
ICRFC2445ExamplesTests >> testeveryDayInJanuaryFor3Years1 [
	| schedule generatedDates days end |
	event addRecurrenceRule: self everyDayInJanuaryFor3Years1.
	schedule := ICSchedule fromEvent: event.
	generatedDates := schedule dates.
	self assert: generatedDates size equals: 93.
	generatedDates
		do: [ :eachDate | 
			self assert: eachDate month equals: 1.
			self assert: eachDate year < 2007 ].
	self
		assert: generatedDates first
		equals:
			(self dateAndTimeClass
				year: 1998
				month: 1
				day: 1
				hour: 9
				minute: 0
				second: 0).
	self
		assert: generatedDates last
		equals:
			(self dateAndTimeClass
				year: 2000
				month: 1
				day: 31
				hour: 9
				minute: 0
				second: 0)
]

{ #category : #'rfc2445-tests' }
ICRFC2445ExamplesTests >> testeveryOtherDayForever [
	| schedule generatedDates days end scheduleDuration |
	event addRecurrenceRule: self everyOtherDayForever.
	schedule := ICSchedule fromEvent: event.
	days := 20.
	scheduleDuration := self durationClass seconds: 86400 * days.
	end := event start + scheduleDuration.
	generatedDates := schedule datesBetween: event start and: end.
	self assert: generatedDates size equals: days / 2 + 1.
	self assert: (generatedDates last - generatedDates first) / days equals: scheduleDuration / days.
	self
		assert: generatedDates first
		equals:
			(self dateAndTimeClass
				year: 1997
				month: 9
				day: 2
				hour: 9
				minute: 0
				second: 0).
	self
		assert: generatedDates fourth
		equals:
			(self dateAndTimeClass
				year: 1997
				month: 9
				day: 8
				hour: 9
				minute: 0
				second: 0)
]

{ #category : #'rfc2445-tests' }
ICRFC2445ExamplesTests >> testeveryOtherWeekForever [
	| schedule generatedDates weeks end scheduleDuration |
	event addRecurrenceRule: self everyOtherWeekForever.
	schedule := ICSchedule fromEvent: event.
	weeks := 21.
	scheduleDuration := self durationClass seconds: 86400 * 7 * weeks.
	end := event start + scheduleDuration.
	generatedDates := schedule datesBetween: event start and: end.
	self assert: generatedDates size equals: (weeks +1 / 2)   .

	self
		assert: generatedDates first
		equals:
			(self dateAndTimeClass
				year: 1997
				month: 9
				day: 2
				hour: 9
				minute: 0
				second: 0).
	self
		assert: generatedDates last
		equals:
			(self dateAndTimeClass
				year: 1998
				month: 1
				day: 20
				hour: 9
				minute: 0
				second: 0)
]

{ #category : #'rfc2445-tests' }
ICRFC2445ExamplesTests >> testeveryOtherYearJanFebMarFor10 [
	| schedule generatedDates dates timespan end nextDate duration count |
	event addRecurrenceRule: self everyOtherYearJanFebMarFor10.
	schedule := ICSchedule fromEvent: event.
	dates := OrderedCollection new.
	count := 10.
	generatedDates := schedule dates.
	self assert: generatedDates size equals: count.
	generatedDates
		do: [ :eachDate | 
			self assert: (#(1 2 3) includes: eachDate month).
			self assert: eachDate dayOfMonth equals: event start dayOfMonth ].
	self
		assert: generatedDates first
		equals:
			(self dateAndTimeClass
				year: 1997
				month: 3
				day: 10
				hour: 9
				minute: 0
				second: 0).
	self
		assert: generatedDates last
		equals:
			(self dateAndTimeClass
				year: 2003
				month: 3
				day: 10
				hour: 9
				minute: 0
				second: 0)
]

{ #category : #'rfc2445-tests' }
ICRFC2445ExamplesTests >> testeveryThirdYearOnTheFirstHundrethTwoHundrethDayFor10 [
	| schedule generatedDates dates timespan end nextDate duration count |
	event addRecurrenceRule: self everyThirdYearOnTheFirstHundrethTwoHundrethDayFor10.
	schedule := ICSchedule fromEvent: event.
	dates := OrderedCollection new.
	count := 10.
	generatedDates := schedule dates.
	self assert: generatedDates size equals: count.
	generatedDates do: [ :eachDate | self assert: (#(1 100 200) includes: eachDate dayOfYear) ].
	self
		assert: generatedDates first
		equals:
			(self dateAndTimeClass
				year: 1997
				month: 1
				day: 1
				hour: 9
				minute: 0
				second: 0).
	self
		assert: generatedDates last
		equals:
			(self dateAndTimeClass
				year: 2006
				month: 1
				day: 1
				hour: 9
				minute: 0
				second: 0)
]

{ #category : #'rfc2445-tests' }
ICRFC2445ExamplesTests >> testeveryThuInJunJulAugForever [
	| schedule generatedDates years end scheduleDuration |
	event addRecurrenceRule: self everyThuInJunJulAugForever.
	schedule := ICSchedule fromEvent: event.
	end:=	(self dateAndTimeClass
				year: 1999
				month: 12
				day: 31
				hour: 9
				minute: 0
				second: 0).
	generatedDates := schedule datesBetween: event start and: end.
	self assert: generatedDates size equals: 39.
	generatedDates
		do: [ :eachDate | 
			self assert: eachDate dayOfWeek equals: 5.
			self assert: (#(6 7 8) includes: eachDate month) ].
	self
		assert: generatedDates first
		equals:
			(self dateAndTimeClass
				year: 1997
				month: 6
				day: 5
				hour: 9
				minute: 0
				second: 0).
	self
		assert: generatedDates last
		equals:
			(self dateAndTimeClass
				year: 1999
				month: 8
				day: 26
				hour: 9
				minute: 0
				second: 0)
]

{ #category : #'rfc2445-tests' }
ICRFC2445ExamplesTests >> testeveryThuInMarchForever [
	| schedule generatedDates years end scheduleDuration |
	event addRecurrenceRule: self everyThuInMarchForever.
	schedule := ICSchedule fromEvent: event.
	end:=(self dateAndTimeClass year: 1999 month:4  day: 1 hour: 9 minute:0  second:0 ).
	generatedDates := schedule datesBetween: event start and: end.
	self assert: generatedDates size equals: 11.
	generatedDates
		do: [ :eachDate | 
			self assert: eachDate dayOfWeek equals: 5.
			self assert: eachDate month equals: 3 ].
	self
		assert: generatedDates first
		equals:
			(self dateAndTimeClass
				year: 1997
				month: 3
				day: 13
				hour: 9
				minute: 0
				second: 0).
	self
		assert: generatedDates last
		equals:
			(self dateAndTimeClass
				year: 1999
				month: 3
				day: 25
				hour: 9
				minute: 0
				second: 0)
]

{ #category : #'rfc2445-tests' }
ICRFC2445ExamplesTests >> testeveryTuesdayEveryOtherMonth [
	| schedule generatedDates years end scheduleDuration |
	event addRecurrenceRule: self everyTuesdayEveryOtherMonth.
	schedule := ICSchedule fromEvent: event.
	years := 7 / 12.
	scheduleDuration := self durationClass seconds: 86400 * years * 365.
	end := event start + scheduleDuration.
	generatedDates := schedule datesBetween: event start and: end.
	self assert: generatedDates size equals: 18.
	generatedDates do: [ :eachDate | self assert: eachDate dayOfWeek equals: 3 ].
	self
		assert: generatedDates first
		equals:
			(self dateAndTimeClass
				year: 1997
				month: 9
				day: 2
				hour: 9
				minute: 0
				second: 0).
	self
		assert: generatedDates last
		equals:
			(self dateAndTimeClass
				year: 1998
				month: 3
				day: 31
				hour: 9
				minute: 0
				second: 0)
]

{ #category : #'rfc2445-tests' }
ICRFC2445ExamplesTests >> testeveryTwentiethMondayForever [
	| schedule generatedDates years end scheduleDuration |
	event addRecurrenceRule: self everyTwentiethMondayForever.
	schedule := ICSchedule fromEvent: event.
		end := self dateAndTimeClass
		year: 1999
		month: 6
		day: 1
		hour: 9
		minute: 0
		second: 0.
	generatedDates := schedule datesBetween: event start and: end.
	self assert: generatedDates size equals: 3.
	generatedDates do: [ :eachDate | self assert: eachDate dayOfWeekName equals: #Monday ].
	self
		assert: generatedDates first
		equals:
			(self dateAndTimeClass
				year: 1997
				month: 5
				day: 19
				hour: 9
				minute: 0
				second: 0).
	self
		assert: generatedDates last
		equals:
			(self dateAndTimeClass
				year: 1999
				month: 5
				day: 17
				hour: 9
				minute: 0
				second: 0)
]

{ #category : #'rfc2445-tests' }
ICRFC2445ExamplesTests >> testfirstSatAfterFirstSunForever [
	| schedule generatedDates months end scheduleDuration |
	event addRecurrenceRule: self firstSatAfterFirstSunForever.
	schedule := ICSchedule fromEvent: event.
	end := self dateAndTimeClass
		year: 1998
		month: 7
		day: 1
		hour: 9
		minute: 0
		second: 0.
	generatedDates := schedule datesBetween: event start and: end.
	self assert: generatedDates size equals: 10.
	generatedDates
		do: [ :eachDate | 
			self assert: eachDate dayOfWeek equals: 7.
			self assert: eachDate dayOfMonth > 6.
			self assert: eachDate dayOfMonth < 14 ].
	self
		assert: generatedDates first
		equals:
			(self dateAndTimeClass
				year: 1997
				month: 9
				day: 13
				hour: 9
				minute: 0
				second: 0).
	self
		assert: generatedDates last
		equals:
			(self dateAndTimeClass
				year: 1998
				month: 6
				day: 13
				hour: 9
				minute: 0
				second: 0)
]

{ #category : #'rfc2445-tests' }
ICRFC2445ExamplesTests >> testfridayThirteenthForever [
	| schedule generatedDates years end scheduleDuration |
	event addRecurrenceRule: self fridayThirteenthForever.
	schedule := ICSchedule fromEvent: event.
		end := self dateAndTimeClass
		year: 2000
		month: 11
		day: 1
		hour: 9
		minute: 0
		second: 0.
	generatedDates := schedule datesBetween: event start and: end.
	self assert: generatedDates size equals: 5.
	generatedDates
		do: [ :eachDate | 
			self assert: eachDate dayOfWeek equals: 6.
			self assert: eachDate dayOfMonth equals: 13 ].
	self
		assert: generatedDates first
		equals:
			(self dateAndTimeClass
				year: 1998
				month: 2
				day: 13
				hour: 9
				minute: 0
				second: 0).
	self
		assert: generatedDates last
		equals:
			(self dateAndTimeClass
				year: 2000
				month: 10
				day: 13
				hour: 9
				minute: 0
				second: 0)
]

{ #category : #'rfc2445-tests' }
ICRFC2445ExamplesTests >> testmondayOfWeek20Forever [
	| schedule generatedDates years end scheduleDuration |
	event addRecurrenceRule: self mondayOfWeek20Forever.
	schedule := ICSchedule fromEvent: event.
	years := 3.
	scheduleDuration := self durationClass seconds: 86400 * years * 365.
	end := event start + scheduleDuration.
	generatedDates := schedule datesBetween: event start and: end.
	self assert: generatedDates size equals: years.
	generatedDates do: [ :eachDate | self assert: eachDate dayOfWeek equals: 2 ].
	self
		assert: generatedDates first
		equals:
			(self dateAndTimeClass
				year: 1997
				month: 5
				day: 12
				hour: 9
				minute: 0
				second: 0).
	self
		assert: generatedDates last
		equals:
			(self dateAndTimeClass
				year: 1999
				month: 5
				day: 17
				hour: 9
				minute: 0
				second: 0)
]

{ #category : #'rfc2445-tests' }
ICRFC2445ExamplesTests >> testmonthyFirstAndLastDayFor10 [
	| schedule generatedDates dates timespan end nextDate duration count |
	event addRecurrenceRule: self monthyFirstAndLastDayFor10.
	schedule := ICSchedule fromEvent: event.
	dates := OrderedCollection new.
	count := 10.
	generatedDates := schedule dates.
	self assert: generatedDates size equals: count.
	generatedDates
		do: [ :eachDate | self assert: (eachDate dayOfMonth = 1 or: [ eachDate dayOfMonth = eachDate daysInMonth ]) ].
	self
		assert: generatedDates first
		equals:
			(self dateAndTimeClass
				year: 1997
				month: 9
				day: 30
				hour: 9
				minute: 0
				second: 0).
	self
		assert: generatedDates last
		equals:
			(self dateAndTimeClass
				year: 1998
				month: 2
				day: 1
				hour: 9
				minute: 0
				second: 0)
]

{ #category : #'rfc2445-tests' }
ICRFC2445ExamplesTests >> testmonthyFirstAndLastSundayFor10 [
	| schedule generatedDates dates timespan end nextDate duration count |
	event addRecurrenceRule: self monthyFirstAndLastSundayFor10.
	schedule := ICSchedule fromEvent: event.
	dates := OrderedCollection new.
	count := 10.
	generatedDates := schedule dates.
	self assert: generatedDates size equals: count.
	generatedDates do: [ :eachDate | self assert: eachDate dayOfWeek equals: 1 ].
	self
		assert: generatedDates first
		equals:
			(self dateAndTimeClass
				year: 1997
				month: 9
				day: 7
				hour: 9
				minute: 0
				second: 0).
	self
		assert: generatedDates last
		equals:
			(self dateAndTimeClass
				year: 1998
				month: 5
				day: 31
				hour: 9
				minute: 0
				second: 0)
]

{ #category : #'rfc2445-tests' }
ICRFC2445ExamplesTests >> testmonthyFirstFridayFor10 [
	| schedule generatedDates dates timespan end nextDate duration count |
	event addRecurrenceRule: self monthyFirstFridayFor10.
	schedule := ICSchedule fromEvent: event.
	dates := OrderedCollection new.
	count := 10.
	generatedDates := schedule dates.
	self assert: generatedDates size equals: count.
	generatedDates do: [ :eachDate | self assert: eachDate dayOfWeek equals: 6 ].
	self
		assert: generatedDates first
		equals:
			(self dateAndTimeClass
				year: 1997
				month: 9
				day: 5
				hour: 9
				minute: 0
				second: 0).
	self
		assert: generatedDates last
		equals:
			(self dateAndTimeClass
				year: 1998
				month: 6
				day: 5
				hour: 9
				minute: 0
				second: 0)
]

{ #category : #'rfc2445-tests' }
ICRFC2445ExamplesTests >> testmonthyFirstFridayUntilDec24 [
	| schedule generatedDates dates timespan end nextDate duration count |
	event addRecurrenceRule: self monthyFirstFridayUntilDec24.
	schedule := ICSchedule fromEvent: event.
	dates := OrderedCollection new.
	generatedDates := schedule dates.
	self assert: generatedDates size equals: 4.
	generatedDates do: [ :eachDate | self assert: eachDate dayOfWeek equals: 6 ].
	self
		assert: generatedDates first
		equals:
			(self dateAndTimeClass
				year: 1997
				month: 9
				day: 5
				hour: 9
				minute: 0
				second: 0).
	self
		assert: generatedDates last
		equals:
			(self dateAndTimeClass
				year: 1997
				month: 12
				day: 5
				hour: 9
				minute: 0
				second: 0)
]

{ #category : #'rfc2445-tests' }
ICRFC2445ExamplesTests >> testmonthySecondAndFifteenthFor10 [
	| schedule generatedDates dates timespan end nextDate duration count |
	event addRecurrenceRule: self monthySecondAndFifteenthFor10.
	schedule := ICSchedule fromEvent: event.
	dates := OrderedCollection new.
	count := 10.
	generatedDates := schedule dates.
	self assert: generatedDates size equals: count.
	generatedDates do: [ :eachDate | self assert: (#(2 15) includes: eachDate dayOfMonth) ].
	self
		assert: generatedDates first
		equals:
			(self dateAndTimeClass
				year: 1997
				month: 9
				day: 2
				hour: 9
				minute: 0
				second: 0).
	self
		assert: generatedDates last
		equals:
			(self dateAndTimeClass
				year: 1998
				month: 1
				day: 15
				hour: 9
				minute: 0
				second: 0)
]

{ #category : #'rfc2445-tests' }
ICRFC2445ExamplesTests >> testmonthySecondToLastMondayFor6Months [
	| schedule generatedDates dates timespan end nextDate duration count |
	event addRecurrenceRule: self monthySecondToLastMondayFor6Months.
	schedule := ICSchedule fromEvent: event.
	dates := OrderedCollection new.
	generatedDates := schedule dates.
	self assert: generatedDates size equals: 6.
	generatedDates do: [ :eachDate | self assert: eachDate dayOfWeekName equals: #Monday ].
	self
		assert: generatedDates first
		equals:
			(self dateAndTimeClass
				year: 1997
				month: 9
				day: 22
				hour: 9
				minute: 0
				second: 0).
	self
		assert: generatedDates last
		equals:
			(self dateAndTimeClass
				year: 1998
				month: 2
				day: 16
				hour: 9
				minute: 0
				second: 0)
]

{ #category : #'rfc2445-tests' }
ICRFC2445ExamplesTests >> testmonthyThirdToLastDayForever [
	| schedule generatedDates months end scheduleDuration |
	event addRecurrenceRule: self monthyThirdToLastDayForever.
	schedule := ICSchedule fromEvent: event.
		end := self dateAndTimeClass
		year: 1998
		month: 3
		day: 1
		hour: 9
		minute: 0
		second: 0.
	generatedDates := schedule datesBetween: event start and: end.
	self assert: generatedDates size equals: 6.
	generatedDates do: [ :eachDate | self assert: eachDate dayOfMonth equals: eachDate daysInMonth - 2 ].
	self
		assert: generatedDates first
		equals:
			(self dateAndTimeClass
				year: 1997
				month: 9
				day: 28
				hour: 9
				minute: 0
				second: 0).
	self
		assert: generatedDates last
		equals:
			(self dateAndTimeClass
				year: 1998
				month: 2
				day: 26
				hour: 9
				minute: 0
				second: 0)
]

{ #category : #'rfc2445-tests' }
ICRFC2445ExamplesTests >> testmwfEveryOtherWeek [
	| schedule generatedDates dates timespan end nextDate duration count |
	event addRecurrenceRule: self mwfEveryOtherWeek.
	schedule := ICSchedule fromEvent: event.
	dates := OrderedCollection new.
	generatedDates := schedule dates.

	self assert: generatedDates size equals: 25.
	self
		assert: generatedDates first
		equals:
			(self dateAndTimeClass
				year: 1997
				month: 9
				day: 2
				hour: 9
				minute: 0
				second: 0).
	self
		assert: generatedDates last
		equals:
			(self dateAndTimeClass
				year: 1997
				month: 12
				day: 22
				hour: 9
				minute: 0
				second: 0)
]

{ #category : #'rfc2445-tests' }
ICRFC2445ExamplesTests >> testsecondToLastWeekday [
	| schedule generatedDates months end scheduleDuration |
	event addRecurrenceRule: self secondToLastWeekday.
	schedule := ICSchedule fromEvent: event.
	end := self dateAndTimeClass
		year: 1998
		month: 4
		day: 1
		hour: 9
		minute: 0
		second: 0.
	generatedDates := schedule datesBetween: event start and: end.
	generatedDates do: [ :eachDate | self assert: (#(2 3 4 5 6) includes: eachDate dayOfWeek) ].
	self assert: generatedDates size equals: 7.
	self
		assert: generatedDates first
		equals:
			(self dateAndTimeClass
				year: 1997
				month: 9
				day: 29
				hour: 9
				minute: 0
				second: 0).
	self
		assert: generatedDates last
		equals:
			(self dateAndTimeClass
				year: 1998
				month: 3
				day: 30
				hour: 9
				minute: 0
				second: 0)
]

{ #category : #'rfc2445-tests' }
ICRFC2445ExamplesTests >> testthirdTuesWedsOrThursForNextThreeMonths [
	| schedule generatedDates dates timespan end nextDate duration count |
	event addRecurrenceRule: self thirdTuesWedsOrThursForNextThreeMonths.
	schedule := ICSchedule fromEvent: event.
	dates := OrderedCollection new.
	count := 3.
	generatedDates := schedule dates.
	self assert: generatedDates size equals: count.
	generatedDates do: [ :eachDate | self assert: (#(3 4 5) includes: eachDate dayOfWeek) ].
	self
		assert: generatedDates first
		equals:
			(self dateAndTimeClass
				year: 1997
				month: 9
				day: 4
				hour: 9
				minute: 0
				second: 0).
	self
		assert: generatedDates last
		equals:
			(self dateAndTimeClass
				year: 1997
				month: 11
				day: 6
				hour: 9
				minute: 0
				second: 0)
]

{ #category : #'rfc2445-tests' }
ICRFC2445ExamplesTests >> testtuThEveryOtherWeekFor8 [
	| schedule generatedDates dates timespan end nextDate duration count |
	event addRecurrenceRule: self tuThEveryOtherWeekFor8.
	schedule := ICSchedule fromEvent: event.
	dates := OrderedCollection new.
	count := 8.
	generatedDates := schedule dates.
	generatedDates do: [ :eachDate | self assert: (#(3 5) includes: eachDate dayOfWeek) ].
	self assert: generatedDates size equals: count.
	self
		assert: generatedDates first
		equals:
			(self dateAndTimeClass
				year: 1997
				month: 9
				day: 2
				hour: 9
				minute: 0
				second: 0).
	self
		assert: generatedDates last
		equals:
			(self dateAndTimeClass
				year: 1997
				month: 10
				day: 16
				hour: 9
				minute: 0
				second: 0)
]

{ #category : #'rfc2445-tests' }
ICRFC2445ExamplesTests >> testusPresidentialElectionDay [
	| schedule generatedDates years end scheduleDuration |
	event addRecurrenceRule: self usPresidentialElectionDay.
	schedule := ICSchedule fromEvent: event.
	years := 9.
	scheduleDuration := self durationClass seconds: 86400 * years * 366.
	end := event start + scheduleDuration.
	generatedDates := schedule datesBetween: event start and: end.
	self assert: generatedDates size equals: years // 4 + 1.
	generatedDates do: [ :eachDate | self assert: eachDate dayOfWeek equals: 3 ].
	self
		assert: generatedDates first
		equals:
			(self dateAndTimeClass
				year: 1996
				month: 11
				day: 5
				hour: 9
				minute: 0
				second: 0).
	self
		assert: generatedDates last
		equals:
			(self dateAndTimeClass
				year: 2004
				month: 11
				day: 2
				hour: 9
				minute: 0
				second: 0)
]

{ #category : #'rfc2445-tests' }
ICRFC2445ExamplesTests >> testweekStartTest1 [
	| schedule generatedDates dates timespan end nextDate duration count |
	event addRecurrenceRule: self weekStartTest1.
	schedule := ICSchedule fromEvent: event.
	dates := OrderedCollection new.
	count := 4.
	generatedDates := schedule dates.
	self assert: generatedDates size equals: count.
	generatedDates do: [ :eachDate | self assert: (#(3 1) includes: eachDate dayOfWeek) ].
	self
		assert: generatedDates first
		equals:
			(self dateAndTimeClass
				year: 1997
				month: 8
				day: 5
				hour: 9
				minute: 0
				second: 0).
	self
		assert: generatedDates last
		equals:
			(self dateAndTimeClass
				year: 1997
				month: 8
				day: 24
				hour: 9
				minute: 0
				second: 0)
]

{ #category : #'rfc2445-tests' }
ICRFC2445ExamplesTests >> testweekStartTest2 [
	| schedule generatedDates dates timespan end nextDate duration count |
	event addRecurrenceRule: self weekStartTest2.
	schedule := ICSchedule fromEvent: event.
	dates := OrderedCollection new.
	count := 4.
	generatedDates := schedule dates.
	self assert: generatedDates size equals: count.
	generatedDates do: [ :eachDate | self assert: (#(3 1) includes: eachDate dayOfWeek) ].
	self
		assert: generatedDates first
		equals:
			(self dateAndTimeClass
				year: 1997
				month: 8
				day: 5
				hour: 9
				minute: 0
				second: 0).
	self
		assert: generatedDates last
		equals:
			(self dateAndTimeClass
				year: 1997
				month: 8
				day: 31
				hour: 9
				minute: 0
				second: 0)
]

{ #category : #'rfc2445-tests' }
ICRFC2445ExamplesTests >> testweeklyFor10Count [
	| schedule generatedDates dates timespan end nextDate duration count |
	event addRecurrenceRule: self weeklyFor10Count.
	schedule := ICSchedule fromEvent: event.
	dates := OrderedCollection new.
	count := 10.
	generatedDates := schedule dates.
	self assert: generatedDates size equals: count.
	generatedDates do: [ :eachDate | self assert: eachDate dayOfWeek equals: event start dayOfWeek ].
	self
		assert: generatedDates second
		equals:
			(self dateAndTimeClass
				year: 1997
				month: 9
				day: 9
				hour: 9
				minute: 0
				second: 0).
	self
		assert: generatedDates last
		equals:
			(self dateAndTimeClass
				year: 1997
				month: 11
				day: 4
				hour: 9
				minute: 0
				second: 0)
]

{ #category : #'rfc2445-tests' }
ICRFC2445ExamplesTests >> testweeklyTueThurFor5Wk1 [
	| schedule generatedDates dates timespan end nextDate duration count |
	event addRecurrenceRule: self weeklyTueThurFor5Wk1.
	schedule := ICSchedule fromEvent: event.
	dates := OrderedCollection new.
	count := 10.
	generatedDates := schedule dates.
	self assert: generatedDates size equals: count.
	generatedDates do: [ :eachDate | self assert: (#(3 5) includes: eachDate dayOfWeek) ].
	self
		assert: generatedDates first
		equals:
			(self dateAndTimeClass
				year: 1997
				month: 9
				day: 2
				hour: 9
				minute: 0
				second: 0).
	self
		assert: generatedDates last
		equals:
			(self dateAndTimeClass
				year: 1997
				month: 10
				day: 2
				hour: 9
				minute: 0
				second: 0)
]

{ #category : #'rfc2445-tests' }
ICRFC2445ExamplesTests >> testweeklyTueThurFor5Wk2 [
	| schedule generatedDates dates timespan end nextDate duration count |
	event addRecurrenceRule: self weeklyTueThurFor5Wk2.
	schedule := ICSchedule fromEvent: event.
	dates := OrderedCollection new.
	count := 10.
	generatedDates := schedule dates.
	generatedDates do: [ :eachDate | self assert: (#(3 5) includes: eachDate dayOfWeek) ].
	self assert: generatedDates size equals: count.
	self
		assert: generatedDates first
		equals:
			(self dateAndTimeClass
				year: 1997
				month: 9
				day: 2
				hour: 9
				minute: 0
				second: 0).
	self
		assert: generatedDates last
		equals:
			(self dateAndTimeClass
				year: 1997
				month: 10
				day: 2
				hour: 9
				minute: 0
				second: 0)
]

{ #category : #'rfc2445-tests' }
ICRFC2445ExamplesTests >> testweeklyUntilDec24 [
	| schedule generatedDates dates timespan end nextDate duration count |
	event addRecurrenceRule: self weeklyUntilDec24.
	schedule := ICSchedule fromEvent: event.
	dates := OrderedCollection new.
	generatedDates := schedule dates.
	self assert: generatedDates size equals: 17.
	generatedDates do: [ :eachDate | self assert: eachDate dayOfWeek equals: event start dayOfWeek ].
	self
		assert: generatedDates first
		equals:
			(self dateAndTimeClass
				year: 1997
				month: 9
				day: 2
				hour: 9
				minute: 0
				second: 0).
	self
		assert: generatedDates last
		equals:
			(self dateAndTimeClass
				year: 1997
				month: 12
				day: 23
				hour: 9
				minute: 0
				second: 0)
]

{ #category : #'rfc2445-tests' }
ICRFC2445ExamplesTests >> testyearlyJuneAndJulyFor10 [
	| schedule generatedDates dates timespan end nextDate duration count |
	event addRecurrenceRule: self yearlyJuneAndJulyFor10.
	schedule := ICSchedule fromEvent: event.
	dates := OrderedCollection new.
	count := 10.
	generatedDates := schedule dates.
	generatedDates do: [ :eachDate | self assert: (#(6 7) includes: eachDate month) ].
	self assert: generatedDates size equals: count.
	self
		assert: generatedDates first
		equals:
			(self dateAndTimeClass
				year: 1997
				month: 6
				day: 10
				hour: 9
				minute: 0
				second: 0).
	self
		assert: generatedDates last
		equals:
			(self dateAndTimeClass
				year: 2001
				month: 7
				day: 10
				hour: 9
				minute: 0
				second: 0)
]

{ #category : #'rfc2445-rules' }
ICRFC2445ExamplesTests >> thirdTuesWedsOrThursForNextThreeMonths [
	event
		start:
			(self dateAndTimeClass
				year: 1997
				month: 9
				day: 4
				hour: 9
				minute: 0
				second: 0).
	^ ICRecurrenceRule fromICalString: 'FREQ=MONTHLY;COUNT=3;BYDAY=TU,WE,TH;BYSETPOS=3'
]

{ #category : #'rfc2445-rules' }
ICRFC2445ExamplesTests >> tuThEveryOtherWeekFor8 [
	^ ICRecurrenceRule fromICalString: 'FREQ=WEEKLY;INTERVAL=2;COUNT=8;WKST=SU;BYDAY=TU,TH'
]

{ #category : #'rfc2445-rules' }
ICRFC2445ExamplesTests >> usPresidentialElectionDay [
	event
		start:
			(self dateAndTimeClass
				year: 1996
				month: 11
				day: 5
				hour: 9
				minute: 0
				second: 0).
	^ ICRecurrenceRule fromICalString: 'FREQ=YEARLY;INTERVAL=4;BYMONTH=11;BYDAY=TU;BYMONTHDAY=2,3,4,5,6,7,8'
]

{ #category : #'rfc2445-rules' }
ICRFC2445ExamplesTests >> weekStartTest1 [
	event
		start:
			(self dateAndTimeClass
				year: 1997
				month: 8
				day: 5
				hour: 9
				minute: 0
				second: 0).
	^ ICRecurrenceRule fromICalString: 'FREQ=WEEKLY;INTERVAL=2;COUNT=4;BYDAY=TU,SU;WKST=MO'
]

{ #category : #'rfc2445-rules' }
ICRFC2445ExamplesTests >> weekStartTest2 [
	event
		start:
			(self dateAndTimeClass
				year: 1997
				month: 8
				day: 5
				hour: 9
				minute: 0
				second: 0).
	^ ICRecurrenceRule fromICalString: 'FREQ=WEEKLY;INTERVAL=2;COUNT=4;BYDAY=TU,SU;WKST=SU'
]

{ #category : #'rfc2445-rules' }
ICRFC2445ExamplesTests >> weeklyFor10Count [
	^ ICRecurrenceRule fromICalString: 'FREQ=WEEKLY;COUNT=10'
]

{ #category : #'rfc2445-rules' }
ICRFC2445ExamplesTests >> weeklyTueThurFor5Wk1 [
	^ ICRecurrenceRule fromICalString: 'FREQ=WEEKLY;UNTIL=19971007T000000Z;WKST=SU;BYDAY=TU,TH'
]

{ #category : #'rfc2445-rules' }
ICRFC2445ExamplesTests >> weeklyTueThurFor5Wk2 [
	^ ICRecurrenceRule fromICalString: 'FREQ=WEEKLY;COUNT=10;WKST=SU;BYDAY=TU,TH'
]

{ #category : #'rfc2445-rules' }
ICRFC2445ExamplesTests >> weeklyUntilDec24 [
	^ ICRecurrenceRule fromICalString: 'FREQ=WEEKLY;UNTIL=19971224T000000Z'
]

{ #category : #'rfc2445-rules' }
ICRFC2445ExamplesTests >> yearlyJuneAndJulyFor10 [
	event
		start:
			(self dateAndTimeClass
				year: 1997
				month: 6
				day: 10
				hour: 9
				minute: 0
				second: 0).
	^ ICRecurrenceRule fromICalString: 'FREQ=YEARLY;COUNT=10;BYMONTH=6,7'
]
