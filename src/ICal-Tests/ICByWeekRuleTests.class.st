Class {
	#name : #ICByWeekRuleTests,
	#superclass : #ICByRuleTests,
	#category : 'ICal-Tests-Core-Model-Schedule'
}

{ #category : #'as yet unclassified' }
ICByWeekRuleTests >> setUp [
	super setUp.
	event addRecurrenceRule: (ICRecurrenceRule fromICalString: 'FREQ=WEEKLY;COUNT=10;BYWEEKNO=-38,14').
	byRule := (ICSchedule fromEvent: event) recurrenceSchedules first byRules first
]

{ #category : #'as yet unclassified' }
ICByWeekRuleTests >> testOrdinalIndexes [
	self assert: (byRule ordinalIndexesFor: (self dateAndTimeClass  year: 2004 month: 1 day: 3)) equals: #(1 -52).
	self assert: (byRule ordinalIndexesFor: (self dateAndTimeClass year: 2004 month: 3 day: 3)) equals: #(10 -43).
	byRule weekStart: 'TH'.
	self assert: (byRule ordinalIndexesFor: (self dateAndTimeClass year: 2004 month: 3 day: 3)) equals: #(9 -44).
	byRule weekStart: 'SA'.
	self assert: (byRule ordinalIndexesFor: (self dateAndTimeClass year: 2004 month: 3 day: 3)) equals: #(9 -43)
]

{ #category : #'as yet unclassified' }
ICByWeekRuleTests >> testStartOfFirstWeek [
	self
		assert: (byRule startOfFirstWeekAccordingToRFC2445For: (self dateAndTimeClass year: 2004 month: 3 day: 3))
		equals: (self dateAndTimeClass year: 2003 month: 12 day: 29).
	self
		assert: (byRule startOfFirstWeekAccordingToRFC2445For: (self dateAndTimeClass year: 2005 month: 3 day: 3))
		equals: (self dateAndTimeClass year: 2005 month: 1 day: 3).
	byRule weekStart: 'SA'.
	self
		assert: (byRule startOfFirstWeekAccordingToRFC2445For: (self dateAndTimeClass year: 2004 month: 3 day: 3))
		equals: (self dateAndTimeClass year: 2004 month: 1 day: 3).
	self
		assert: (byRule startOfFirstWeekAccordingToRFC2445For: (self dateAndTimeClass year: 2005 month: 3 day: 3))
		equals: (self dateAndTimeClass year: 2005 month: 1 day: 1)
]
