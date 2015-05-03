testing
everyDayAtSameTimes
	"Answer false if unknown"

	| oneDay |
	oneDay := self durationClass seconds: 86400.
	^ self byRules allSatisfy: [ :each | each duration >= oneDay ]