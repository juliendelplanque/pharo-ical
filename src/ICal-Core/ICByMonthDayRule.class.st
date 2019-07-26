Class {
	#name : #ICByMonthDayRule,
	#superclass : #ICAbstractByRule,
	#category : 'ICal-Core-Model-Schedule'
}

{ #category : #'as yet unclassified' }
ICByMonthDayRule >> dateTestCriteria [
	^ #dayOfMonth
]

{ #category : #'as yet unclassified' }
ICByMonthDayRule >> duration [
	^ self durationClass seconds: 86400
]

{ #category : #growing }
ICByMonthDayRule >> interestingPartOf: aDateAndTime [
	^aDateAndTime dayOfMonth 
]

{ #category : #growing }
ICByMonthDayRule >> isMonthDay [
	^ true
]

{ #category : #'as yet unclassified' }
ICByMonthDayRule >> max [
	^ 31
]

{ #category : #'as yet unclassified' }
ICByMonthDayRule >> min [
	^ -31
]

{ #category : #growing }
ICByMonthDayRule >> newDateFrom: aDateAndTime withInterestingCharacteristic: dayOfMonth [
|dayToUse|
dayToUse := dayOfMonth <0 ifTrue: [aDateAndTime daysInMonth + dayOfMonth +1 ] ifFalse: [dayOfMonth ].
	^ self dateAndTimeClass
		year: (self yearFor: aDateAndTime)
		month: (self monthFor: aDateAndTime)
		day: dayToUse
		hour: (self hourFor: aDateAndTime)
		minute: (self minuteFor: aDateAndTime)
		second: (self secondFor: aDateAndTime)
]

{ #category : #'as yet unclassified' }
ICByMonthDayRule >> ordinalIndexesFor: eachDate [
	| index |
	index := eachDate dayOfMonth.
	^ Array with: index with: index - eachDate daysInMonth
]

{ #category : #'as yet unclassified' }
ICByMonthDayRule >> shrinkTestFor: eachDate [
	| indexes |
	indexes := self ordinalIndexesFor: eachDate.
	^ self byValues anySatisfy: [ :eachValue | indexes includes: eachValue ]
]

{ #category : #'as yet unclassified' }
ICByMonthDayRule >> sortOrder [
	^ 4
]
