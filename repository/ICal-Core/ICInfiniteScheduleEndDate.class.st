Class {
	#name : #ICInfiniteScheduleEndDate,
	#superclass : #ICAbstractRecurringScheduleEndDate,
	#category : 'ICal-Core-Model-Schedule'
}

{ #category : #length }
ICInfiniteScheduleEndDate >> duration [
	^ICConversion infiniteDuration
]

{ #category : #testing }
ICInfiniteScheduleEndDate >> isInfinite [
	^ true
]

{ #category : #length }
ICInfiniteScheduleEndDate >> trimEndOf: someDates [
	^ someDates
]
