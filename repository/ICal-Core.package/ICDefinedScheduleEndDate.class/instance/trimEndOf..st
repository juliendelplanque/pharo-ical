length
trimEndOf: someDates
	someDates last > lastDay
		ifTrue: [ someDates removeAllSuchThat: [ :each | each > lastDay ] ].
	^ someDates