Class {
	#name : #ICWeekRecurrenceSchedule,
	#superclass : #ICRecurrenceSchedule,
	#instVars : [
		'weekStart'
	],
	#category : 'ICal-Core-Model-Schedule'
}

{ #category : #'as yet unclassified' }
ICWeekRecurrenceSchedule class >> frequency [
	^ 'WEEKLY'
]

{ #category : #accessing }
ICWeekRecurrenceSchedule >> hasWeekStartday [
	^ weekStart notNil
]

{ #category : #'as yet unclassified' }
ICWeekRecurrenceSchedule >> intervalDuration [
	^ self durationClass seconds: 86400 * 7
]

{ #category : #'as yet unclassified' }
ICWeekRecurrenceSchedule >> isWeekly [
	^ true
]

{ #category : #'as yet unclassified' }
ICWeekRecurrenceSchedule >> setWeekStartFor: anICRecurrenceRule [
	anICRecurrenceRule hasWeekStartday
		ifTrue: [ weekStart := ICWeekStartDayRule newValue: anICRecurrenceRule weekStartday ]
]

{ #category : #accessing }
ICWeekRecurrenceSchedule >> weekStart [
	^ weekStart
]

{ #category : #accessing }
ICWeekRecurrenceSchedule >> weekStart: anObject [
	weekStart := anObject
]
