Class {
	#name : #ICHourRecurrenceSchedule,
	#superclass : #ICRecurrenceSchedule,
	#category : 'ICal-Core-Model-Schedule'
}

{ #category : #'as yet unclassified' }
ICHourRecurrenceSchedule class >> frequency [
	^ 'HOURLY'
]

{ #category : #'as yet unclassified' }
ICHourRecurrenceSchedule >> intervalDuration [
	^ self durationClass seconds: 3600
]

{ #category : #'as yet unclassified' }
ICHourRecurrenceSchedule >> isHourly [
	^ true
]
