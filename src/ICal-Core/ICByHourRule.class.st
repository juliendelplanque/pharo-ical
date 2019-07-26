Class {
	#name : #ICByHourRule,
	#superclass : #ICAbstractByRule,
	#category : 'ICal-Core-Model-Schedule'
}

{ #category : #'as yet unclassified' }
ICByHourRule >> dateTestCriteria [
	^ #hour
]

{ #category : #'as yet unclassified' }
ICByHourRule >> duration [
	^ self durationClass seconds: 3600
]

{ #category : #growing }
ICByHourRule >> interestingPartOf: aDateAndTime [
	^ aDateAndTime hour
]

{ #category : #testing }
ICByHourRule >> isHourly [
	^ true
]

{ #category : #'as yet unclassified' }
ICByHourRule >> max [
	^ 23
]

{ #category : #growing }
ICByHourRule >> newDateFrom: aDateAndTime withInterestingCharacteristic: hour [
	^ self dateAndTimeClass
		year: (self yearFor: aDateAndTime)
		month: (self monthFor: aDateAndTime)
		day: (self dayOfMonthFor: aDateAndTime)
		hour: hour
		minute: (self minuteFor: aDateAndTime)
		second: (self secondFor: aDateAndTime)
]

{ #category : #'as yet unclassified' }
ICByHourRule >> sortOrder [
	^ 6
]
