Class {
	#name : #ICByMinuteRule,
	#superclass : #ICAbstractByRule,
	#category : 'ICal-Core-Model-Schedule'
}

{ #category : #'as yet unclassified' }
ICByMinuteRule >> dateTestCriteria [
	^ #minute
]

{ #category : #'as yet unclassified' }
ICByMinuteRule >> duration [
	^ self durationClass seconds: 60
]

{ #category : #'as yet unclassified' }
ICByMinuteRule >> interestingPartOf: aDateAndTime [
	^ aDateAndTime minute
]

{ #category : #'as yet unclassified' }
ICByMinuteRule >> isMinutely [
	^ true
]

{ #category : #'as yet unclassified' }
ICByMinuteRule >> max [
	^ 59
]

{ #category : #'as yet unclassified' }
ICByMinuteRule >> newDateFrom: aDateAndTime withInterestingCharacteristic: minute [
	^ self dateAndTimeClass
		year: (self yearFor: aDateAndTime)
		month: (self monthFor: aDateAndTime)
		day: (self dayOfMonthFor: aDateAndTime)
		hour: (self hourFor: aDateAndTime)
		minute: minute
		second: (self secondFor: aDateAndTime)
]

{ #category : #'as yet unclassified' }
ICByMinuteRule >> sortOrder [
	^ 7
]
