Class {
	#name : #ICByRuleTests,
	#superclass : #ICTest,
	#instVars : [
		'byRule',
		'date',
		'event'
	],
	#category : 'ICal-Tests-Core-Model-Schedule'
}

{ #category : #'as yet unclassified' }
ICByRuleTests >> setUp [
	super setUp.
	date := self dateAndTimeClass
		year: 2012
		month: 12
		day: 8
		hour: 0
		minute: 0
		second: 0.
	event := ICEvent summary: 'diner'.
	event addCategory: (ICCategory summary: 'friends').
	event start: date.
	event beLowPriority.
	event location: 'in nature'
]
