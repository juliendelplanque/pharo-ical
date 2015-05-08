todos
todoWithUid: anUid
	^self todos detect: [ :each | each uid = anUid ]