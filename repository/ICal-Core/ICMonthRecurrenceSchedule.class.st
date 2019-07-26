Class {
	#name : #ICMonthRecurrenceSchedule,
	#superclass : #ICRecurrenceSchedule,
	#category : 'ICal-Core-Model-Schedule'
}

{ #category : #'as yet unclassified' }
ICMonthRecurrenceSchedule class >> frequency [
	^ 'MONTHLY'
]

{ #category : #'as yet unclassified' }
ICMonthRecurrenceSchedule >> intervalDuration [
	^ self durationClass seconds: 86400 * 31
]

{ #category : #'as yet unclassified' }
ICMonthRecurrenceSchedule >> isMonthly [
	^ true
]

{ #category : #'as yet unclassified' }
ICMonthRecurrenceSchedule >> occurrenceAfter: aDateAndTime [
	| nextMonth nextYear nextDay month |
	nextYear := aDateAndTime year.
	nextDay := aDateAndTime dayOfMonth.
	nextMonth := aDateAndTime month + self interval.
	nextMonth > 12
		ifTrue: [ 
			nextYear := nextYear + (nextMonth // 12).
			nextMonth := nextMonth \\ 12 ].
	month := self dateAndTimeClass year: nextYear month: nextMonth day: 1 hour: 0 minute: 0 second: 0 offset: aDateAndTime offset.
	nextDay := month daysInMonth < nextDay
		ifTrue: [ month daysInMonth ]
		ifFalse: [ nextDay ].
	^ self dateAndTimeClass
		year: nextYear
		month: nextMonth
		day: nextDay
		hour: aDateAndTime hour
		minute: aDateAndTime minute
		second: aDateAndTime second
		 offset: aDateAndTime offset
]
