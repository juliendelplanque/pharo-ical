Class {
	#name : #ICByMonthRule,
	#superclass : #ICAbstractByRule,
	#category : 'ICal-Core-Model-Schedule'
}

{ #category : #'as yet unclassified' }
ICByMonthRule >> dateTestCriteria [
	^ #month
]

{ #category : #'as yet unclassified' }
ICByMonthRule >> duration [
	^ self durationClass seconds: 86400 * 31
]

{ #category : #'as yet unclassified' }
ICByMonthRule >> interestingPartOf: aDateAndTime [
	^ aDateAndTime month
]

{ #category : #'as yet unclassified' }
ICByMonthRule >> isMonthly [
	^ true
]

{ #category : #'as yet unclassified' }
ICByMonthRule >> max [
	^ 12
]

{ #category : #'as yet unclassified' }
ICByMonthRule >> min [
	^ 1
]

{ #category : #'as yet unclassified' }
ICByMonthRule >> newDateFrom: aDateAndTime withInterestingCharacteristic: month [
	^ self dateAndTimeClass
		year: (self yearFor: aDateAndTime)
		month: month
		day: (self dayOfMonthFor: aDateAndTime)
		hour: (self hourFor: aDateAndTime)
		minute: (self minuteFor: aDateAndTime)
		second: (self secondFor: aDateAndTime)
]

{ #category : #'as yet unclassified' }
ICByMonthRule >> sortOrder [
	^ 1
]
