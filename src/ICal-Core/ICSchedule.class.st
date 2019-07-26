Class {
	#name : #ICSchedule,
	#superclass : #Object,
	#instVars : [
		'event',
		'recurrenceSchedules',
		'exclusionSchedules',
		'useCache',
		'dateCache',
		'end'
	],
	#category : 'ICal-Core-Model-Schedule'
}

{ #category : #'instance creation' }
ICSchedule class >> fromEvent: anICEvent [ 
	^self new createFromEvent: anICEvent 
]

{ #category : #accessing }
ICSchedule >> cache [
	self shouldBeImplemented.
]

{ #category : #initialization }
ICSchedule >> createExclusionSchedules [
	exclusionSchedules := self event exclusionRules
		collect: [ :each | 
			| newSchedule |
			newSchedule := each asRecurrenceScheduleFor: self event.
			newSchedule
				cache: self cache;
				yourself ]
]

{ #category : #initialization }
ICSchedule >> createFromEvent: anICEvent [
	event := anICEvent.
	self
		createRecurrenceSchedules;
		createExclusionSchedules
]

{ #category : #initialization }
ICSchedule >> createRecurrenceSchedules [
	recurrenceSchedules := self event recurrenceRules
		collect: [ :each | 
			| newSchedule |
			newSchedule := each asRecurrenceScheduleFor: self event.
		]
]

{ #category : #enumerating }
ICSchedule >> dates [
	^ self hasMoreThanOneDate
		ifTrue: [ 
			self isInfinite
				ifTrue: [ ^ InfiniteScheduleLengthError new signal: 'You need to use #datesBetween:and: or #between:and:do:' ]
				ifFalse: [ self datesBetween: self start and: self end ] ]
		ifFalse: [ Array with: self event start ]
]

{ #category : #enumerating }
ICSchedule >> datesBetween: aStart and: anEnd [
	| recurringDates |
	recurringDates := self recurrenceDatesBetween: aStart and: anEnd.
	recurringDates removeAllFoundIn: (self exclusionDatesBetween: aStart and: anEnd).
		 ^recurringDates asArray sort
]

{ #category : #accessing }
ICSchedule >> end [
	end isNil ifTrue:[self setEnd].
	^end
]

{ #category : #accessing }
ICSchedule >> event [
	^ event
]

{ #category : #accessing }
ICSchedule >> event: anObject [
	event := anObject
]

{ #category : #enumerating }
ICSchedule >> exclusionDatesBetween: aStart and: anEnd [
	| dates |
	dates := self event exclusionDates copy.
	dates addAll: (self exclusionSchedules gather: [ :each | each datesBetween: aStart and: anEnd ]).
	^ dates asSet
]

{ #category : #accessing }
ICSchedule >> exclusionSchedules [
	^ exclusionSchedules
]

{ #category : #accessing }
ICSchedule >> exclusionSchedules: anObject [
	exclusionSchedules := anObject
]

{ #category : #testing }
ICSchedule >> hasExclusionSchedules [
	^ self exclusionSchedules notNil
]

{ #category : #testing }
ICSchedule >> hasMoreThanOneDate [
	^self recurrenceSchedules notEmpty 
]

{ #category : #testing }
ICSchedule >> initialize [
	super initialize.
	useCache := false.
	dateCache := SortedCollection new
]

{ #category : #testing }
ICSchedule >> isInfinite [
	^self recurrenceSchedules anySatisfy: [:each | each isInfinite ] 
]

{ #category : #testing }
ICSchedule >> occursOn: aDate [
	^ (self datesBetween: aDate and: aDate) notEmpty
]

{ #category : #enumerating }
ICSchedule >> recurrenceDatesBetween: aStart and: anEnd [
	| dates |
	dates := OrderedCollection new.
	(self start between: aStart and: anEnd)
		ifTrue: [ dates add: self start ].
	dates addAll: self event recurrenceDates.
	dates addAll: (self recurrenceSchedules gather: [ :each | each datesBetween: aStart and: anEnd ]).
	^ dates asSet
]

{ #category : #accessing }
ICSchedule >> recurrenceSchedules [
	^ recurrenceSchedules
]

{ #category : #accessing }
ICSchedule >> recurrenceSchedules: anObject [
	recurrenceSchedules := anObject
]

{ #category : #updating }
ICSchedule >> setEnd [
	end:=(self recurrenceSchedules collect:[:each | each end]) max
]

{ #category : #accessing }
ICSchedule >> start [
	^self event start
]

{ #category : #accessing }
ICSchedule >> useCache [
	
	^ useCache
]
