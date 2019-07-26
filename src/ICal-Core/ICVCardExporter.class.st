Class {
	#name : #ICVCardExporter,
	#superclass : #ICExporter,
	#instVars : [
		'cards'
	],
	#category : 'ICal-Core-VCard-IO'
}

{ #category : #'instance creation' }
ICVCardExporter class >> cards: aCollection [
	^self new
		cards: aCollection;
		yourself
]

{ #category : #accessing }
ICVCardExporter >> cards [
	^cards
]

{ #category : #accessing }
ICVCardExporter >> cards: anObject [
	cards := anObject
]

{ #category : #accessing }
ICVCardExporter >> contentType [
	^self contentType30
]

{ #category : #accessing }
ICVCardExporter >> contentType21 [
	^'text/x-vcard'
]

{ #category : #accessing }
ICVCardExporter >> contentType30 [
	^'text/directory'
]

{ #category : #exporting }
ICVCardExporter >> export [
	self dataStream reset.
	self lineStream reset.
	self cards do: [ :each |
		ICCardVersion
			use: each version
			during: [ self export: each ] ].
	self save
]

{ #category : #'exporting-values' }
ICVCardExporter >> exportAddresses: anObject [ 
	self exportProperty: anObject type: ICVCardConversion addressType
]

{ #category : #'exporting-values' }
ICVCardExporter >> exportAim: anObject [ 
	self exportProperty: anObject type: ICVCardConversion aimType
]

{ #category : #'exporting-values' }
ICVCardExporter >> exportBirthday: anObject [ 
	self exportProperty: anObject type: ICVCardConversion birthdayType
]

{ #category : #'exporting-values' }
ICVCardExporter >> exportCategories: anObject [ 
	self exportProperty: anObject type: ICVCardConversion categoriesType
]

{ #category : #'exporting-values' }
ICVCardExporter >> exportEmails: anObject [ 
	self exportProperty: anObject type: ICVCardConversion emailType
]

{ #category : #'exporting-values' }
ICVCardExporter >> exportFullname: anObject [ 
	self exportProperty: anObject type: ICVCardConversion fullnameType
]

{ #category : #'exporting-values' }
ICVCardExporter >> exportIcq: anObject [ 
	self exportProperty: anObject type: ICVCardConversion icqType
]

{ #category : #exporting }
ICVCardExporter >> exportLine: aString [
	ICCardVersion value >= 3.0
		ifTrue: [ self exportNewLine: aString ]
		ifFalse: [ self exportOldLine: aString ]
]

{ #category : #'exporting-values' }
ICVCardExporter >> exportMsn: anObject [ 
	self exportProperty: anObject type: ICVCardConversion msnType
]

{ #category : #'exporting-values' }
ICVCardExporter >> exportName: anObject [ 
	self exportProperty: anObject type: ICVCardConversion nameType
]

{ #category : #'exporting-values' }
ICVCardExporter >> exportNickname: anObject [ 
	self exportProperty: anObject type: ICVCardConversion nicknameType
]

{ #category : #'exporting-values' }
ICVCardExporter >> exportNotes: anObject [ 
	self exportProperty: anObject type: ICVCardConversion noteType
]

{ #category : #exporting }
ICVCardExporter >> exportOldLine: aString [
	| start string |
	start := 0.
	string := self stringConversionBlock value: aString.
	(self newLineIndicesFor: string) do: [ :end |
		start = 0
			ifFalse: [ self dataStream space ].
		self dataStream
			next: (end min: string size) - start
			putAll: string
			startingAt: start + 1.
		end = string size ifFalse: [
			self dataStream nextPut: $= ].
		self dataStream nextPutAll: String crlf.
		start := end ]
]

{ #category : #'exporting-values' }
ICVCardExporter >> exportOrganization: anObject [ 
	self exportProperty: anObject type: ICVCardConversion organizationType
]

{ #category : #'exporting-values' }
ICVCardExporter >> exportPhoto: anObject [ 
	self exportProperty: anObject type: ICVCardConversion photoType
]

{ #category : #'exporting-values' }
ICVCardExporter >> exportTelephones: anObject [ 
	self exportProperty: anObject type: ICVCardConversion telephoneType
]

{ #category : #'exporting-values' }
ICVCardExporter >> exportTimeZone: anObject [ 
	self exportProperty: anObject type: ICVCardConversion timeZoneType
]

{ #category : #'exporting-values' }
ICVCardExporter >> exportTitle: anObject [ 
	self exportProperty: anObject type: ICVCardConversion titleType
]

{ #category : #'exporting-values' }
ICVCardExporter >> exportUrl: anObject [ 
	self exportProperty: anObject type: ICVCardConversion urlType
]

{ #category : #'exporting-values' }
ICVCardExporter >> exportVersion: anObject [ 
	self exportProperty: anObject type: ICVCardConversion versionType
]

{ #category : #'exporting-values' }
ICVCardExporter >> exportYahoo: anObject [ 
	self exportProperty: anObject type: ICVCardConversion yahooType
]

{ #category : #'initialize-release' }
ICVCardExporter >> initialize [
	super initialize.
	self cards: OrderedCollection new
]

{ #category : #testing }
ICVCardExporter >> isVCard [
	^true
]

{ #category : #private }
ICVCardExporter >> newLineIndicesFor: aString [
	^Array streamContents: [ :stream |
		| nextIndex stringSize |
		stringSize := aString size.
		nextIndex := 1.
		[
			nextIndex := nextIndex + 73 min: stringSize.
			stringSize - nextIndex = 1 ifTrue: [
				nextIndex := nextIndex + 1 ].
			nextIndex := nextIndex = stringSize
				ifTrue: [ nextIndex ]
				ifFalse: [ self scanForBeginningCharacterAt: nextIndex in: aString ].
			stream nextPut: nextIndex
				] doWhileTrue: [ nextIndex < stringSize ] ]
]
