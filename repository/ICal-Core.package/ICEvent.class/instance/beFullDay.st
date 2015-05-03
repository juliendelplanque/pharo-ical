actions
beFullDay
	self start ifNotNil: [
		self start: self start asDate ].
	self end isNil
		ifTrue: [ self end: self start + (self durationClass days: 1) ]
		ifFalse: [ self end: self end asDate ]	