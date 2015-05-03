events
removeEventWithUid: aString
	| event |
	event := self events detect: [ :each | each uid = aString] ifNone: [^nil].
	^self removeEvent: event.
	