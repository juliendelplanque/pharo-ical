Class {
	#name : #ICConversionTest,
	#superclass : #ICTest,
	#category : 'ICal-Tests-Core'
}

{ #category : #testing }
ICConversionTest >> testBoolean [
	self assert: 'TRUE'  = true asICalString.
	self assert: 'FALSE'  = false asICalString.
]

{ #category : #testing }
ICConversionTest >> testDate [
	| date |
	date := self dateClass year: 1901 month: 1 day: 1.
	self assert: '19010101'  = date asICalString.
	self assert: '1901-01-01' = date asVCardString.
	
	date := self dateClass year: 1901 month: 2 day: 1.
	self assert: '19010201'  = date asICalString.
	self assert: '1901-02-01'  = date asVCardString.
	
	date := self dateClass year: 1901 month: 11 day: 22 .
	self assert: '19011122'  = date asICalString.
	self assert: '1901-11-22'  = date asVCardString.
	
	date := self dateClass year: 1997 month: 7 day: 14 .
	self assert: '19970714'  = date asICalString.
	self assert: '1997-07-14'  = date asVCardString.
]

{ #category : #testing }
ICConversionTest >> testDateAndTime [
	| dateAndTime |
	dateAndTime := self dateAndTimeClass  year: 1950 month: 11 day: 22 hour: 22 minute: 33 second: 44.
	self assert: '19501122T223344'  = dateAndTime asICalString.
	
	dateAndTime := self dateAndTimeClass  year: 1950 month: 1 day: 2 hour: 3 minute: 4 second: 5.
	self assert: '19500102T030405'  = dateAndTime asICalString.
	
	dateAndTime := self dateAndTimeClass  year: 1998 month: 1 day: 19 hour: 7 minute: 0 second: 0.
	self assert: '19980119T070000'  = dateAndTime asICalString.
	
	dateAndTime := self dateAndTimeClass  year: 1998 month: 1 day: 18 hour: 23 minute: 0 second: 0.
	self assert: '19980118T230000'  = dateAndTime asICalString.
]

{ #category : #testing }
ICConversionTest >> testDateAndTimeUtc [
	| dateAndTime |
	dateAndTime := self dateAndTimeClass  year: 1950 month: 11 day: 22 hour: 22 minute: 33 second: 44 offset: (self durationClass seconds: 0).
	self assert: '19501122T223344Z'  = dateAndTime asICalUtcString.
	
	dateAndTime := self dateAndTimeClass  year: 1950 month: 1 day: 2 hour: 3 minute: 4 second: 5 offset: (self durationClass seconds: 0).
	self assert: '19500102T030405Z'  = dateAndTime asICalUtcString.
	
	dateAndTime := self dateAndTimeClass  year: 1998 month: 1 day: 19 hour: 7 minute: 0 second: 0 offset: (self durationClass seconds: 0).
	self assert: '19980119T070000Z'  = dateAndTime asICalUtcString.
	
	dateAndTime := self dateAndTimeClass  year: 1998 month: 1 day: 18 hour: 23 minute: 0 second: 0 offset: (self durationClass seconds: 0).
	self assert: '19980118T230000Z'  = dateAndTime asICalUtcString.
]

{ #category : #testing }
ICConversionTest >> testDateUtc [
	| date |
	date := self dateClass year: 1901 month: 1 day: 1 .
	self assert: '19010101'  = date asICalUtcString.
	
	date := self dateClass year: 1901 month: 2 day: 1 .
	self assert: '19010201'  = date asICalUtcString.
	
	date := self dateClass year: 1901 month: 11 day: 22.
	self assert: '19011122'  = date asICalUtcString.
	
	date := self dateClass year: 1997 month: 7 day: 14.
	self assert: '19970714'  = date asICalUtcString.
]

{ #category : #testing }
ICConversionTest >> testDuration [
	| duration |
	duration := self durationClass days: 15 hours: 5 minutes: 0 seconds: 20.
	self assert: 'P15DT5H0M20S'  = duration asICalString.
	
	duration := self durationClass weeks: 7.
	self assert: 'P7W'  = duration asICalString.
]

{ #category : #testing }
ICConversionTest >> testFloatPrecision [
	"Double precision floating point has 64 bits (8 bytes),
	with 53 bit significand (or about 16 decimal digits of precision).
	But VM is using some of the bits, so get fewer than 16 decimal digits precision.
	Also, some precision may be lost during the calculations.
	Testing with 12 decimal digits seems to pass, on Pharo-1.4 with similar era VM."

	| string float |

	string := '123456.123456'.
	float := Float fromICalString: string.
	self assert: float asICalString equals: string.
	self assert: float equals: 123456.123456.
]

{ #category : #testing }
ICConversionTest >> testFloatingTime [
	| dateAndTime |
	ICConversion hasChronosLoaded
		ifTrue: [ 
			dateAndTime := (Smalltalk classNamed: #Timepoint) fromICalString: '19501122T223344' parameters: Dictionary new.
			self assert: dateAndTime isInvariantToNominalTime.
			dateAndTime := (Smalltalk classNamed: #Timepoint) fromICalString: '19501122T223344Z' parameters: Dictionary new.
			self deny: dateAndTime isInvariantToNominalTime. ]
		ifFalse: [
			"not yet implemented"]
]

{ #category : #testing }
ICConversionTest >> testGeo [
	| point |
	point := Point fromICalString: '37.386013;-122.082932'.
	self assert: point x = 37.386013.
	self assert: point y = -122.082932.
	self assert: point asICalString = '37.386013;-122.082932'
]

{ #category : #testing }
ICConversionTest >> testParseBoolean [
	| string boolean |
	string := 'TRUE'.
	boolean := Boolean fromICalString: string.	
	self assert: string = boolean asICalString.
	self assert: boolean.
	
	string := 'FALSE'.
	boolean := Boolean fromICalString: string.	
	self assert: string = boolean asICalString.
	self deny: boolean.
]

{ #category : #testing }
ICConversionTest >> testParseDate [
	| string date |
	string := '19970714'.
	date := self dateClass fromICalString: string.
	
	self assert: string = date asICalString.
	self assert: date = (self dateClass year: 1997 month: 7 day: 14).
	
	string := '1997-07-14'.
	date := self dateClass fromVCardString: string.
	
	self assert: string = date asVCardString.
	self assert: date = (self dateClass year: 1997 month: 7 day: 14)
]

{ #category : #testing }
ICConversionTest >> testParseDateAndTime [
	| string dateAndTime |
	string := '19980118T230000'.
	dateAndTime := self dateAndTimeClass fromICalString: string.
	
	self assert: string = dateAndTime asICalString.
	self assert: dateAndTime = (self dateAndTimeClass year: 1998 month: 1 day: 18 hour: 23 minute: 0 second: 0)
]

{ #category : #testing }
ICConversionTest >> testParseDateAndTimeUtc [
	| string dateAndTime |
	string := '19980118T230000Z'.
	dateAndTime := self dateAndTimeClass fromICalString: string.
	
	self assert: string = dateAndTime asICalUtcString.
	self assert: dateAndTime = (self dateAndTimeClass year: 1998 month: 1 day: 18 hour: 23 minute: 0 second: 0 offset: (self durationClass seconds: 0))
]

{ #category : #testing }
ICConversionTest >> testParseDuration [
	| duration string |
	string := 'P15DT5H0M20S'.
	duration := self durationClass fromICalString: string.
	self assert: string  = duration asICalString.
	self assert: duration = (self durationClass days: 15 hours: 5 minutes: 0 seconds: 20).
	
	string := '-P15DT5H0M20S'.
	duration := self durationClass fromICalString: string.
	self assert: string  = duration asICalString.
	self assert: duration = (self durationClass days: 15 hours: 5 minutes: 0 seconds: 20) negated.
	
	string := 'P7W'.
	duration := self durationClass fromICalString: string.
	self assert: string  = duration asICalString.
	self assert: duration = (self durationClass weeks: 7).
	
	string := '-P7W'.
	duration := self durationClass fromICalString: string.
	self assert: string  = duration asICalString.
	self assert: duration = (self durationClass weeks: 7 negated).
	self assert: duration = (self durationClass weeks: 7) negated.
	
	string := 'PT5M'.
	duration := self durationClass fromICalString: string.
	self assert: 'PT0H5M0S'  = duration asICalString.
	self assert: duration = (self durationClass days: 0 hours: 0 minutes: 5 seconds: 0).
	
	string := '-PT5M'.
	duration := self durationClass fromICalString: string.
	self assert: '-PT0H5M0S'  = duration asICalString.
	self assert: duration = (self durationClass days: 0 hours: 0 minutes: 5 seconds: 0) negated.
	self assert: duration = (self durationClass days: 0 hours: 0 minutes: 5 negated seconds: 0).
	
	self assert: (self durationClass fromICalString: 'PT0H5M0S') = (self durationClass fromICalString: 'PT5M').
]

{ #category : #testing }
ICConversionTest >> testParseFloat [
	| float string |
	string := '-3.14'.
	float := Float fromICalString: string.
	self assert: string  = float asICalString.
	self assert: float = -3.14.
	
	string := '1.333'.
	float := Float fromICalString: string.
	self assert: string  = float asICalString.
	self assert: float = 1.333.
]

{ #category : #testing }
ICConversionTest >> testParseInteger [
	| integer string |
	string := '-1'.
	integer := Integer fromICalString: string.
	self assert: string  = integer asICalString.
	self assert: integer = -1.
	
	string := '1337'.
	integer := Integer fromICalString: string.
	self assert: string  = integer asICalString.
	self assert: integer = 1337.
]

{ #category : #testing }
ICConversionTest >> testParseParameterString [
	| string |
	string := 'TESTME'.
	self assert: 'TESTME' = string asICalParameterString.
	
	string := 'TEST;ME'.
	self assert: '"TEST;ME"' = string asICalParameterString.
]

{ #category : #testing }
ICConversionTest >> testParseScaledDecimal [
	| decimal string |
	string := '-3.14'.
	decimal := ScaledDecimal fromICalString: string.
	self assert: string  equals: decimal asICalString.
	self assert: decimal equals: -3.14s2.
	
	string := '1.333'.
	decimal := ScaledDecimal fromICalString: string.
	self assert: string  = decimal asICalString.
	self assert: decimal = 1.333s3.
]

{ #category : #testing }
ICConversionTest >> testParseString [
	| string value |
	string := 'test me!'.
	value := String fromICalString: string parameters: Dictionary new.
	self assert: string = value asICalString.
	
	string := '":\\\,\;\n'.
	value := String fromICalString: string parameters: Dictionary new.
	self assert: value equals: '":\,;
'.
	self assert: string = value asICalString
]

{ #category : #testing }
ICConversionTest >> testParseStringOldEncoding [
	"This test FAILS because the LF character is non-correctly substituted."
	| string value |
	ICCalendarVersion
		use: 1.0
		during: [
			string := 'Bar Street 99=0AFootown 12345=0AFooland'.
			value := String fromICalString: string parameters: (Dictionary new add: 'ENCODING' -> 'QUOTED-PRINTABLE'; yourself).
			self assert: value =
('Bar Street 99', String lf, 
'Footown 12345', String lf, 
'Fooland').
			self assert: value asICalString equals: 'Bar Street 99=0AFootown 12345=0AFooland' ]
]

{ #category : #testing }
ICConversionTest >> testParseStringOldEncodingAndSpaces [
	"This test FAILS because the LF character is non-correctly substituted."
	| string value |
	ICCalendarVersion
		use: 1.0
		during: [
			string := '123 Winding Way=0D=0A=' , String crlf ,
' Any Town, CA 12345=0D=0A=' , String crlf ,
' USA'.
			value := String fromICalString: (ICCalendarHandParser new unfold: string)  parameters: (Dictionary new add: 'ENCODING' -> 'QUOTED-PRINTABLE'; yourself).
			self assert: value =
('123 Winding Way', String crlf, 
'Any Town, CA 12345', String crlf, 
'USA').
			self assert: value asICalString =  '123 Winding Way=0D=0AAny Town\\, CA 12345=0D=0AUSA' ]
]

{ #category : #testing }
ICConversionTest >> testParseTime [
	| string time |
	string := '123456'.
	time := self timeClass fromICalString: string.
	
	self assert: string = time asICalString.
	self assert: time = (self timeClass hour: 12 minute: 34 second: 56)
]

{ #category : #testing }
ICConversionTest >> testParseTimeUtc [
	| string time |
	string := '123456Z'.
	time := self timeClass fromICalString: string.
	
	self assert: string = time asICalUtcString.
	self assert: time = (self timeClass hour: 12 minute: 34 second: 56)
]

{ #category : #testing }
ICConversionTest >> testParseUrl [
	| url string |
	string := 'mailto:mouse@squeakfoundation.org'.
	url := ZnUrl fromICalString: string.
	self assert: string  = url asICalString.
		
	string := 'http://host1.com/my-report.txt'.
	url := ZnUrl fromICalString: string.
	self assert: string  = url asICalString.
	
]

{ #category : #testing }
ICConversionTest >> testSelector [
	ICConversion supportedClasses do: 
			[:each | 
			self assert: (each selectors includes: #asICalString).
			self assert: (each class selectors includes: #iCalType).
			self assert: ((each class selectors includes: #fromICalString:)
				or: [ each class selectors includes: #fromICalString:parameters: ]) ].
	ICConversion supportedComponents 
		do: [:each | self assert: (each class selectors includes: #iCalType)]
]

{ #category : #testing }
ICConversionTest >> testSplitComma [
	| parts |
	parts := 'a,b,c' splitAtCommas.
	self assert: parts = #('a' 'b' 'c') asOrderedCollection.
	
	parts := 'a\,b,c' splitAtCommas.
	self assert: parts = #('a\,b' 'c') asOrderedCollection.
	
	parts := 'a\,b\,c' splitAtCommas.
	self assert: parts = #('a\,b\,c') asOrderedCollection.
	
	"parts := splitter splitAtCommas: ',,'.
	self assert: parts = #('' '' '') asOrderedCollection.
	
	parts := splitter splitAtCommas: ',\,'.
	self assert: parts = #('' '\,') asOrderedCollection."
]

{ #category : #testing }
ICConversionTest >> testTime [
	| time |
	time := self timeClass hour: 22 minute: 33 second: 44.
	self assert: '223344'  = time asICalString.
	
	time := self timeClass hour: 0 minute: 0 second: 0.
	self assert: '000000'  = time asICalString.
	
	time := self timeClass hour: 1 minute: 2 second: 3.
	self assert: '010203'  = time asICalString.
]

{ #category : #testing }
ICConversionTest >> testTimeUtc [
	| time |
	time := self timeClass hour: 22 minute: 33 second: 44.
	self assert: '223344Z'  = time asICalUtcString.
	
	time := self timeClass hour: 0 minute: 0 second: 0.
	self assert: '000000Z'  = time asICalUtcString.
	
	time := self timeClass hour: 1 minute: 2 second: 3.
	self assert: '010203Z'  = time asICalUtcString.
]

{ #category : #testing }
ICConversionTest >> testTimezoneName [
	| name |
	name := ICTimezoneName fromICalString: 'EST' parameters: Dictionary new.
	
	self assert: name text = 'EST'.
	self assert: name language isNil.

	name := ICTimezoneName fromICalString: 'HNE' parameters: (Dictionary with: 'LANGUAGE' -> 'fr-CA').
	
	self assert: name text = 'HNE'.
	self assert: name language = 'fr-CA'.
	
	name := ICTimezoneName fromICalString: 'EST' parameters: (Dictionary with: 'LANGUAGE' -> 'en').
	
	self assert: name text = 'EST'.
	self assert: name language = 'en'
	
	
]

{ #category : #testing }
ICConversionTest >> testTrigger [
	| trigger |
	trigger := ICTrigger fromICalString: 'PT5M ' parameters: (Dictionary with: 'RELATED' -> 'END').
	
	self assert: trigger isRelatedToEnd.
	self assert: trigger value = (self durationClass days: 0 hours: 0 minutes: 5 seconds: 0).
	self assert: trigger asICalString = 'PT0H5M0S'.
	
	self assert: ICTrigger new isRelatedToStart.
	
	trigger := ICTrigger
		fromICalString: '19501122T223344 '
		parameters: (Dictionary with: 'RELATED' -> 'END' with: 'VALUE' -> self dateAndTimeClass iCalType).
	self assert: trigger value = (self dateAndTimeClass year: 1950 month: 11 day: 22 hour: 22 minute: 33 second: 44).
]

{ #category : #testing }
ICConversionTest >> testTzid [
	| dateAndTime |
	ICConversion hasChronosLoaded
		ifTrue: [ 
			dateAndTime := (Smalltalk classNamed: #Timepoint)
				fromICalString: '20040807T130000'
				parameters: (Dictionary new add: 'TZID' -> 'Pacific/Wallis'; yourself).
				
			self assert: dateAndTime timeZone name = #'Pacific/Wallis'.
			self assert: dateAndTime =  ((Smalltalk classNamed: #Timepoint)
				year: 2004 month: 08 day: 07
				hour: 13 minute: 00 second: 00
				timeZone: #'Pacific/Wallis') ]
		ifFalse: [
			"not yet implemented" ]
]

{ #category : #testing }
ICConversionTest >> testUtcOffset [
	| offset |
	offset := ICUtcOffset fromICalString: '-0500'.
	self deny: offset positive.
	self assert: offset hours = 5.
	self assert: offset minutes = 0.
	self assert: offset seconds = 0.
	self assert: '-0500'  = offset asICalString.
	
	offset := ICUtcOffset fromICalString: '+0100'.
	self assert: offset positive.
	self assert: offset hours = 1.
	self assert: offset minutes = 0.
	self assert: offset seconds = 0.
	self assert: '+0100'  = offset asICalString.
	
	offset := ICUtcOffset fromICalString: '+010005'.
	self assert: offset positive.
	self assert: offset hours = 1.
	self assert: offset minutes = 0.
	self assert: offset seconds = 5.
	self assert: '+010005'  = offset asICalString.
	
	offset := ICUtcOffset fromICalString: '-010005'.
	self deny: offset positive.
	self assert: offset hours = 1.
	self assert: offset minutes = 0.
	self assert: offset seconds = 5.
	self assert: '-010005'  = offset asICalString.
]

{ #category : #testing }
ICConversionTest >> testWeeks [
	| duration |
	0 to: 10 do: [ :week |
		0 to: 6 do: [ :day |
			duration := self durationClass days: week * 7 + day.
			self assert: duration weeks = week ] ]
]
