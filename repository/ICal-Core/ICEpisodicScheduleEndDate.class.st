Class {
	#name : #ICEpisodicScheduleEndDate,
	#superclass : #ICAbstractRecurringScheduleEndDate,
	#instVars : [
		'occurrences',
		'shouldStop'
	],
	#category : 'ICal-Core-Model-Schedule'
}

{ #category : #accessing }
ICEpisodicScheduleEndDate >> duration [
	| duration |
	duration := Duration zero.
	(Interval from: 1 to: self occurrences - 1) do: [ :each | duration := duration + (self scheduleArrayAt: each) ].
	^ duration
]

{ #category : #accessing }
ICEpisodicScheduleEndDate >> initialize [
	super initialize.
	occurrences := 1.
	shouldStop := false
]

{ #category : #testing }
ICEpisodicScheduleEndDate >> isEpisodic [
	^ true
]

{ #category : #accessing }
ICEpisodicScheduleEndDate >> occurrences [
	^ occurrences
]

{ #category : #accessing }
ICEpisodicScheduleEndDate >> occurrences: anObject [
	occurrences := anObject
]

{ #category : #testing }
ICEpisodicScheduleEndDate >> shouldStopFor: anElement before: anEndDate [
	shouldStop
		ifFalse: [ 
			self schedule dateCache size >= self occurrences
				ifTrue: [ 
					end := self schedule dateCache last.
					^ shouldStop := true ].
			^ anElement > anEndDate ].
	^ shouldStop
]

{ #category : #length }
ICEpisodicScheduleEndDate >> trimEndOf: someDates [
	someDates size > self occurrences
		ifTrue: [ ^ someDates first: self occurrences ].
	^ someDates
]
