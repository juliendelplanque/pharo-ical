testing
canUseCommandShell
	^self canUseOsProcess
		and: [ Smalltalk hasClassNamed: #PipeableOSProcess ]