Class {
	#name : #ICDayRecurrenceSchedule,
	#superclass : #ICRecurrenceSchedule,
	#category : 'ICal-Core-Model-Schedule'
}

{ #category : #'as yet unclassified' }
ICDayRecurrenceSchedule class >> frequency [
	^ 'DAILY'
]

{ #category : #'as yet unclassified' }
ICDayRecurrenceSchedule >> intervalDuration [
	^ self durationClass seconds: 86400
]

{ #category : #testing }
ICDayRecurrenceSchedule >> isDaily [
	^ true
]

{ #category : #rules }
ICDayRecurrenceSchedule >> modifyScheduleWithByRules [
	self shouldBeImplemented.
]
