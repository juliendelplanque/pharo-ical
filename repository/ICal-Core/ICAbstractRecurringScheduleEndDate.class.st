Class {
	#name : #ICAbstractRecurringScheduleEndDate,
	#superclass : #ICComponent,
	#instVars : [
		'schedule',
		'end'
	],
	#category : 'ICal-Core-Model-Schedule'
}

{ #category : #limits }
ICAbstractRecurringScheduleEndDate >> defaultEnd [
	"has to be something long to get the occurrences and act like its infinite.  "

	^ self schedule start + (self durationClass days: 10000 * 365)
]

{ #category : #accessing }
ICAbstractRecurringScheduleEndDate >> durationFor: aRecurringSchedule [
	self schedule: aRecurringSchedule.
	^ self duration
]

{ #category : #limits }
ICAbstractRecurringScheduleEndDate >> end [
	^ end ifNil: [ end := self defaultEnd ]
]

{ #category : #testing }
ICAbstractRecurringScheduleEndDate >> isDefined [
	^ false
]

{ #category : #testing }
ICAbstractRecurringScheduleEndDate >> isEpisodic [
	^ false
]

{ #category : #testing }
ICAbstractRecurringScheduleEndDate >> isInfinite [
	^ false
]

{ #category : #accessing }
ICAbstractRecurringScheduleEndDate >> schedule [
	^ schedule
]

{ #category : #accessing }
ICAbstractRecurringScheduleEndDate >> schedule: anObject [
	schedule := anObject
]

{ #category : #accessing }
ICAbstractRecurringScheduleEndDate >> scheduleArrayAt: anIndex [
	^ self schedule scheduleArrayAt: anIndex
]

{ #category : #testing }
ICAbstractRecurringScheduleEndDate >> shouldStopFor: anElement before: anEndDate [
	^ anElement > anEndDate
]

{ #category : #accessing }
ICAbstractRecurringScheduleEndDate >> start [
	^ self schedule startDate
]
