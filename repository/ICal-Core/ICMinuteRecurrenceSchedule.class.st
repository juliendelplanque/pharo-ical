Class {
	#name : #ICMinuteRecurrenceSchedule,
	#superclass : #ICRecurrenceSchedule,
	#category : 'ICal-Core-Model-Schedule'
}

{ #category : #'as yet unclassified' }
ICMinuteRecurrenceSchedule class >> frequency [
	^ 'MINUTELY'
]

{ #category : #'as yet unclassified' }
ICMinuteRecurrenceSchedule >> intervalDuration [
	^ self durationClass seconds: 60
]

{ #category : #'as yet unclassified' }
ICMinuteRecurrenceSchedule >> isMinutely [
	^ true
]
