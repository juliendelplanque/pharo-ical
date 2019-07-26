"
Contains  the FREQ and INTERVAL portion, the BYxxx rules.  and the COUNT or UNTIL of the RRULE/EXRULE definition.  The FREQ is the only thing thats required.  The interesting things are #datesBetween: and:, #next, #next:, and #next:starting: 
"
Class {
	#name : #ICRecurrenceSchedule,
	#superclass : #Schedule,
	#instVars : [
		'interval',
		'byRules',
		'endDate',
		'event',
		'cache',
		'dateCache',
		'datesInProcess',
		'lastRuleDuration'
	],
	#category : 'ICal-Core-Model-Schedule'
}

{ #category : #'instance creation' }
ICRecurrenceSchedule class >> forEvent: anEvent withRule: anICRecurrenceRule [
	^ self basicNew initialize createFromRule: anICRecurrenceRule for: anEvent
]

{ #category : #'instance creation' }
ICRecurrenceSchedule class >> fromEvent: anEvent forRule: anICRecurrenceRule [
	^ (self subclasses detect: [ :each | each frequency = anICRecurrenceRule frequency ])
		forEvent: anEvent
		withRule: anICRecurrenceRule
]

{ #category : #enumerating }
ICRecurrenceSchedule >> basicDatesBetween: aStart and: anEnd [
	| dateAndTimes |
	dateAndTimes := OrderedCollection new.
	self between: aStart and: anEnd do: [ :e | dateAndTimes add: e ].
	^ dateAndTimes
]

{ #category : #enumerating }
ICRecurrenceSchedule >> between: aStart and: anEnd do: aBlock [
	"from Cuis 99"

	| element end i |
	"Performance optimization. Avoid going through unnecesary days if easy."
	end := self enumeratingEndDateConsidering: anEnd.
	element := self initialEnumeratingElementFor: aStart.
	i := 1.
	[ element < aStart ]
		whileTrue: [ 
			element := self occurrenceAfter:element .
			 ].
	[ self shouldStopFor: element before: end ]
		whileFalse: [ cache ifTrue: [self dateCache add: element].
			aBlock value: element.
			element := self occurrenceAfter:element  ]
]

{ #category : #accessing }
ICRecurrenceSchedule >> byRules [
	^ byRules
]

{ #category : #accessing }
ICRecurrenceSchedule >> byRules: anObject [
	byRules := anObject
]

{ #category : #accessing }
ICRecurrenceSchedule >> cache: aBoolean [
	
	cache := aBoolean
]

{ #category : #testing }
ICRecurrenceSchedule >> checkByRulesToSeeIfAnyAre: byRuleTest [
	^self byRules anySatisfy: [:each | each perform:byRuleTest ]
]

{ #category : #initialize }
ICRecurrenceSchedule >> createFromRule: anICRecurrenceRule for: anEvent [
	event := anEvent.
	start := anEvent start copy.
	anICRecurrenceRule hasInterval
		ifTrue: [ interval := anICRecurrenceRule interval ].
	anICRecurrenceRule hasSeconds
		ifTrue: [ byRules add: (ICBySecondRule withAll: anICRecurrenceRule seconds asPartOf: self) ].
	anICRecurrenceRule hasMinutes
		ifTrue: [ byRules add: (ICByMinuteRule withAll: anICRecurrenceRule minutes asPartOf: self) ].
	anICRecurrenceRule hasHours
		ifTrue: [ byRules add: (ICByHourRule withAll: anICRecurrenceRule hours asPartOf: self) ].
	anICRecurrenceRule hasWeekdays
		ifTrue: [ byRules add: (ICByDayRule withAll: anICRecurrenceRule weekdays asPartOf: self) ].
	anICRecurrenceRule hasMonthdays
		ifTrue: [ byRules add: (ICByMonthDayRule withAll: anICRecurrenceRule monthdays asPartOf: self) ].
	anICRecurrenceRule hasYeardays
		ifTrue: [ byRules add: (ICByYearDayRule withAll: anICRecurrenceRule yeardays asPartOf: self) ].
	anICRecurrenceRule hasWeeknumbers
		ifTrue: [ byRules add: (ICByWeekRule withAll: anICRecurrenceRule weeknumbers asPartOf: self) ].
	anICRecurrenceRule hasMonthnumbers
		ifTrue: [ byRules add: (ICByMonthRule withAll: anICRecurrenceRule monthnumbers asPartOf: self) ].
	anICRecurrenceRule hasPositions
		ifTrue: [ byRules add: (ICBySetPositionRule withAll: anICRecurrenceRule positions asPartOf: self) ].
	self setEndDateFor: anICRecurrenceRule.
	self setWeekStartFor: anICRecurrenceRule
]

{ #category : #defaultClasses }
ICRecurrenceSchedule >> dateAndTimeClass [
	^ self event dateAndTimeClass
]

{ #category : #accessing }
ICRecurrenceSchedule >> dateCache [
	
	^ dateCache
]

{ #category : #enumerating }
ICRecurrenceSchedule >> datesBetween: aStart and: anEnd [
	datesInProcess := self basicDatesBetween: aStart and: anEnd.
	self byRules
		do: [ :each | 
			datesInProcess := each applyRulesTo: datesInProcess.
			self lastRuleDuration: each duration ].
	datesInProcess removeAllSuchThat: [ :each | (each between: aStart and: anEnd) not ].
	^ self ensureDatesEndCorrectly
]

{ #category : #accessing }
ICRecurrenceSchedule >> datesInProcess [
	
	^ datesInProcess
]

{ #category : #'as yet unclassified' }
ICRecurrenceSchedule >> defaultInterval [
	^ self intervalDuration * self interval
]

{ #category : #defaultClasses }
ICRecurrenceSchedule >> durationClass [
	^ self event durationClass
]

{ #category : #accessing }
ICRecurrenceSchedule >> end [
	^ self endDate end
]

{ #category : #accessing }
ICRecurrenceSchedule >> endDate [

	^ endDate
]

{ #category : #enumerating }
ICRecurrenceSchedule >> ensureDatesEndCorrectly [
	
	^ datesInProcess isEmpty
		ifTrue: [ datesInProcess ]
		ifFalse: [self endDate trimEndOf: datesInProcess ]
]

{ #category : #enumerating }
ICRecurrenceSchedule >> enumeratingEndDateConsidering: anEnd [
	^ self isInfinite
		ifTrue: [ anEnd ]
		ifFalse: [ self end min: anEnd ]
]

{ #category : #accessing }
ICRecurrenceSchedule >> event [
	
	^ event
]

{ #category : #testing }
ICRecurrenceSchedule >> everyDayAtSameTimes [
	"Answer false if unknown"

	| oneDay |
	oneDay := self durationClass seconds: 86400.
	^ self byRules allSatisfy: [ :each | each duration >= oneDay ]
]

{ #category : #'as yet unclassified' }
ICRecurrenceSchedule >> frequency [
	^ self class frequency
]

{ #category : #testing }
ICRecurrenceSchedule >> hasHadByMonthDayRuleApplied [
	^self checkByRulesToSeeIfAnyAre: #isMonthDay
]

{ #category : #testing }
ICRecurrenceSchedule >> hasHadByMonthRuleApplied [
	^self checkByRulesToSeeIfAnyAre: #isMonthly
]

{ #category : #testing }
ICRecurrenceSchedule >> hasHadByWeekRuleApplied [
	^self checkByRulesToSeeIfAnyAre: #isWeekly
]

{ #category : #testing }
ICRecurrenceSchedule >> hasHadByYearDayRuleApplied [

	^self checkByRulesToSeeIfAnyAre: #isYearDay
]

{ #category : #testing }
ICRecurrenceSchedule >> hasWeekStartday [
	^ false
]

{ #category : #enumerating }
ICRecurrenceSchedule >> initialEnumeratingElementFor: aStart [
	| element startDate |
	element := self start.	"Performance optimization. Avoid going through unnecesary days if easy."
	startDate := aStart asDate.
	(startDate > element asDate and: [ self everyDayAtSameTimes ])
		ifTrue: [ element := self dateAndTimeClass date: startDate time: element asDateAndTime ].
	^ element
]

{ #category : #'as yet unclassified' }
ICRecurrenceSchedule >> initialSchedule [
	^ Array with: self defaultInterval
]

{ #category : #'as yet unclassified' }
ICRecurrenceSchedule >> initialize [
	super initialize.
	interval := 1.
	byRules := SortedCollection new.
	cache := false.
	dateCache := SortedCollection new
]

{ #category : #'as yet unclassified' }
ICRecurrenceSchedule >> interval [
	^ interval ifNil: [ interval := 1 ]
]

{ #category : #accessing }
ICRecurrenceSchedule >> interval: anObject [
	interval := anObject
]

{ #category : #'as yet unclassified' }
ICRecurrenceSchedule >> intervalDuration [
	self subclassResponsibility
]

{ #category : #testing }
ICRecurrenceSchedule >> isDaily [
	^ false
]

{ #category : #testing }
ICRecurrenceSchedule >> isHourly [
	^ false
]

{ #category : #testing }
ICRecurrenceSchedule >> isInfinite [
	^ self endDate isInfinite
]

{ #category : #testing }
ICRecurrenceSchedule >> isMinutely [
	^ false
]

{ #category : #testing }
ICRecurrenceSchedule >> isMonthly [
	^ false
]

{ #category : #testing }
ICRecurrenceSchedule >> isSecondly [
	^ false
]

{ #category : #testing }
ICRecurrenceSchedule >> isWeekly [
	^ false
]

{ #category : #testing }
ICRecurrenceSchedule >> isYearly [
	^ false
]

{ #category : #accessing }
ICRecurrenceSchedule >> lastRuleDuration [
	^ lastRuleDuration ifNil: [ lastRuleDuration := self intervalDuration ]
]

{ #category : #accessing }
ICRecurrenceSchedule >> lastRuleDuration: anObject [
	lastRuleDuration := anObject
]

{ #category : #'as yet unclassified' }
ICRecurrenceSchedule >> makeSchedule [
	schedule := self initialSchedule.
	self modifyScheduleWithByRules
]

{ #category : #enumerating }
ICRecurrenceSchedule >> next [
	^ self next: 1
]

{ #category : #enumerating }
ICRecurrenceSchedule >> next: aNumberOfOccurrences [
	^ self next: aNumberOfOccurrences starting: DateAndTime now
]

{ #category : #enumerating }
ICRecurrenceSchedule >> next: aNumberOfOccurrences starting: aTimeOrDate [
	| tempStart |
	tempStart := aTimeOrDate.
	self halt	"I wonder how to do this"
]

{ #category : #enumerating }
ICRecurrenceSchedule >> occurrenceAfter: aDateAndTime [
	^ aDateAndTime + self defaultInterval 
]

{ #category : #'as yet unclassified' }
ICRecurrenceSchedule >> schedule [
	schedule isNil
		ifTrue: [ self makeSchedule ].
	^ schedule
]

{ #category : #endDates }
ICRecurrenceSchedule >> setEndDateFor: anICRecurrenceRule [
	endDate := anICRecurrenceRule hasRepetition
		ifTrue: [ 
			anICRecurrenceRule repetition isInteger
				ifTrue: [ 
					self cache: true.
					ICEpisodicScheduleEndDate new occurrences: anICRecurrenceRule repetition ]
				ifFalse: [ ICDefinedScheduleEndDate new lastDay: anICRecurrenceRule repetition ] ]
		ifFalse: [ ICInfiniteScheduleEndDate new ].
	endDate schedule: self
]

{ #category : #initialize }
ICRecurrenceSchedule >> setWeekStartFor: anICRecurrenceRule [
	
]

{ #category : #enumerating }
ICRecurrenceSchedule >> shouldStopFor: element before: anEnd [
	^ self endDate shouldStopFor: element before: anEnd
]
