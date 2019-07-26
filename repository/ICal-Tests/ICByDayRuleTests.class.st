Class {
	#name : #ICByDayRuleTests,
	#superclass : #ICByRuleTests,
	#category : 'ICal-Tests-Core-Model-Schedule'
}

{ #category : #'as yet unclassified' }
ICByDayRuleTests >> setUp [
	super setUp.
	event addRecurrenceRule: (ICRecurrenceRule fromICalString: 'FREQ=WEEKLY;COUNT=10;BYDAY=SA,TU').
	byRule := (ICSchedule fromEvent: event) recurrenceSchedules first byRules first
]

{ #category : #'as yet unclassified' }
ICByDayRuleTests >> testDayLetterCodeFor [
	self assert: (byRule dayLetterCodeFor: date) equals: 'SA'
]

{ #category : #'as yet unclassified' }
ICByDayRuleTests >> testDayOfWeek [
	"date is a Saturday"

	byRule
		weekStart: 'MO'.
	self assert: (byRule dayOfWeekFor: date) equals: 6.
	byRule
		weekStart: 'TU'.
	self assert: (byRule dayOfWeekFor: date) equals: 5.
	byRule
		weekStart: 'WE'.
	self assert: (byRule dayOfWeekFor: date) equals: 4.
	byRule
		weekStart: 'TH'.
	self assert: (byRule dayOfWeekFor: date) equals: 3.
	byRule
		weekStart: 'FR'.
	self assert: (byRule dayOfWeekFor: date) equals: 2.
	byRule
		weekStart: 'SA'.
	self assert: (byRule dayOfWeekFor: date) equals: 1.
	byRule
		weekStart: 'SU'.
	self assert: (byRule dayOfWeekFor: date) equals: 7
]

{ #category : #'as yet unclassified' }
ICByDayRuleTests >> testOrdinalIndexes [
	self assert: (byRule monthlyOrdinalIndexesFor: date) equals: #(2 -4).
	self assert: (byRule yearlyOrdinalIndexesFor: date) equals: #(49 -4)
]
