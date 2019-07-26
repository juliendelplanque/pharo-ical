Class {
	#name : #ICByYearDayRule,
	#superclass : #ICByMonthDayRule,
	#category : 'ICal-Core-Model-Schedule'
}

{ #category : #'as yet unclassified' }
ICByYearDayRule >> interestingPartOf: aDateAndTime [
	^ aDateAndTime dayOfYear
]

{ #category : #'as yet unclassified' }
ICByYearDayRule >> isYearDay [
	^ true
]

{ #category : #'as yet unclassified' }
ICByYearDayRule >> max [
	^ 366
]

{ #category : #'as yet unclassified' }
ICByYearDayRule >> min [
	^ -366
]

{ #category : #'as yet unclassified' }
ICByYearDayRule >> newDateFrom: aDateAndTime withInterestingCharacteristic: dayOfYear [
	^ self dateAndTimeClass
		year: (self yearFor: aDateAndTime)
		day: dayOfYear
		hour: (self hourFor: aDateAndTime)
		minute: (self minuteFor: aDateAndTime)
		second: (self secondFor: aDateAndTime)
]

{ #category : #'as yet unclassified' }
ICByYearDayRule >> ordinalIndexesFor: eachDate [
	| index |
	index := eachDate dayOfYear.
	^ Array with: index with: index - eachDate daysInYear
]

{ #category : #'as yet unclassified' }
ICByYearDayRule >> sortOrder [
	^ 3
]

{ #category : #'as yet unclassified' }
ICByYearDayRule >> testCriteria [
	^ #dayOfYear
]
