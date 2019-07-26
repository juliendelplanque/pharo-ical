Extension { #name : #Object }

{ #category : #'*ICal-Core' }
Object >> asVCardString [
	^self asICalString
]

{ #category : #'*ICal-Core' }
Object >> exportICalParametersOn: aExporter [
]

{ #category : #'*ICal-Core' }
Object >> iCalType [
	^self class iCalType
]

{ #category : #'*ICal-Core' }
Object >> isDateOrNil [
	^false
]
