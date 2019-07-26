Class {
	#name : #ICVCardGenerator,
	#superclass : #ICGenerator,
	#instVars : [
		'currentCard',
		'cards'
	],
	#category : 'ICal-Core-VCard-Parser'
}

{ #category : #'processing-properties' }
ICVCardGenerator >> addUnknownProperty: aProperty [
	self currentCard addUnknownProperty: aProperty
]

{ #category : #'processing-properties' }
ICVCardGenerator >> adr:  aString parameters: aDictionary [
	| value |
	value := self createAddress: aString parameters: aDictionary.
	self currentCard addAddress: value
]

{ #category : #'processing-properties' }
ICVCardGenerator >> bday:  aString parameters: aDictionary [
	| value |
	value := self createValue: aString parameters: aDictionary default: Date iCalType.
	self currentCard birthday: value
]

{ #category : #'processing-properties' }
ICVCardGenerator >> begin: aString [
	(aString sameAs:  'VCARD')
		ifFalse: [self error: 'Only expecting VCARDS'].
	self currentCard: ICVCard new
]

{ #category : #accessing }
ICVCardGenerator >> cards [
	^cards
]

{ #category : #accessing }
ICVCardGenerator >> cards: aCollection [ 
	cards := aCollection
]

{ #category : #'processing-properties' }
ICVCardGenerator >> categories: aString parameters: aDictionary [
	| categories |
	categories := self createMulitValue: aString parameters: aDictionary class: ICCategory.
	self currentCard categories: categories.
]

{ #category : #'processing-properties' }
ICVCardGenerator >> category: aString parameters: aDictionary [
	self categories: aString parameters: aDictionary
]

{ #category : #productions }
ICVCardGenerator >> contentline: aName parameters: aCollection value: aString [
	self currentCard isNil
		ifFalse: [
			ICCardVersion
				use: self currentCard version
				during: [ super contentline: aName parameters: aCollection value: aString ] ]
		ifTrue: [ super contentline: aName parameters: aCollection value: aString ]
]

{ #category : #private }
ICVCardGenerator >> createAIMId: aString parameters: aDictionary [
	^self createInstantMessageId: aString parameters: aDictionary class: ICAIMId
]

{ #category : #private }
ICVCardGenerator >> createAddress: aString parameters: aDictionary [
	^ICAddress fromVCardString: aString parameters: aDictionary
]

{ #category : #private }
ICVCardGenerator >> createEmailAddress: aString parameters: aDictionary [
	^ICEmailAddress fromICalString: aString parameters: aDictionary
]

{ #category : #private }
ICVCardGenerator >> createICQId: aString parameters: aDictionary [
	^self createInstantMessageId: aString parameters: aDictionary class: ICICQId
]

{ #category : #private }
ICVCardGenerator >> createInstantMessageId: aString parameters: aDictionary class: anInstantMessageIdClass [
	^anInstantMessageIdClass fromICalString: aString parameters: aDictionary
]

{ #category : #private }
ICVCardGenerator >> createMSNId: aString parameters: aDictionary [
	^self createInstantMessageId: aString parameters: aDictionary class: ICMSNId
]

{ #category : #utilities }
ICVCardGenerator >> createMulitValue: aString parameters: aDictionary class: aClass [
	^ (self splitAtCommas: aString) collect: [ :each |
		aClass fromVCardString: each parameters: aDictionary ]
]

{ #category : #private }
ICVCardGenerator >> createName: aString parameters: aDictionary [
	^ICName fromICalString: aString parameters: aDictionary
]

{ #category : #private }
ICVCardGenerator >> createOrganization: aString parameters: aDictionary [
	^ICOrganization fromICalString: aString parameters: aDictionary
]

{ #category : #private }
ICVCardGenerator >> createPhoneNumber: aString parameters: aDictionary [
	^ICPhoneNumber fromICalString: aString parameters: aDictionary
]

{ #category : #utilities }
ICVCardGenerator >> createValue: aString parameters: aDictionary default: aType [
	^((aDictionary includesKey: 'ENCODING') and: 
			[ #('B' 'BASE64') includes: (aDictionary at: 'ENCODING') ]) 
			ifFalse: [
				super 
					createValue: aString
					parameters: aDictionary
					default: aType]
		ifTrue: [
			(ICConversion propertyClassFor: 'BINARY')
				fromICalString: aString
				parameters: aDictionary ]
]

{ #category : #utilities }
ICVCardGenerator >> createValue: aString parameters: aDictionary type: iCalType [
	^(ICConversion propertyClassFor: iCalType)
		fromVCardString: aString parameters: aDictionary
]

{ #category : #private }
ICVCardGenerator >> createYahooId: aString parameters: aDictionary [
	^self createInstantMessageId: aString parameters: aDictionary class: ICYahooId
]

{ #category : #accessing }
ICVCardGenerator >> currentCard [
	^currentCard
]

{ #category : #accessing }
ICVCardGenerator >> currentCard: aCard [ 
	currentCard := aCard
]

{ #category : #'processing-properties' }
ICVCardGenerator >> email:  aString parameters: aDictionary [
	| value |
	value := self createEmailAddress: aString parameters: aDictionary.
	self currentCard addEmailAddress: value
]

{ #category : #'processing-properties' }
ICVCardGenerator >> end: aString [
	(aString sameAs: 'VCARD') ifFalse: [
		self error: 'Only expecting VCARDS' ].
	self cards add: self currentCard.
	self currentCard: nil
]

{ #category : #'processing-properties' }
ICVCardGenerator >> fn:  aString parameters: aDictionary [
	| value |
	value := self createValue: aString parameters: aDictionary default: String iCalType.
	self currentCard fullname: value
]

{ #category : #'processing-properties' }
ICVCardGenerator >> geo: aString parameters: aDictionary [
	| value |
	value := Point fromICalString: aString.
	self currentCard geo: value
]

{ #category : #'initialize-release' }
ICVCardGenerator >> initialize [
	super initialize.
	self cards: OrderedCollection new
]

{ #category : #'processing-properties' }
ICVCardGenerator >> n:  aString parameters: aDictionary [
	| value |
	value := self createName: aString parameters: aDictionary.
	self currentCard name: value
]

{ #category : #'processing-properties' }
ICVCardGenerator >> nickname:  aString parameters: aDictionary [
	| value |
	value := self createValue: aString parameters: aDictionary default: String iCalType.
	self currentCard nickname: value
]

{ #category : #'processing-properties' }
ICVCardGenerator >> note: aString parameters: aDictionary [
	| notes |
	notes := self createValue: aString parameters: aDictionary default: String iCalType.
	self currentCard addNote: notes.
]

{ #category : #'processing-properties' }
ICVCardGenerator >> org:  aString parameters: aDictionary [
	| value |
	value := self createOrganization: aString parameters: aDictionary.
	self currentCard organization: value
]

{ #category : #'processing-properties' }
ICVCardGenerator >> photo:  aString parameters: aDictionary [
	| value |
	value := self createValue: aString parameters: aDictionary default: ZnUrl iCalType.
	self currentCard photo: value
]

{ #category : #accessing }
ICVCardGenerator >> product [
	^self cards
]

{ #category : #'processing-properties' }
ICVCardGenerator >> tel:  aString parameters: aDictionary [
	| value |
	value := self createPhoneNumber: aString parameters: aDictionary.
	self currentCard addPhoneNumber: value
]

{ #category : #'processing-properties' }
ICVCardGenerator >> title:  aString parameters: aDictionary [
	| value |
	value := self createValue: aString parameters: aDictionary default: String iCalType.
	self currentCard title: value
]

{ #category : #'processing-properties' }
ICVCardGenerator >> tz: aString parameters: aDictionary [
	| value |
	value := self createValue: aString parameters: aDictionary default: ICUtcOffset iCalType.
	self currentCard timeZone: value
]

{ #category : #'processing-properties' }
ICVCardGenerator >> url:  aString parameters: aDictionary [
	| value |
	value := self createValue: aString parameters: aDictionary default: ZnUrl iCalType.
	self currentCard url: value
]

{ #category : #'processing-properties' }
ICVCardGenerator >> version:  aString parameters: aDictionary [
	| value |
	value := self createValue: aString parameters: aDictionary default: Float iCalType.
	self currentCard version: value
]

{ #category : #'processing-properties' }
ICVCardGenerator >> xaim:  aString parameters: aDictionary [
	| value |
	value := self createAIMId: aString parameters: aDictionary.
	self currentCard addAimid: value
]

{ #category : #'processing-properties' }
ICVCardGenerator >> xicq:  aString parameters: aDictionary [
	| value |
	value := self createICQId: aString parameters: aDictionary.
	self currentCard addIcqid: value
]

{ #category : #'processing-properties' }
ICVCardGenerator >> xmsn:  aString parameters: aDictionary [
	| value |
	value := self createMSNId: aString parameters: aDictionary.
	self currentCard addMsnid: value
]

{ #category : #'processing-properties' }
ICVCardGenerator >> xyahoo:  aString parameters: aDictionary [
	| value |
	value := self createYahooId: aString parameters: aDictionary.
	self currentCard addYahooid: value
]
