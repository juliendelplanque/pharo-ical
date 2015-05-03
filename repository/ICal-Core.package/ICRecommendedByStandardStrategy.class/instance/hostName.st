accessing
hostName
	hostName isNil ifTrue: [
		hostName := self getHostName ].
	^hostName