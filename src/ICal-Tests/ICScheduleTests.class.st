Class {
	#name : #ICScheduleTests,
	#superclass : #ICScheduleEnumerationTests,
	#category : 'ICal-Tests-Core-Model-Schedule'
}

{ #category : #'as yet unclassified' }
ICScheduleTests >> dailyRrule [
	^ ICRecurrenceRule fromICalString: 'FREQ=DAILY'
]

{ #category : #'as yet unclassified' }
ICScheduleTests >> testBetweenAndDoGivesErrorForInfiniteSchedule [
	| rule |
	rule := ICRecurrenceRule fromICalString: 'FREQ=DAILY'.
	event addRecurrenceRule: rule.
	self should: [event schedule dates] raise: InfiniteScheduleLengthError
]

{ #category : #'as yet unclassified' }
ICScheduleTests >> testDatesBetweenAndGivesDatesBetweenStartAndEndOnly [
	| rule dates start end |
	rule := self dailyRrule.
	event addRecurrenceRule: rule.
	start := self dateAndTimeClass now.
	end := start.
	dates := event datesBetween: start and: end.
	self assert: dates size equals: 0.
	end := start + (self durationClass days: 100).
	dates := event datesBetween: start and: end.
	self assert: dates min > start.
	self assert: dates max < end.
	self assert: dates size = 100
]

{ #category : #'as yet unclassified' }
ICScheduleTests >> testGetScheduleFromEvent [
	| rule |
	rule := ICRecurrenceRule fromICalString: 'FREQ=DAILY;COUNT=10'.
	event addRecurrenceRule: rule.
	self assert: event schedule dates size equals: 10
]
