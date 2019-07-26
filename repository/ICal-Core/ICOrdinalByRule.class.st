Class {
	#name : #ICOrdinalByRule,
	#superclass : #ICAbstractByRule,
	#instVars : [
		'weekStart'
	],
	#category : 'ICal-Core-Model-Schedule'
}

{ #category : #'as yet unclassified' }
ICOrdinalByRule >> applyRulesTo: aCollectionOfDates [
	self setWeekStart.
	
	^ self ordinalIsPossible
		ifTrue: [ self modifyConsideringOrdinalDayOfWeek: aCollectionOfDates ]
		ifFalse: [ super modify: aCollectionOfDates ]
]

{ #category : #'as yet unclassified' }
ICOrdinalByRule >> dayLetterCodeFor: each [
	^ self dayLetterCodes at: each dayOfWeek
]

{ #category : #'as yet unclassified' }
ICOrdinalByRule >> dayLetterCodes [
	^ #('SU' 'MO' 'TU' 'WE' 'TH' 'FR' 'SA')
]

{ #category : #growing }
ICOrdinalByRule >> growWithOrdinals: oldDates [
	^ self grow: oldDates
]

{ #category : #'as yet unclassified' }
ICOrdinalByRule >> modifyConsideringOrdinalDayOfWeek: aCollectionOfDates [
	(self byValues anySatisfy: [ :each | each isString not ])
		ifFalse: [ ^ super modify: aCollectionOfDates ].
	^self shouldShrink
		ifTrue: [ self shrinkWithOrdinals: aCollectionOfDates ]
		ifFalse: [ self growWithOrdinals: aCollectionOfDates ]
]

{ #category : #'as yet unclassified' }
ICOrdinalByRule >> ordinalIsPossible [
	^ true
]

{ #category : #shrink }
ICOrdinalByRule >> shrinkWithOrdinals: aCollectionOfDates [
	^ aCollectionOfDates removeAllSuchThat: [ :eachDate | self ordinalShrinkTestFor: eachDate ]
]

{ #category : #weeks }
ICOrdinalByRule >> startOfFirstWeekAccordingToRFC2445For: aDate [
	| year weekStartIndex midWeekDay |
	weekStartIndex := self dayLetterCodes indexOf: self weekStart.
	midWeekDay := self dayLetterCodes atWrap: weekStartIndex + 3.
	year := aDate itsYear.
	year
		daysDo: [ :each | 
			midWeekDay = (self dayLetterCodeFor: each)
				ifTrue: [ ^ each start - (self durationClass days:3) ] ]
]

{ #category : #weeks }
ICOrdinalByRule >> startOfWeekFor: aDateAndTime [
	| year weekStartIndex days dayOfWeek |
	weekStartIndex := self weekDayNumberFor: self weekStart.
	dayOfWeek := aDateAndTime dayOfWeek.
	days := weekStartIndex - dayOfWeek.
	weekStartIndex > dayOfWeek
		ifTrue: [ days := days - 7 ]. 
		^aDateAndTime +(self durationClass seconds: 86400* days) 
]

{ #category : #weeks }
ICOrdinalByRule >> weekDayNumberFor: letterCode [
	^ self dayLetterCodes indexOf: letterCode
]

{ #category : #weeks }
ICOrdinalByRule >> weekNumber: aWeekNumber ofYearFor: aDate [
	| dt wks weekNum |
	weekNum := 1.
	dt := self startOfFirstWeekAccordingToRFC2445For: aDate.
	[ dt year <= aDate year ]
		whileTrue: [ 
			weekNum = aWeekNumber
				ifTrue: [ ^ Timespan starting: dt duration: (self durationClass days: 7) ].
			dt := dt + (self durationClass days: 7).
			weekNum := weekNum + 1 ]
]

{ #category : #weeks }
ICOrdinalByRule >> weekStart [
	^ weekStart ifNil: [ weekStart := 'MO' ]
]

{ #category : #'as yet unclassified' }
ICOrdinalByRule >> weekStart: aDayLetterCode [
	weekStart := aDayLetterCode
]

{ #category : #weeks }
ICOrdinalByRule >> weekStartForWeekNumber: aWeekNumber ofYearFor: aDate [
	| dt wks weekNum |
	weekNum := 1.
	dt := self startOfFirstWeekAccordingToRFC2445For: aDate.
	[ dt year <= aDate year ]
		whileTrue: [ 
			weekNum = aWeekNumber
				ifTrue: [ ^ dt ].
			dt := dt + (self durationClass days: 7).
			weekNum := weekNum + 1 ]
]

{ #category : #weeks }
ICOrdinalByRule >> weeksOfYearFor: aDate [
	| dt wks |
	wks := OrderedCollection new.
	dt := self startOfFirstWeekAccordingToRFC2445For: aDate.
	[ dt year <= aDate year ]
		whileTrue: [ 
			wks add: (self timespanClass starting: dt duration: (self durationClass days: 7)).
			dt := dt + (self durationClass days: 7) ].
	^ wks
]
