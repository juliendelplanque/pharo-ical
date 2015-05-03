accessing
randomParts
	| parts |
	parts := OrderedCollection new.
	self canUseOsProcess ifTrue: [
		parts add: self processId ].
	parts add: self memoryUsage.
	parts add: self uptime.
	parts add: self uuid.
	^parts