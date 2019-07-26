Class {
	#name : #ICByMonthDayRuleTests,
	#superclass : #ICByRuleTests,
	#category : 'ICal-Tests-Core-Model-Schedule'
}

{ #category : #'as yet unclassified' }
ICByMonthDayRuleTests >> setUp [
	super setUp.
	event addRecurrenceRule: (ICRecurrenceRule fromICalString: 'FREQ=WEEKLY;COUNT=10;BYMONTHDAY=14,-12').
	byRule := (ICSchedule fromEvent: event) recurrenceSchedules first byRules first
]

{ #category : #'as yet unclassified' }
ICByMonthDayRuleTests >> testOrdinalIndexes [
	self assert: (byRule ordinalIndexesFor: (self dateAndTimeClass year: 2004 month: 1 day: 3)) equals: #(3 -28).
	self assert: (byRule ordinalIndexesFor: (self dateAndTimeClass year: 2004 month: 2 day: 3)) equals: #(3 -26).
	self assert: (byRule ordinalIndexesFor: (self dateAndTimeClass year: 2004 month: 3 day: 3)) equals: #(3 -28).
	self assert: (byRule ordinalIndexesFor: (self dateAndTimeClass year: 2004 month: 4 day: 3)) equals: #(3 -27)
]
