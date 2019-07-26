Class {
	#name : #ICYearRecurrenceSchedule,
	#superclass : #ICRecurrenceSchedule,
	#instVars : [
		'weekStart'
	],
	#category : 'ICal-Core-Model-Schedule'
}

{ #category : #'as yet unclassified' }
ICYearRecurrenceSchedule class >> frequency [
	^ 'YEARLY'
]

{ #category : #'as yet unclassified' }
ICYearRecurrenceSchedule >> hasWeekStartday [
	^ weekStart notNil
]

{ #category : #'as yet unclassified' }
ICYearRecurrenceSchedule >> intervalDuration [
		"every year isnt 365 days, but here we are."
	^ self durationClass seconds: 86400 * 365
]

{ #category : #'as yet unclassified' }
ICYearRecurrenceSchedule >> isYearly [
	^ true
]

{ #category : #'as yet unclassified' }
ICYearRecurrenceSchedule >> occurrenceAfter: aDateAndTime [
	| nextMonth nextYear nextDay month |
	nextYear := aDateAndTime year + self interval.
	nextDay := aDateAndTime dayOfMonth.
	month := self dateAndTimeClass year: nextYear month: aDateAndTime month day: 1 hour: 0 minute: 0 second: 0 offset: aDateAndTime offset.
	nextDay := month daysInMonth < nextDay
		ifTrue: [ month daysInMonth ]
		ifFalse: [ nextDay ].
	^ self dateAndTimeClass
		year: nextYear
		month: aDateAndTime month
		day: nextDay
		hour: aDateAndTime hour
		minute: aDateAndTime minute
		second: aDateAndTime second
		 offset: aDateAndTime offset
]

{ #category : #'as yet unclassified' }
ICYearRecurrenceSchedule >> setWeekStartFor: anICRecurrenceRule [
	anICRecurrenceRule hasWeekStartday
		ifTrue: [ weekStart := ICWeekStartDayRule newValue: anICRecurrenceRule weekStartday ]
]

{ #category : #accessing }
ICYearRecurrenceSchedule >> weekStart [
	^ weekStart
]

{ #category : #accessing }
ICYearRecurrenceSchedule >> weekStart: anObject [
	weekStart := anObject
]
