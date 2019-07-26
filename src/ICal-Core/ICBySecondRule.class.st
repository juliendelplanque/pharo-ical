Class {
	#name : #ICBySecondRule,
	#superclass : #ICAbstractByRule,
	#category : 'ICal-Core-Model-Schedule'
}

{ #category : #'as yet unclassified' }
ICBySecondRule >> dateTestCriteria [
	^ #second
]

{ #category : #'as yet unclassified' }
ICBySecondRule >> duration [
	^ self durationClass seconds: 1
]

{ #category : #'as yet unclassified' }
ICBySecondRule >> interestingPartOf: aDateAndTime [
	^ aDateAndTime second
]

{ #category : #'as yet unclassified' }
ICBySecondRule >> isSecondly [
	^ true
]

{ #category : #'as yet unclassified' }
ICBySecondRule >> max [
	^ 59
]

{ #category : #'as yet unclassified' }
ICBySecondRule >> newDateFrom: aDateAndTime withInterestingCharacteristic: second [
	^ self dateAndTimeClass
		year: (self yearFor: aDateAndTime)
		month: (self monthFor: aDateAndTime)
		day: (self dayOfMonthFor: aDateAndTime)
		hour: (self hourFor: aDateAndTime)
		minute: (self minuteFor: aDateAndTime)
		second: second
]

{ #category : #'as yet unclassified' }
ICBySecondRule >> sortOrder [
	^ 8
]
