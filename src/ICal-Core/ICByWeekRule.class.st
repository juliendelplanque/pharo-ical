Class {
	#name : #ICByWeekRule,
	#superclass : #ICOrdinalByRule,
	#category : 'ICal-Core-Model-Schedule'
}

{ #category : #'as yet unclassified' }
ICByWeekRule >> applyRulesTo: aCollectionOfDates [
	^ recurringSchedule isYearly
		ifTrue: [ 
			
			weekStart := recurringSchedule weekStart.
			self modifyConsideringOrdinalDayOfWeek: aCollectionOfDates ]
]

{ #category : #'as yet unclassified' }
ICByWeekRule >> dateTestCriteria [
	^ #weekOfYear
]

{ #category : #'as yet unclassified' }
ICByWeekRule >> duration [
	^ self durationClass seconds: 86400 * 7
]

{ #category : #'as yet unclassified' }
ICByWeekRule >> interestingPartOf: aDateAndTime [
	^ self weekOfYearFor: aDateAndTime
]

{ #category : #'as yet unclassified' }
ICByWeekRule >> isWeekly [
	^ true
]

{ #category : #'as yet unclassified' }
ICByWeekRule >> max [
	^ 53
]

{ #category : #'as yet unclassified' }
ICByWeekRule >> min [
	^ -53
]

{ #category : #weeks }
ICByWeekRule >> nearestMonthAndDayFor: aWeekNumber to: aDateAndTime [
	|weekSt monthAndDay |
	weekSt:=self weekStartForWeekNumber: aWeekNumber ofYearFor: aDateAndTime .
	monthAndDay := Array new: 2.
	monthAndDay at: 1 put: weekSt  month.
	monthAndDay at: 2 put: weekSt dayOfMonth.
	^monthAndDay 
]

{ #category : #'as yet unclassified' }
ICByWeekRule >> newDateFrom: aDateAndTime withInterestingCharacteristic: weekOfYear [
	| monthAndDay |
	monthAndDay := self nearestMonthAndDayFor: weekOfYear to: aDateAndTime.
	^ self dateAndTimeClass
		year: (self yearFor: aDateAndTime)
		month: monthAndDay first
		day: monthAndDay last
		hour: (self hourFor: aDateAndTime)
		minute: (self minuteFor: aDateAndTime)
		second: (self secondFor: aDateAndTime)
]

{ #category : #'as yet unclassified' }
ICByWeekRule >> ordinalIndexesFor: eachDate [
	| index weeksOfYear |
	weeksOfYear := self weeksOfYearFor: eachDate.
	index := 0.
	weeksOfYear
		detect: [ :each | 
			index := index + 1.
			each includes: eachDate ].
	^ Array with: index with: index - weeksOfYear size
]

{ #category : #'as yet unclassified' }
ICByWeekRule >> sortOrder [
	^ 2
]
