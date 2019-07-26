Class {
	#name : #ICVCardConversion,
	#superclass : #Object,
	#category : 'ICal-Core-VCard-IO'
}

{ #category : #'accessing-types' }
ICVCardConversion class >> addressType [
	^ICVCardTypeInformation
		name: 'ADR' 
		type: ICAddress iCalType 
		multivalued: false
]

{ #category : #'accessing-types' }
ICVCardConversion class >> aimType [
	^ICVCardTypeInformation
		name: 'X-AIM' 
		type: ICAIMId iCalType 
		multivalued: false
]

{ #category : #'accessing-types' }
ICVCardConversion class >> birthdayType [
	^ICVCardTypeInformation
		name: 'BDAY' 
		type: Date iCalType 
		multivalued: false
]

{ #category : #'accessing-types' }
ICVCardConversion class >> categoriesType [
	^ICVCardTypeInformation
		name: 'CATEGORIES' 
		type: String iCalType 
		multivalued: true
]

{ #category : #'accessing-types' }
ICVCardConversion class >> emailType [
	^ICVCardTypeInformation
		name: 'EMAIL' 
		type: ICEmailAddress iCalType 
		multivalued: false
]

{ #category : #'accessing-types' }
ICVCardConversion class >> fullnameType [
	^ICVCardTypeInformation
		name: 'FN' 
		type: String iCalType 
		multivalued: false
]

{ #category : #'accessing-types' }
ICVCardConversion class >> icqType [
	^ICVCardTypeInformation
		name: 'X-ICQ' 
		type: ICICQId iCalType 
		multivalued: false
]

{ #category : #'accessing-types' }
ICVCardConversion class >> msnType [
	^ICVCardTypeInformation
		name: 'X-MSN' 
		type: ICMSNId iCalType 
		multivalued: false
]

{ #category : #'accessing-types' }
ICVCardConversion class >> nameType [
	^ICVCardTypeInformation
		name: 'N' 
		type: String iCalType 
		multivalued: false
]

{ #category : #'accessing-types' }
ICVCardConversion class >> nicknameType [
	^ICVCardTypeInformation
		name: 'NICKNAME' 
		type: String iCalType 
		multivalued: false
]

{ #category : #'accessing-types' }
ICVCardConversion class >> noteType [
	^ICVCardTypeInformation
		name: 'NOTE' 
		type: String iCalType 
		multivalued: false
]

{ #category : #'accessing-types' }
ICVCardConversion class >> organizationType [
	^ICVCardTypeInformation
		name: 'ORG' 
		type: ICOrganization iCalType 
		multivalued: false
]

{ #category : #'accessing-types' }
ICVCardConversion class >> photoType [
	^ICVCardTypeInformation
		name: 'PHOTO' 
		type: ZnUrl iCalType 
		multivalued: false
]

{ #category : #'accessing-types' }
ICVCardConversion class >> telephoneType [
	^ICVCardTypeInformation
		name: 'TEL' 
		type: ICPhoneNumber iCalType 
		multivalued: false
]

{ #category : #'accessing-types' }
ICVCardConversion class >> timeZoneType [
	^ICVCardTypeInformation
		name: 'TZ' 
		type: ICUtcOffset iCalType 
		multivalued: false
]

{ #category : #'accessing-types' }
ICVCardConversion class >> titleType [
	^ICVCardTypeInformation
		name: 'TITLE' 
		type: String iCalType 
		multivalued: false
]

{ #category : #'accessing-types' }
ICVCardConversion class >> urlType [
	^ICVCardTypeInformation
		name: 'URL' 
		type: ZnUrl iCalType 
		multivalued: false
]

{ #category : #'accessing-types' }
ICVCardConversion class >> versionType [
	^ICVCardTypeInformation
		name: 'VERSION' 
		type: Float iCalType 
		multivalued: false
]

{ #category : #'accessing-types' }
ICVCardConversion class >> yahooType [
	^ICVCardTypeInformation
		name: 'X-YAHOO' 
		type: ICYahooId iCalType 
		multivalued: false
]
