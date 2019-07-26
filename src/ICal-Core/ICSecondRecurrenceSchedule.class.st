Class {
	#name : #ICSecondRecurrenceSchedule,
	#superclass : #ICRecurrenceSchedule,
	#category : 'ICal-Core-Model-Schedule'
}

{ #category : #'as yet unclassified' }
ICSecondRecurrenceSchedule class >> frequency [
	^ 'SECONDLY'
]

{ #category : #'as yet unclassified' }
ICSecondRecurrenceSchedule >> intervalDuration [
	^ self durationClass seconds: 1
]

{ #category : #'as yet unclassified' }
ICSecondRecurrenceSchedule >> isSecondly [
	^ true
]
