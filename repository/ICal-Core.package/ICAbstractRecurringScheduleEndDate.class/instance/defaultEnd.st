limits
defaultEnd
	"has to be something long to get the occurrences and act like its infinite.  "

	^ self schedule start + (self durationClass days: 10000 * 365)