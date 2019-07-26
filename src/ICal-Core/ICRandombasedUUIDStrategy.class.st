Class {
	#name : #ICRandombasedUUIDStrategy,
	#superclass : #ICStrategy,
	#category : 'ICal-Core-Strategy'
}

{ #category : #generating }
ICRandombasedUUIDStrategy >> generateUid [
	^(PipeableOSProcess command: 'uuidgen -r') output
]
