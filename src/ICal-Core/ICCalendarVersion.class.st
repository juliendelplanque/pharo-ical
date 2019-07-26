Class {
	#name : #ICCalendarVersion,
	#superclass : #DynamicVariable,
	#category : 'ICal-Core-Parser'
}

{ #category : #'as yet unclassified' }
ICCalendarVersion class >> defaultValue [
	^ 2.0
]

{ #category : #'as yet unclassified' }
ICCalendarVersion class >> use: anObject during: aBlock [
	^self value: anObject during:aBlock
]

{ #category : #'as yet unclassified' }
ICCalendarVersion >> default [
	^ self class defaultValue
]
