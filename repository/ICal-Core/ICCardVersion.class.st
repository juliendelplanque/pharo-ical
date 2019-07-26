Class {
	#name : #ICCardVersion,
	#superclass : #DynamicVariable,
	#category : 'ICal-Core-VCard-Parser'
}

{ #category : #'as yet unclassified' }
ICCardVersion class >> defaultValue [
	^ 3.0
]

{ #category : #'as yet unclassified' }
ICCardVersion class >> use: anObject during: aBlock [
	^self value:anObject during:aBlock
]

{ #category : #'as yet unclassified' }
ICCardVersion >> default [
	^self class defaultValue
]
