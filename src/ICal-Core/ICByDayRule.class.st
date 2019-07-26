Class {
	#name : #ICByDayRule,
	#superclass : #ICOrdinalByRule,
	#category : 'ICal-Core-Model-Schedule'
}

{ #category : #growing }
ICByDayRule >> datesForMonthFrom: existingDates with: byValue [
	| lastDay nextDay dates startOfMonth  |
	^ existingDates
		gather: [ :eachExistingDate | 
			startOfMonth :=self startOfMonthFor: eachExistingDate .
			dates := OrderedCollection new.
			lastDay := startOfMonth daysInMonth.
			byValue isString
				ifTrue: [ 
					
					nextDay := self nextOccuranceOf: byValue starting: startOfMonth plus: 1.
					nextDay > lastDay
						ifTrue: [ nextDay := nextDay - 7 ].
					[ nextDay <= lastDay ]
						whileTrue: [ 
							dates add: (self newDateForMonthContaining: startOfMonth on: nextDay).
							nextDay := nextDay + 7 ] ]
				ifFalse: [ 
					nextDay := self ordinalOccuranceOf: byValue inSamePeriodAs: startOfMonth limitedTo: lastDay.
					dates add: (self newDateForMonthContaining: startOfMonth on: nextDay) ].
			dates ]
]

{ #category : #growing }
ICByDayRule >> datesForSingleDayFrom: existingDates with: byValue [
	| nextDay |
	^ existingDates
		collect: [ :eachExistingDate | 
			nextDay := self nextOccuranceOf: byValue starting: eachExistingDate plus: eachExistingDate dayOfMonth.
			self newDateForMonthContaining: eachExistingDate on: nextDay ]
]

{ #category : #growing }
ICByDayRule >> datesForWeekFrom: existingDates with: byValue [
	| nextDay newDayOfMonth month year startOfWeek |
	^ existingDates
		collect: [ :eachExistingDate | 
			startOfWeek:=self startOfWeekFor: eachExistingDate.
			year := startOfWeek year.
			nextDay := self nextOccuranceOf: byValue starting: startOfWeek plus: startOfWeek dayOfMonth.
			month := startOfWeek month.
			newDayOfMonth := nextDay.
			nextDay > startOfWeek daysInMonth
				ifTrue: [ 
					month := month + 1.
					newDayOfMonth := nextDay - startOfWeek daysInMonth.
					month > 12
						ifTrue: [ 
							month := 1.
							year := year + 1 ] ].
			self dateAndTimeClass
				year: year
				month: month
				day: newDayOfMonth
				hour: (self hourFor: eachExistingDate)
				minute: (self minuteFor: eachExistingDate)
				second: (self secondFor: eachExistingDate) ]
]

{ #category : #growing }
ICByDayRule >> datesForYearFrom: existingDates with: dayLetterCode [
	
	 (recurringSchedule hasHadByMonthDayRuleApplied or:[recurringSchedule hasHadByYearDayRuleApplied])
		ifTrue: [ ^self datesForSingleDayFrom: existingDates with: dayLetterCode ].
			 
		
			 recurringSchedule hasHadByWeekRuleApplied
		ifTrue: [ ^self datesForWeekFrom: existingDates with: dayLetterCode ].
			 recurringSchedule hasHadByMonthRuleApplied
		ifTrue: [ ^self datesForMonthFrom: existingDates with: dayLetterCode ].
			 
			^self generateDatesForEvery: dayLetterCode inTheYearStarting:existingDates.
]

{ #category : #'as yet unclassified' }
ICByDayRule >> dayOfWeekFor: eachDate [
	| weekStartIndex dayOfWeek index |
	dayOfWeek := eachDate dayOfWeek.
	recurringSchedule isWeekly
		ifTrue: [ 
			weekStartIndex := self dayLetterCodes indexOf: weekStart.
			^ dayOfWeek >= weekStartIndex
				ifTrue: [ dayOfWeek - weekStartIndex + 1 ]
				ifFalse: [ #(1 2 3 4 5 6 7) atWrap: weekStartIndex + dayOfWeek ] ]
		ifFalse: [ ^ dayOfWeek ]
]

{ #category : #'as yet unclassified' }
ICByDayRule >> dayOfYearFor: dayLetterCode inWeekWith: aDateAndTime [
	| dayOfYear |

	dayOfYear := aDateAndTime dayOfYear
]

{ #category : #weeks }
ICByDayRule >> daysOfWeekFor: someDates [
|limit daysOfWeek |

limit:=7 min: someDates size.
daysOfWeek :=Array new: limit. 
1 to: limit do:[:index | daysOfWeek at: index put: (self dayLetterCodeFor: (someDates at: index) )].
^	daysOfWeek asSet
]

{ #category : #'as yet unclassified' }
ICByDayRule >> duration [
	^ self durationClass seconds: 86400
]

{ #category : #growing }
ICByDayRule >> firstAndLast: dayOfWeek forMonthIncluding: startDate [
	| firstAndLast dateArray period periodStart periodEnd |
	period := startDate asMonth.
	dateArray := #(1 2 3 4 5 6 7).
	firstAndLast := Array new: 2.
		periodStart := period start dayOfWeek.
	periodEnd := period end dayOfWeek.
	0 to: 6 do: [ :each | 
		(dateArray atWrap: periodStart + each) = dayOfWeek
			ifTrue: [ firstAndLast at: 1 put: period start dayOfMonth + each ].
		(dateArray atWrap: periodEnd - each) = dayOfWeek
			ifTrue: [ firstAndLast at: 2 put: period end dayOfMonth - each ] ].
	^ firstAndLast
]

{ #category : #growing }
ICByDayRule >> firstAndLast: dayOfWeek forYearIncluding: startDate [
	| firstAndLast dateArray period periodStart periodEnd |
	period := startDate itsYear.
	dateArray := #(1 2 3 4 5 6 7).
	firstAndLast := Array new: 2.
	periodStart :=period start dayOfWeek.
	periodEnd:=period end dayOfWeek.
	0 to: 6 do: [ :each | 
		(dateArray atWrap: periodStart  + each) = dayOfWeek
			ifTrue: [ firstAndLast at: 1 put: period start dayOfYear + each ].
		(dateArray atWrap: periodEnd - each) = dayOfWeek
			ifTrue: [ firstAndLast at: 2 put: period end dayOfYear - each ] ].
	^ firstAndLast
]

{ #category : #growing }
ICByDayRule >> firstAndLast: dayOfWeek starting: aStart ending: anEnd [
	| firstAndLast dateArray |
	dateArray := #(1 2 3 4 5 6 7).
	firstAndLast := Array new: 2.
	0 to: 6 do: [ :each | 
		aStart dayOfWeek + each = dayOfWeek
			ifTrue: [ firstAndLast at: 1 put: 2 ] ]
]

{ #category : #growing }
ICByDayRule >> generateDatesForEvery: byValue inTheYearStarting: existingDates [
	| lastDay nextDay dates startDate |
	startDate := existingDates first.
	dates := OrderedCollection new.
	byValue isString
		ifTrue: [ 
			lastDay := startDate daysInYear.
			nextDay := self nextOccuranceOf: byValue starting: startDate plus: startDate dayOfYear.
			[ nextDay <= lastDay ]
				whileTrue: [ 
					dates add: (self newDateForYearContaining: startDate on: nextDay).
					nextDay := nextDay + 7 ] ]
		ifFalse: [ 
			nextDay := self ordinalOccuranceOf: byValue inSamePeriodAs: startDate limitedTo: startDate daysInYear.
			dates add: (self newDateForYearContaining: startDate on: nextDay) ].
	^ dates
]

{ #category : #'as yet unclassified' }
ICByDayRule >> interestingPartOf: aDateAndTime [
	
	^ self dayLetterCodeFor:  aDateAndTime
]

{ #category : #accessing }
ICByDayRule >> isDaily [
	^ true
]

{ #category : #ordinal }
ICByDayRule >> monthlyOrdinalIndexesFor: aDateAndTime [
	| iterator fromStartIndex fromEndIndex |
	fromStartIndex := (aDateAndTime dayOfMonth / 7.0) ceiling.
	fromEndIndex := ((aDateAndTime dayOfMonth - aDateAndTime daysInMonth) / 7.0) ceiling - 1.
	^ Array with: fromStartIndex with: fromEndIndex
]

{ #category : #months }
ICByDayRule >> newDateForMonthContaining: aDateAndTime on: aDayOfMonth [
	^ self dateAndTimeClass
		year: (self yearFor: aDateAndTime)
		month: (self monthFor: aDateAndTime)
		day: aDayOfMonth
		hour: (self hourFor: aDateAndTime)
		minute: (self minuteFor: aDateAndTime)
		second: (self secondFor: aDateAndTime)
]

{ #category : #years }
ICByDayRule >> newDateForYearContaining:  aDateAndTime on: aDayOfYear [
	^ self dateAndTimeClass
		year: (self yearFor: aDateAndTime)
	
		day: aDayOfYear
		hour: (self hourFor: aDateAndTime)
		minute: (self minuteFor: aDateAndTime)
		second: (self secondFor: aDateAndTime)
]

{ #category : #growing }
ICByDayRule >> newDatesFrom: neededByValues considering: existingDates [
	recurringSchedule isWeekly
		ifTrue: [ ^ neededByValues gather: [ :dayLetterCode | self datesForWeekFrom: existingDates with: dayLetterCode ] ].
	recurringSchedule isMonthly
		ifTrue: [ ^ neededByValues gather: [ :dayLetterCode | self datesForMonthFrom: existingDates with: dayLetterCode ] ].
	recurringSchedule isYearly
		ifTrue: [ ^ neededByValues gather: [ :dayLetterCode | self datesForYearFrom: existingDates with: dayLetterCode ] ]
]

{ #category : #growing }
ICByDayRule >> nextOccuranceOf: byValue starting: startDate plus: atLeast [
	| dayOfWeek |
	dayOfWeek := self weekDayNumberFor: byValue.
	^ startDate dayOfWeek > dayOfWeek
		ifTrue: [ dayOfWeek - startDate dayOfWeek + atLeast + 7 ]
		ifFalse: [ dayOfWeek - startDate dayOfWeek + atLeast ]
]

{ #category : #ordinal }
ICByDayRule >> ordinalIndexesFor: aDateAndTime [ 
	^recurringSchedule isMonthly ifTrue: [self monthlyOrdinalIndexesFor: aDateAndTime ] ifFalse: [self yearlyOrdinalIndexesFor: aDateAndTime ]
]

{ #category : #'as yet unclassified' }
ICByDayRule >> ordinalIsPossible [
	^ recurringSchedule isYearly or: [ recurringSchedule isMonthly or: [ recurringSchedule isWeekly ] ]
]

{ #category : #growing }
ICByDayRule >> ordinalOccuranceOf: byValue inSamePeriodAs: startDate limitedTo: atMost [
	| dayOfWeek nextDay firstAndLast ordinal start stop step ordinalStep |
	dayOfWeek := self weekDayNumberFor: byValue key.
	ordinal := byValue value.
	firstAndLast := atMost > 31
		ifTrue: [ self firstAndLast: dayOfWeek forYearIncluding: startDate ]
		ifFalse: [ self firstAndLast: dayOfWeek forMonthIncluding: startDate ].
	ordinal > 0
		ifTrue: [ 
			start := firstAndLast first.
			stop := firstAndLast last.
			step := 7.
			ordinalStep := -1 ]
		ifFalse: [ 
			start := firstAndLast last.
			stop := firstAndLast first.
			step := -7.
			ordinalStep := 1 ].
	start to: stop by: step do: [ :each | 
		ordinal := ordinal + ordinalStep.
		ordinal = 0
			ifTrue: [ ^ each ] ]
]

{ #category : #'as yet unclassified' }
ICByDayRule >> ordinalShrinkTestFor: eachDate [


	^ self byValues
		anySatisfy: [ :eachValue | 
			eachValue isString
				ifTrue: [ eachValue = (self dayLetterCodeFor: eachDate)
					]
				ifFalse: [ eachValue key = (self dayLetterCodeFor: eachDate)
						and: [ (self ordinalIndexesFor: eachDate) includes: eachValue value ]  ] ]
]

{ #category : #'as yet unclassified' }
ICByDayRule >> setWeekStart [
	(recurringSchedule isWeekly and: [ recurringSchedule hasWeekStartday ])
		ifTrue: [ self weekStart: recurringSchedule weekStart weekStartDay ]
]

{ #category : #testing }
ICByDayRule >> shouldShrink1 [
	^ (self daysOfWeekFor: self recurringSchedule datesInProcess) size > self byValues size
]

{ #category : #'as yet unclassified' }
ICByDayRule >> shrinkTestFor: each [
	^ (self byValues includes: (self dayLetterCodeFor: each)) not
]

{ #category : #'as yet unclassified' }
ICByDayRule >> sortOrder [
	^ 5
]

{ #category : #months }
ICByDayRule >> startOfMonthFor: aDateAndTime [ 
	^self newDateForMonthContaining: aDateAndTime  on:1 
]

{ #category : #ordinal }
ICByDayRule >> yearlyOrdinalIndexesFor: aDateAndTime [

	| iterator fromStartIndex fromEndIndex|
	fromStartIndex := (aDateAndTime dayOfYear /7.0) ceiling.
	fromEndIndex :=((aDateAndTime  dayOfYear - aDateAndTime  daysInYear ) /7.0) ceiling - 1.
	^Array with: fromStartIndex with: fromEndIndex 
]
