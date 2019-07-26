Class {
	#name : #ICTimebasedUUIDStrategy,
	#superclass : #ICStrategy,
	#category : 'ICal-Core-Strategy'
}

{ #category : #generating }
ICTimebasedUUIDStrategy >> generateUid [
	^(PipeableOSProcess command: 'uuidgen -t') output
]
