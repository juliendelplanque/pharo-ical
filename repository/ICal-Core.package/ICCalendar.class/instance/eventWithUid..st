events
eventWithUid: anUid
	^self events detect: [ :each | each uid = anUid ]