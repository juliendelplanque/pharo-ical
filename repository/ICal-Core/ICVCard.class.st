"
I represent a VCard
"
Class {
	#name : #ICVCard,
	#superclass : #ICComponent,
	#instVars : [
		'addresses',
		'categories',
		'birthday',
		'emailAddresses',
		'fullname',
		'name',
		'nickname',
		'notes',
		'organization',
		'phoneNumbers',
		'photo',
		'title',
		'url',
		'version',
		'aimids',
		'msnids',
		'icqids',
		'yahooids',
		'timeZone',
		'geo'
	],
	#category : 'ICal-Core-VCard-Model'
}

{ #category : #accessing }
ICVCard class >> iCalType [
	^'VCARD'
]

{ #category : #adding }
ICVCard >> addAddress: anAddress [
	^self addresses add: anAddress
]

{ #category : #adding }
ICVCard >> addAimid: anInstantMessageId [
	^self aimids add: anInstantMessageId
]

{ #category : #adding }
ICVCard >> addEmailAddress: anEmailAddress [
	^self emailAddresses add: anEmailAddress
]

{ #category : #adding }
ICVCard >> addIcqid: anInstantMessageId [
	^self icqids add: anInstantMessageId
]

{ #category : #adding }
ICVCard >> addMsnid: anInstantMessageId [
	^self msnids add: anInstantMessageId
]

{ #category : #adding }
ICVCard >> addNote: aString [
	^self notes add: aString
]

{ #category : #adding }
ICVCard >> addPhoneNumber: aPhoneNumber [
	^self phoneNumbers add: aPhoneNumber
]

{ #category : #adding }
ICVCard >> addYahooid: anInstantMessageId [
	^self yahooids add: anInstantMessageId
]

{ #category : #accessing }
ICVCard >> addresses [
	^addresses
]

{ #category : #accessing }
ICVCard >> addresses: aCollection [ 
	addresses := aCollection
]

{ #category : #accessing }
ICVCard >> aimids [
	^aimids
]

{ #category : #accessing }
ICVCard >> aimids: aCollection [ 
	aimids := aCollection
]

{ #category : #private }
ICVCard >> asJpeg: anArray [
	| input proc |
	input := String streamContents: [ :stream |
		anArray do: [ :each |
			stream nextPut: (Character value: each) ] ].
	proc := OSProcess thisOSProcess
		command:  'convert -quality 0 - jpg:-'
		input: input.
	[ proc isComplete ] whileFalse: [ (Delay forSeconds: 1) wait ].
	^proc upToEnd asByteArray
]

{ #category : #accessing }
ICVCard >> birthday [
	^birthday
]

{ #category : #accessing }
ICVCard >> birthday: aDate [ 
	birthday := aDate
]

{ #category : #accessing }
ICVCard >> categories [
	^categories
]

{ #category : #accessing }
ICVCard >> categories: aCollection [ 
	categories := aCollection
]

{ #category : #public }
ICVCard >> convertPhotoToJpeg [
	(self photo notNil and: [ self photo isKindOf: ByteArray ])
		ifTrue: [ self photo: (self asJpeg: self photo) ]
]

{ #category : #accessing }
ICVCard >> emailAddresses [
	^emailAddresses
]

{ #category : #accessing }
ICVCard >> emailAddresses: aCollection [ 
	emailAddresses := aCollection
]

{ #category : #exporting }
ICVCard >> exportOn: anExporter [
	anExporter exportVersion: self version.
	anExporter exportName: self name.
	anExporter exportFullname: self fullname.	
	anExporter exportNickname: self nickname.
	anExporter exportPhoto: self photo.
	anExporter exportBirthday: self birthday.
	anExporter exportAddresses: self addresses.
	anExporter exportTelephones: self phoneNumbers.
	anExporter exportEmails: self emailAddresses.
	anExporter exportTitle: self title.
	
	anExporter exportTimeZone: self timeZone.
	anExporter exportGeo: self geo.
	anExporter exportOrganization: self organization.
	anExporter exportCategories: self categories.
	anExporter exportNotes: self notes.
	anExporter exportUrl: self url.
	
	anExporter exportAim: self aimids.
	anExporter exportIcq: self icqids.
	anExporter exportMsn: self msnids.
	anExporter exportYahoo: self yahooids.
]

{ #category : #accessing }
ICVCard >> fullname [
	^fullname
]

{ #category : #accessing }
ICVCard >> fullname: aString [ 
	fullname := aString
]

{ #category : #accessing }
ICVCard >> geo [
	^geo
]

{ #category : #accessing }
ICVCard >> geo: aPoint [
	"This property specifies information related to the global
   position for the activity specified by a calendar component."

 	"Description: The property value specifies latitude and longitude, in
   that order (i.e., 'LAT LON' ordering).

	aPoint is a point of floats"
	geo := aPoint
]

{ #category : #accessing }
ICVCard >> icqids [
	^icqids
]

{ #category : #accessing }
ICVCard >> icqids: aCollection [ 
	icqids := aCollection
]

{ #category : #'initialize-release' }
ICVCard >> initialize [
	super initialize.
	self addresses: OrderedCollection new.
	self phoneNumbers: OrderedCollection new.
	self emailAddresses: OrderedCollection new.
	self version: 3.0.
	self aimids: OrderedCollection new.
	self icqids: OrderedCollection new.
	self msnids: OrderedCollection new.
	self yahooids:OrderedCollection new.
	self categories: OrderedCollection new.
	self notes: OrderedCollection new
]

{ #category : #testing }
ICVCard >> isOrganization [
	^self organization notNil
		and: [ self fullname = self organization name ]
		
]

{ #category : #accessing }
ICVCard >> msnids [
	^msnids
]

{ #category : #accessing }
ICVCard >> msnids: aCollection [ 
	msnids := aCollection
]

{ #category : #accessing }
ICVCard >> name [
	^name
]

{ #category : #accessing }
ICVCard >> name: aName [ 
	name := aName
]

{ #category : #accessing }
ICVCard >> nickname [
	^nickname
]

{ #category : #accessing }
ICVCard >> nickname: aString [ 
	nickname := aString
]

{ #category : #accessing }
ICVCard >> notes [
	^notes
]

{ #category : #accessing }
ICVCard >> notes: aCollection [ 
	notes := aCollection
]

{ #category : #accessing }
ICVCard >> organization [
	^organization
]

{ #category : #accessing }
ICVCard >> organization: anOrganization [ 
	organization := anOrganization
]

{ #category : #accessing }
ICVCard >> phoneNumbers [
	^phoneNumbers
]

{ #category : #accessing }
ICVCard >> phoneNumbers: aCollection [ 
	phoneNumbers := aCollection
]

{ #category : #accessing }
ICVCard >> photo [
	^photo
]

{ #category : #accessing }
ICVCard >> photo: anObject [
	photo := anObject
]

{ #category : #removing }
ICVCard >> removeAddress: anAddress [
	^self addresses remove: anAddress
]

{ #category : #removing }
ICVCard >> removeEmailAddress: anEmailAddress [
	^self emailAddresses remove: anEmailAddress
]

{ #category : #removing }
ICVCard >> removePhoneNumber: aPhoneNumber [
	^self phoneNumbers remove: aPhoneNumber
]

{ #category : #accessing }
ICVCard >> timeZone [
	^timeZone
]

{ #category : #accessing }
ICVCard >> timeZone: anObject [
	timeZone := anObject
]

{ #category : #accessing }
ICVCard >> title [
	^title
]

{ #category : #accessing }
ICVCard >> title: aString [ 
	title := aString
]

{ #category : #accessing }
ICVCard >> url [
	^url
]

{ #category : #accessing }
ICVCard >> url: aUrl [ 
	url := aUrl
]

{ #category : #accessing }
ICVCard >> version [
	^version
]

{ #category : #accessing }
ICVCard >> version: aFloat [ 
	version := aFloat
]

{ #category : #accessing }
ICVCard >> yahooids [
	^yahooids
]

{ #category : #accessing }
ICVCard >> yahooids: aCollection [ 
	yahooids := aCollection
]
