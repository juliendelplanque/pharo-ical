Class {
	#name : #ICWeekStartDayRule,
	#superclass : #Object,
	#instVars : [
		'weekStartDay'
	],
	#category : 'ICal-Core-Model-Schedule'
}

{ #category : #'as yet unclassified' }
ICWeekStartDayRule class >> newValue: aValue [
	^ self new weekStartDay: aValue
]

{ #category : #'as yet unclassified' }
ICWeekStartDayRule >> dayLetterCodes [
	^ #('SU' 'MO' 'TU' 'WE' 'TH' 'FR' 'SA')
]

{ #category : #accessing }
ICWeekStartDayRule >> initialize [
	super initialize.
	weekStartDay := 'MO'
]

{ #category : #'as yet unclassified' }
ICWeekStartDayRule >> possibleValues [
	^ self dayLetterCodes
]

{ #category : #accessing }
ICWeekStartDayRule >> weekStartDay [
	^ weekStartDay
]

{ #category : #accessing }
ICWeekStartDayRule >> weekStartDay: anObject [
	weekStartDay := anObject
]
