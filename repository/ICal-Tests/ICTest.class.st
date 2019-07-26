Class {
	#name : #ICTest,
	#superclass : #TestCase,
	#category : 'ICal-Tests-Core'
}

{ #category : #testing }
ICTest class >> isAbstract [

	^self name = #ICTest
			
]

{ #category : #private }
ICTest >> dateAndTimeClass [
	^ICConversion dateAndTimeClass
]

{ #category : #private }
ICTest >> dateClass [
	^ICConversion dateClass
]

{ #category : #private }
ICTest >> durationClass [
	^ICConversion durationClass
]

{ #category : #private }
ICTest >> timeClass [
	^ICConversion timeClass
]

{ #category : #private }
ICTest >> timespanClass [
	^ ICConversion timespanClass
]
