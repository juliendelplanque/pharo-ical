accessing
lastRuleDuration
	^ lastRuleDuration ifNil: [ lastRuleDuration := self intervalDuration ]