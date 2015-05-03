accessing
infiniteDuration 
	^self hasChronosLoaded
		ifTrue: [ self environment classNamed: 'InfiniteDuration' ]
		ifFalse: [ (1000*1000*365.25 ) days ]