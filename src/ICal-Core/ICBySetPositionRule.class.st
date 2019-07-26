Class {
	#name : #ICBySetPositionRule,
	#superclass : #ICAbstractByRule,
	#category : 'ICal-Core-Model-Schedule'
}

{ #category : #'as yet unclassified' }
ICBySetPositionRule >> max [
	^ 366
]

{ #category : #'as yet unclassified' }
ICBySetPositionRule >> min [
	^ -366
]

{ #category : #'as yet unclassified' }
ICBySetPositionRule >> modify: aCollectionOfDates [
	|newDates|
	newDates :=OrderedCollection new. 
	
	
	 self byValues
		collect: [ :eachOrdinal | 
			newDates addAll:(eachOrdinal > 0
				ifTrue: [ self select: eachOrdinal fromStartOf:aCollectionOfDates ]
				ifFalse: [ self select: eachOrdinal fromEndOf: aCollectionOfDates ]) ].
			^newDates
]

{ #category : #shrinking }
ICBySetPositionRule >> select: indexFromEnd  fromEndOf: someDates [
	|selectedDates index |
	index:=indexFromEnd negated. 
	selectedDates :=OrderedCollection new. 
	(someDates groupedBy: [:each | self groupFor: each]) do:[:eachGroup | 
	index > eachGroup size ifFalse: [selectedDates add: (eachGroup  reverse at: index ) ]].
	^selectedDates sort
	
]

{ #category : #shrinking }
ICBySetPositionRule >> select: indexFromStart fromStartOf: someDates [
	| selectedDates |
	selectedDates := OrderedCollection new.
	(someDates groupedBy: [ :each | self groupFor: each ])
		do: [ :eachGroup | 
			indexFromStart > eachGroup size
				ifFalse: [ selectedDates add: (eachGroup at: indexFromStart) ] ].
	^ selectedDates sort
]

{ #category : #'as yet unclassified' }
ICBySetPositionRule >> shouldShrink [
	^ true
]

{ #category : #'as yet unclassified' }
ICBySetPositionRule >> sortOrder [
	^ 9
]
