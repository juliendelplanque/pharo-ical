"
ByRules are evaluated in the following order:  BYMONTH, BYWEEKNO, BYYEARDAY, BYMONTHDAY, BYDAY, BYHOUR,  BYMINUTE, BYSECOND and BYSETPOS as per rfc2445.

If the rule is applied to a ICRecurrenceFrequency of longer duration it will increase the number of occurrences and if it is applied to an ICRecurrenceFrequency of shorter duration it will decrease the number of occurrences.  

ByRules are applied after FREQ and INTERVAL and before UNTIL and COUNT.  Underspecified valeus are taken from the DSTART of the event.  
"
Class {
	#name : #ICAbstractByRule,
	#superclass : #ICComponent,
	#instVars : [
		'byValues',
		'recurringSchedule'
	],
	#category : 'ICal-Core-Model-Schedule'
}

{ #category : #'as yet unclassified' }
ICAbstractByRule class >> withAll: aCollectionOfValues [
	^ self new byValues: aCollectionOfValues
]

{ #category : #'as yet unclassified' }
ICAbstractByRule class >> withAll: aCollectionOfValues asPartOf: aRecurringSchedule [
	^ self new
		byValues: aCollectionOfValues;
		recurringSchedule: aRecurringSchedule;
		yourself
]

{ #category : #'as yet unclassified' }
ICAbstractByRule >> <= otherByRule [
	^ self sortOrder <= otherByRule sortOrder
]

{ #category : #evaluating }
ICAbstractByRule >> applyRulesTo: someDates [

	^ self modify: someDates
]

{ #category : #accessing }
ICAbstractByRule >> byValues [
	^ byValues
]

{ #category : #accessing }
ICAbstractByRule >> byValues: aCollection [
	byValues := aCollection
]

{ #category : #hashing }
ICAbstractByRule >> dayGranularityHash: aDateAndTime [
	^ aDateAndTime year * 1000 + aDateAndTime dayOfYear
]

{ #category : #dateAndTimeFractions }
ICAbstractByRule >> dayOfMonthFor: aDateAndTime [
	^ aDateAndTime dayOfMonth
]

{ #category : #accessing }
ICAbstractByRule >> duration [
	^self recurringSchedule intervalDuration 
]

{ #category : #hashing }
ICAbstractByRule >> groupFor: aDateAndTime [
	self recurringSchedule isYearly
		ifTrue: [ ^ self yearGranularityHash: aDateAndTime ].
	self recurringSchedule isMonthly
		ifTrue: [ ^ self monthGranularityHash: aDateAndTime ].
	self recurringSchedule isWeekly
		ifTrue: [ ^ self weekGranularityHash: aDateAndTime ].
	self recurringSchedule isDaily
		ifTrue: [ ^ self dayGranularityHash: aDateAndTime ].
	self recurringSchedule isHourly
		ifTrue: [ ^ self hourGranularityHash: aDateAndTime ].
	self recurringSchedule isMinutely
		ifTrue: [ ^ self minuteGranularityHash: aDateAndTime ].
	self recurringSchedule isSecondly
		ifTrue: [ ^ self secondGranularityHash: aDateAndTime ]
]

{ #category : #growing }
ICAbstractByRule >> grow: oldDates [
	| newDates |
	newDates := OrderedCollection new.
	(oldDates groupedBy: [ :each | self groupFor: each ])
		do: [ :existingDates | newDates addAll: (self newDatesFrom: self byValues considering: existingDates) ].
	^ newDates sort
]

{ #category : #dateAndTimeFractions }
ICAbstractByRule >> hourFor: aDateAndTime [
	^ aDateAndTime hour
]

{ #category : #hashing }
ICAbstractByRule >> hourGranularityHash: aDateAndTime [
	^ aDateAndTime year * 100000 + (aDateAndTime dayOfYear * 100) + aDateAndTime hour
]

{ #category : #growing }
ICAbstractByRule >> interestingPartOf: aDateAndTime [
	self subclassResponsibility
]

{ #category : #testing }
ICAbstractByRule >> isDaily [
	^ false
]

{ #category : #testing }
ICAbstractByRule >> isHourly [
	^ false
]

{ #category : #testing }
ICAbstractByRule >> isMinutely [
	^ false
]

{ #category : #testing }
ICAbstractByRule >> isMonthDay [
	^ false
]

{ #category : #testing }
ICAbstractByRule >> isMonthly [
	^ false
]

{ #category : #testing }
ICAbstractByRule >> isSecondly [
	^ false
]

{ #category : #testing }
ICAbstractByRule >> isWeekly [
	^ false
]

{ #category : #testing }
ICAbstractByRule >> isYearDay [
	^ false
]

{ #category : #testing }
ICAbstractByRule >> isYearly [
	^ false
]

{ #category : #'as yet unclassified' }
ICAbstractByRule >> max [
	self subclassResponsibility
]

{ #category : #'as yet unclassified' }
ICAbstractByRule >> min [
	^ 0
]

{ #category : #dateAndTimeFractions }
ICAbstractByRule >> minuteFor: aDateAndTime [
	^ aDateAndTime minute
]

{ #category : #hashing }
ICAbstractByRule >> minuteGranularityHash: aDateAndTime [
	^ (self hourGranularityHash: aDateAndTime) hashMultiply bitXor: aDateAndTime minute
]

{ #category : #'as yet unclassified' }
ICAbstractByRule >> modify: aCollectionOfDates [
	^ self shouldShrink
		ifTrue: [ self shrink: aCollectionOfDates ]
		ifFalse: [ self grow: aCollectionOfDates ]
]

{ #category : #evaluating }
ICAbstractByRule >> modifyDatesInProcess [
	^self modify: self schedule datesInProcess 
]

{ #category : #dateAndTimeFractions }
ICAbstractByRule >> monthFor: aDateAndTime [
	^ aDateAndTime month
]

{ #category : #hashing }
ICAbstractByRule >> monthGranularityHash: aDateAndTime [
	^ aDateAndTime year * 100 + aDateAndTime month
]

{ #category : #growing }
ICAbstractByRule >> newDateFrom: aDateAndTime withInterestingCharacteristic: characteristic [
	^ self dateAndTimeClass
		year: (self yearFor: aDateAndTime)
		month: (self monthFor: aDateAndTime)
		day: (self dayOfMonthFor: aDateAndTime)
		hour: (self hourFor: aDateAndTime)
		minute: (self minuteFor: aDateAndTime)
		second: (self secondFor: aDateAndTime)
]

{ #category : #growing }
ICAbstractByRule >> newDatesFrom: neededByValues considering: existingDates [
	^ neededByValues collect: [ :each | self newDateFrom: existingDates first withInterestingCharacteristic: each ]
]

{ #category : #accessing }
ICAbstractByRule >> recurringSchedule [
	^ recurringSchedule
]

{ #category : #accessing }
ICAbstractByRule >> recurringSchedule: anICWeekRecurrenceSchedule [ 

	recurringSchedule := anICWeekRecurrenceSchedule
]

{ #category : #dateAndTimeFractions }
ICAbstractByRule >> secondFor: aDateAndTime [
	^ aDateAndTime second
]

{ #category : #hashing }
ICAbstractByRule >> secondGranularityHash: aDateAndTime [
	^ (self minuteGranularityHash: aDateAndTime) hashMultiply bitXor: aDateAndTime second
]

{ #category : #evaluating }
ICAbstractByRule >> setLastRuleAppliedDuration [
	self recurringSchedule lastRuleDuration: self duration
]

{ #category : #testing }
ICAbstractByRule >> shouldShrink [
	^ recurringSchedule lastRuleDuration <= self duration
]

{ #category : #'as yet unclassified' }
ICAbstractByRule >> shrink: aCollectionOfDates [
	^ aCollectionOfDates removeAllSuchThat: [ :each | self shrinkTestFor: each ]
]

{ #category : #'as yet unclassified' }
ICAbstractByRule >> shrinkTestFor: each [
	^ (self byValues includes: (each perform: self dateTestCriteria)) not
]

{ #category : #'as yet unclassified' }
ICAbstractByRule >> sortOrder [
	self subclassResponsibility
]

{ #category : #hashing }
ICAbstractByRule >> weekGranularityHash: aDateAndTime [
	^ aDateAndTime year * 100 + (aDateAndTime dayOfYear / 7.0) ceiling
]

{ #category : #dateAndTimeFractions }
ICAbstractByRule >> yearFor: aDateAndTime [
	^ aDateAndTime year
]

{ #category : #hashing }
ICAbstractByRule >> yearGranularityHash: aDateAndTime [
	^ aDateAndTime year
]
