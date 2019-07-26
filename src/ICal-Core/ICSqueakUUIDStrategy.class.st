Class {
	#name : #ICSqueakUUIDStrategy,
	#superclass : #ICStrategy,
	#category : 'ICal-Core-Strategy'
}

{ #category : #generating }
ICSqueakUUIDStrategy >> generateUid [
	^UUID new printString
]
