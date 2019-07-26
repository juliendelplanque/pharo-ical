Class {
	#name : #ICByYearDayRuleTests,
	#superclass : #ICByRuleTests,
	#category : 'ICal-Tests-Core-Model-Schedule'
}

{ #category : #'as yet unclassified' }
ICByYearDayRuleTests >> setUp [
	super setUp.
	event addRecurrenceRule: (ICRecurrenceRule fromICalString: 'FREQ=WEEKLY;COUNT=10;BYYEARDAY=-221,144').
	byRule := (ICSchedule fromEvent: event) recurrenceSchedules first byRules first
]

{ #category : #'as yet unclassified' }
ICByYearDayRuleTests >> testOrdinalIndexes [
	self assert: (byRule ordinalIndexesFor: (self dateAndTimeClass year: 2004 month: 1 day: 3)) equals: #(3 -363).
	self assert: (byRule ordinalIndexesFor: (self dateAndTimeClass year: 2004 month: 2 day: 3)) equals: #(34 -332).
	self assert: (byRule ordinalIndexesFor: (self dateAndTimeClass year: 2007 month: 3 day: 3)) equals: #(62 -303).
	self assert: (byRule ordinalIndexesFor: (self dateAndTimeClass year: 2007 month: 4 day: 3)) equals: #(93 -272)
]
