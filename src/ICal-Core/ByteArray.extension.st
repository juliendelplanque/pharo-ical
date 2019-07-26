Extension { #name : #ByteArray }

{ #category : #'*ICal-Core' }
ByteArray >> asICalString [
	^(Base64MimeConverter mimeEncode:
		(ReadWriteStream on: self))
			contents
]

{ #category : #'*ICal-Core' }
ByteArray >> exportICalParametersOn: anExpoter [
	super exportICalParametersOn: anExpoter.
	anExpoter isVCard ifTrue: [
		anExpoter exportParameter: 'ENCODING' value: 'b' ]
]

{ #category : #'*ICal-Core' }
ByteArray class >> fromICalString: aString [
	^(Base64MimeConverter mimeDecodeToBytes: 
		(ReadStream on: aString))
			contents
]

{ #category : #'*ICal-Core' }
ByteArray class >> iCalType [
	^'BINARY'
]
