Class {
	#name : #ICRecommendedByStandardStrategy,
	#superclass : #ICStrategy,
	#instVars : [
		'uuidstragety',
		'hostName'
	],
	#category : 'ICal-Core-Strategy'
}

{ #category : #accessing }
ICRecommendedByStandardStrategy class >> uuidstragetyClass [
	^ICSqueakUUIDStrategy 
]

{ #category : #testing }
ICRecommendedByStandardStrategy >> canUseCommandShell [
	^self canUseOsProcess
		and: [ Smalltalk hasClassNamed: #PipeableOSProcess ]
]

{ #category : #testing }
ICRecommendedByStandardStrategy >> canUseOsProcess [
	^Smalltalk hasClassNamed: #OSProcess
]

{ #category : #private }
ICRecommendedByStandardStrategy >> dateAndTimeClass [
	^ICConversion dateAndTimeClass
]

{ #category : #generating }
ICRecommendedByStandardStrategy >> generateUid [
	^String streamContents: 
			[:stream | 
			stream
				nextPutAll: self now;
				nextPut: $-.
			self randomParts do: [:each | stream nextPutAll: each]
				separatedBy: [stream nextPut: $-].
			stream
				nextPut: $@;
				nextPutAll: self hostName]
]

{ #category : #private }
ICRecommendedByStandardStrategy >> getHostName [
	| name isOSProcessFixed |
	self flag: #todo. "fix OS process"
	isOSProcessFixed := false.
	name := NetNameResolver localHostName.	
	isOSProcessFixed ifTrue: [
		(name = 'localhost' and: [ self canUseCommandShell ] and: [ self isUnix ])
			ifTrue: [
				"the vm screw up and returned localhost, this is a 'feature' of the Unix VM
				but fortunately we can use OSProcess and command shell to fix that"
				name := UnixProcess waitForCommandOutput: 'hostname'.			
				(UnixProcess waitForCommandOutput: 'dnsdomainname') output in: [ :domain |
					 domain isEmptyOrNil ifFalse: [ name := name , '.'  , domain ] ] ] ].
	^name
]

{ #category : #private }
ICRecommendedByStandardStrategy >> gethostname: aString with: anInteger [
	"<cdecl: long 'openlog' (char*  long) module: 'libc.so.5'>"
	^self primitiveFailed
]

{ #category : #private }
ICRecommendedByStandardStrategy >> gethostnameFFi [
	| bufferSize buffer status |
	bufferSize := 255.
	buffer := String new: 255.
	status := self gethostname: buffer with: bufferSize.
	^buffer
]

{ #category : #accessing }
ICRecommendedByStandardStrategy >> hostName [
	hostName isNil ifTrue: [
		hostName := self getHostName ].
	^hostName
]

{ #category : #'initialize-release' }
ICRecommendedByStandardStrategy >> initialize [
	super initialize.
	uuidstragety := self class uuidstragetyClass new.
]

{ #category : #testing }
ICRecommendedByStandardStrategy >> isUnix [
	^OSProcess thisOSProcess isKindOf: UnixProcess
]

{ #category : #accessing }
ICRecommendedByStandardStrategy >> memoryUsage [
	| params  |
	params := SmalltalkImage current getVMParameters.
	^(params at: 2) printStringHex asLowercase

]

{ #category : #accessing }
ICRecommendedByStandardStrategy >> now [
	^self dateAndTimeClass now asICalString
]

{ #category : #accessing }
ICRecommendedByStandardStrategy >> processId [
	^OSProcess thisOSProcess pid printStringHex asLowercase
]

{ #category : #accessing }
ICRecommendedByStandardStrategy >> randomParts [
	| parts |
	parts := OrderedCollection new.
	self canUseOsProcess ifTrue: [
		parts add: self processId ].
	parts add: self memoryUsage.
	parts add: self uptime.
	parts add: self uuid.
	^parts
]

{ #category : #accessing }
ICRecommendedByStandardStrategy >> uptime [
	^Time millisecondClockValue printStringHex asLowercase
]

{ #category : #accessing }
ICRecommendedByStandardStrategy >> uuid [
	^self uuidstragety generateUid
]

{ #category : #accessing }
ICRecommendedByStandardStrategy >> uuidstragety [
	^uuidstragety
]
