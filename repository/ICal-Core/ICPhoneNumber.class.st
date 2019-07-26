Class {
	#name : #ICPhoneNumber,
	#superclass : #ICTypedObject,
	#instVars : [
		'number'
	],
	#category : 'ICal-Core-VCard-Model'
}

{ #category : #'accessing-types' }
ICPhoneNumber class >> defaultTypes [
	^Set with: self typeVoice
]

{ #category : #'instance creation' }
ICPhoneNumber class >> fromICalString: aString parameters: aDictionary [
	| instance |
	instance := self new.
	instance types: (self parseTypes: aDictionary).
	instance number: (String fromICalString: aString parameters: aDictionary).
	^instance
]

{ #category : #'accessing-types' }
ICPhoneNumber class >> possibleTypes [
	^super possibleTypes
		add: self typeBulletinBoard;
		add: self typeCar;
		add: self typeCellular;
		add: self typeFax;
		add: self typeISDN;
		add: self typeModem;
		add: self typePager;
		add: self typePersonalCommunication;
		add: self typeVideo;
		add: self typeVoice;
		add: self typeVoiceMessage;
		yourself
]

{ #category : #'accessing-types' }
ICPhoneNumber class >> typeBulletinBoard [
	^'bbs'
]

{ #category : #'accessing-types' }
ICPhoneNumber class >> typeCar [
	^'car'
]

{ #category : #'accessing-types' }
ICPhoneNumber class >> typeCellular [
	^'cell'
]

{ #category : #'accessing-types' }
ICPhoneNumber class >> typeFax [
	^'fax'
]

{ #category : #'accessing-types' }
ICPhoneNumber class >> typeISDN [
	^'isdn'
]

{ #category : #'accessing-types' }
ICPhoneNumber class >> typeModem [
	^'modem'
]

{ #category : #'accessing-types' }
ICPhoneNumber class >> typePager [
	^'pager'
]

{ #category : #'accessing-types' }
ICPhoneNumber class >> typePersonalCommunication [
	^'pcs'
]

{ #category : #'accessing-types' }
ICPhoneNumber class >> typeVideo [
	^'video'
]

{ #category : #'accessing-types' }
ICPhoneNumber class >> typeVoice [
	^'voice'
]

{ #category : #'accessing-types' }
ICPhoneNumber class >> typeVoiceMessage [
	^'msg'
]

{ #category : #converting }
ICPhoneNumber >> asVCardString [
	^self number asVCardString
]

{ #category : #'accessing-types' }
ICPhoneNumber >> beBulletinBoard [
	self bulletinBoard: true
]

{ #category : #'accessing-types' }
ICPhoneNumber >> beCar [
	self car: true
]

{ #category : #'accessing-types' }
ICPhoneNumber >> beCellular [
	self cellular: true
]

{ #category : #'accessing-types' }
ICPhoneNumber >> beFax [
	self fax: true
]

{ #category : #'accessing-types' }
ICPhoneNumber >> beISDN [
	self isdn: true
]

{ #category : #'accessing-types' }
ICPhoneNumber >> beModem [
	self modem: true
]

{ #category : #'accessing-types' }
ICPhoneNumber >> bePager [
	self pager: true
]

{ #category : #'accessing-types' }
ICPhoneNumber >> bePersonalCommunication [
	self personalCommunication: true
]

{ #category : #'accessing-types' }
ICPhoneNumber >> beVideo [
	self video: true
]

{ #category : #'accessing-types' }
ICPhoneNumber >> beVoice [
	self voice: true
]

{ #category : #'accessing-types' }
ICPhoneNumber >> beVoiceMessage [
	self voiceMessage: true
]

{ #category : #'accessing-types' }
ICPhoneNumber >> bulletinBoard [
	^self types includes: self class typeBulletinBoard
]

{ #category : #'accessing-types' }
ICPhoneNumber >> bulletinBoard: aBoolean [
	^self
		setType: self class typeBulletinBoard
		toValue: aBoolean
]

{ #category : #'accessing-types' }
ICPhoneNumber >> car [
	^self types includes: self class typeCar
]

{ #category : #'accessing-types' }
ICPhoneNumber >> car: aBoolean [
	^self
		setType: self class typeCar
		toValue: aBoolean
]

{ #category : #'accessing-types' }
ICPhoneNumber >> cellular [
	^self types includes: self class typeCellular
]

{ #category : #'accessing-types' }
ICPhoneNumber >> cellular: aBoolean [
	^self
		setType: self class typeCellular
		toValue: aBoolean
]

{ #category : #'accessing-types' }
ICPhoneNumber >> fax [
	^self types includes: self class typeFax
]

{ #category : #'accessing-types' }
ICPhoneNumber >> fax: aBoolean [
	^self
		setType: self class typeFax
		toValue: aBoolean
]

{ #category : #'accessing-types' }
ICPhoneNumber >> isBulletinBoard [
	^self bulletinBoard
]

{ #category : #'accessing-types' }
ICPhoneNumber >> isCar [
	^self car
]

{ #category : #'accessing-types' }
ICPhoneNumber >> isCellular [
	^self cellular
]

{ #category : #'accessing-types' }
ICPhoneNumber >> isFax [
	^self fax
]

{ #category : #'accessing-types' }
ICPhoneNumber >> isISDN [
	^self isdn
]

{ #category : #'accessing-types' }
ICPhoneNumber >> isModem [
	^self modem
]

{ #category : #'accessing-types' }
ICPhoneNumber >> isPager [
	^self pager
]

{ #category : #'accessing-types' }
ICPhoneNumber >> isPersonalCommunication [
	^self personalCommunication
]

{ #category : #'accessing-types' }
ICPhoneNumber >> isVideo [
	^self video
]

{ #category : #'accessing-types' }
ICPhoneNumber >> isVoice [
	^self voice
]

{ #category : #'accessing-types' }
ICPhoneNumber >> isVoiceMessage [
	^self voiceMessage
]

{ #category : #'accessing-types' }
ICPhoneNumber >> isdn [
	^self types includes: self class typeISDN
]

{ #category : #'accessing-types' }
ICPhoneNumber >> isdn: aBoolean [
	^self
		setType: self class typeISDN
		toValue: aBoolean
]

{ #category : #'accessing-types' }
ICPhoneNumber >> modem [
	^self types includes: self class typeModem
]

{ #category : #'accessing-types' }
ICPhoneNumber >> modem: aBoolean [
	^self
		setType: self class typeModem
		toValue: aBoolean
]

{ #category : #accessing }
ICPhoneNumber >> number [
	^number
]

{ #category : #accessing }
ICPhoneNumber >> number: anObject [
	number := anObject
]

{ #category : #'accessing-types' }
ICPhoneNumber >> pager [
	^self types includes: self class typePager
]

{ #category : #'accessing-types' }
ICPhoneNumber >> pager: aBoolean [
	^self
		setType: self class typePager
		toValue: aBoolean
]

{ #category : #'accessing-types' }
ICPhoneNumber >> personalCommunication [
	^self types includes: self class typePersonalCommunication
]

{ #category : #'accessing-types' }
ICPhoneNumber >> personalCommunication: aBoolean [
	^self
		setType: self class typePersonalCommunication
		toValue: aBoolean
]

{ #category : #'accessing-types' }
ICPhoneNumber >> video [
	^self types includes: self class typeVideo
]

{ #category : #'accessing-types' }
ICPhoneNumber >> video: aBoolean [
	^self
		setType: self class typeVideo
		toValue: aBoolean
]

{ #category : #'accessing-types' }
ICPhoneNumber >> voice [
	^self types includes: self class typeVoice
]

{ #category : #'accessing-types' }
ICPhoneNumber >> voice: aBoolean [
	^self
		setType: self class typeVoice
		toValue: aBoolean
]

{ #category : #'accessing-types' }
ICPhoneNumber >> voiceMessage [
	^self types includes: self class typeVoiceMessage
]

{ #category : #'accessing-types' }
ICPhoneNumber >> voiceMessage: aBoolean [
	^self
		setType: self class typeVoiceMessage
		toValue: aBoolean
]
