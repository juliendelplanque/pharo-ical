Class {
	#name : #ICDefinedScheduleEndDate,
	#superclass : #ICAbstractRecurringScheduleEndDate,
	#instVars : [
		'lastDay'
	],
	#category : 'ICal-Core-Model-Schedule'
}

{ #category : #accessing }
ICDefinedScheduleEndDate >> defaultEnd [
	^ self lastDay
]

{ #category : #accessing }
ICDefinedScheduleEndDate >> duration [
	^ self lastDay - self schedule start
]

{ #category : #accessing }
ICDefinedScheduleEndDate >> initialize [
	super initialize.
	lastDay := self dateAndTimeClass now atStartOfDay
]

{ #category : #testing }
ICDefinedScheduleEndDate >> isDefined [
	^ true
]

{ #category : #accessing }
ICDefinedScheduleEndDate >> lastDay [
	^ lastDay
]

{ #category : #accessing }
ICDefinedScheduleEndDate >> lastDay: anObject [
	lastDay := anObject
]

{ #category : #testing }
ICDefinedScheduleEndDate >> shouldStopFor: anElement before: anEndDate [
	^ anElement > anEndDate or: [ anElement > self lastDay ]
]

{ #category : #length }
ICDefinedScheduleEndDate >> trimEndOf: someDates [
	someDates last > lastDay
		ifTrue: [ someDates removeAllSuchThat: [ :each | each > lastDay ] ].
	^ someDates
]
