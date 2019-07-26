Class {
	#name : #ICCalendarGenerator,
	#superclass : #ICGenerator,
	#instVars : [
		'calendar',
		'tempComponent',
		'tempAlarm',
		'tempTime'
	],
	#category : 'ICal-Core-Parser'
}

{ #category : #'processing-properties' }
ICCalendarGenerator >> action: aString parameters: aDictionary [
	| value |
	value := self createValue: aString parameters: aDictionary default: String iCalType.
	self tempAlarm action: value
]

{ #category : #accessing }
ICCalendarGenerator >> activeComponent [
	^self tempAlarm isNil
		ifTrue: [ self tempComponent ]
		ifFalse: [ self tempAlarm ]
]

{ #category : #accessing }
ICCalendarGenerator >> activeComponentOrCalendar [
	^self activeComponent ifNil: [ self calendar ]
]

{ #category : #'processing-properties' }
ICCalendarGenerator >> addUnknownProperty: aProperty [
	self activeComponentOrCalendar addUnknownProperty: aProperty
]

{ #category : #'processing-properties' }
ICCalendarGenerator >> attach: aString parameters: aDictionary [
	| value |
	value := self createValue: aString parameters: aDictionary default: ZnUrl iCalType.
	self activeComponent addAttachment: value
]

{ #category : #dispatching }
ICCalendarGenerator >> begin: aString [
	(self specialBegins includes: aString)
		ifTrue: [
			self perform: ('begin' , aString asLowercase capitalized) asSymbol ]
		ifFalse: [
			self tempComponent: (ICConversion componentClassFor: aString) new ]
]

{ #category : #'processing-properties' }
ICCalendarGenerator >> beginDaylight [
	self tempTime: ICDaylightSavingTime new
]

{ #category : #'processing-properties' }
ICCalendarGenerator >> beginStandard [
	self tempTime: ICStandardTime new
]

{ #category : #'processing-properties' }
ICCalendarGenerator >> beginValarm [
	self tempAlarm: ICAlarm new
]

{ #category : #'processing-properties' }
ICCalendarGenerator >> beginVcalendar [
	^self calendar: ICCalendar new
]

{ #category : #accessing }
ICCalendarGenerator >> calendar [
	^calendar
]

{ #category : #accessing }
ICCalendarGenerator >> calendar: anObject [
	calendar := anObject
]

{ #category : #'processing-properties' }
ICCalendarGenerator >> categories: aString parameters: aDictionary [
	| categories |
	categories := self createMulitValue: aString parameters: aDictionary class: ICCategory.
	self tempComponent categories: categories.
]

{ #category : #'processing-properties' }
ICCalendarGenerator >> class: aString parameters: aDictionary [ 
	| value |
	value := self createValue: aString parameters: aDictionary default: String iCalType.
	self tempComponent classification: value
]

{ #category : #'processing-properties' }
ICCalendarGenerator >> comment: aString parameters: aDictionary [
	| value |
	value := self createValue: aString parameters: aDictionary default: String iCalType.
	self topStack addComment: value
]

{ #category : #'processing-properties' }
ICCalendarGenerator >> completed: aString parameters: aDictionary [
	| value |
	value := self createDateAndTime: aString parameters: aDictionary.
	self tempComponent completed: value
]

{ #category : #productions }
ICCalendarGenerator >> contentline: aName parameters: aCollection value: aString [
	self calendar isNil
		ifFalse: [
			ICCalendarVersion
				use: self calendar version
				during: [ super contentline: aName parameters: aCollection value: aString ] ]
		ifTrue: [ super contentline: aName parameters: aCollection value: aString ]
]

{ #category : #utilities }
ICCalendarGenerator >> createDateAndTime: aString parameters: aDictionary [
	| iCalType timezone  tzid |
	iCalType := aDictionary at: 'VALUE' ifAbsent: [ DateAndTime iCalType ].
	tzid := aDictionary at: 'TZID' ifAbsent: [ nil ].
	tzid isNil ifFalse: [
		timezone := self product timezoneAt: tzid ].
	^(ICConversion propertyClassFor: iCalType)
		fromICalString: aString
		parameters: aDictionary
		timezone: timezone
]

{ #category : #utilities }
ICCalendarGenerator >> createMulitValue: aString parameters: aDictionary class: aClass [
	^ (self splitAtCommas: aString) collect: [ :each |
		aClass fromVCardString: each parameters: aDictionary ]
]

{ #category : #utilities }
ICCalendarGenerator >> createMulitValue: aString parameters: aDictionary type: aClass [
	^ (self splitAtCommas: aString) collect: [ :each |
		self createValue: each parameters: aDictionary default: aClass ]
]

{ #category : #'processing-properties' }
ICCalendarGenerator >> created: aString parameters: aDictionary [
	| value |
	value := self createDateAndTime: aString parameters: aDictionary.
	self tempComponent created: value
]

{ #category : #'processing-properties' }
ICCalendarGenerator >> description: aString parameters: aDictionary [
	| value |
	value := self createValue: aString parameters: aDictionary default: String iCalType.
	self tempComponent addTextualDescription: value
]

{ #category : #'processing-properties' }
ICCalendarGenerator >> dtend: aString parameters: aDictionary [
	| value |
	value := self createDateAndTime: aString parameters: aDictionary.
	self tempComponent end: value
]

{ #category : #'processing-properties' }
ICCalendarGenerator >> dtstamp: aString parameters: aDictionary [
	| value |
	value := self createDateAndTime: aString parameters: aDictionary.
	self tempComponent stamp: value
]

{ #category : #'processing-properties' }
ICCalendarGenerator >> dtstart: aString parameters: aDictionary [
	| value |
	value := self createDateAndTime: aString parameters: aDictionary.
	self topStack start: value
]

{ #category : #'processing-properties' }
ICCalendarGenerator >> due: aString parameters: aDictionary [
	| value |
	value := self createDateAndTime: aString parameters: aDictionary.
	self tempComponent due: value
]

{ #category : #'processing-properties' }
ICCalendarGenerator >> duration: aString parameters: aDictionary [
	| value |
	value := self createValue: aString parameters: aDictionary default: Duration iCalType.
	self activeComponent duration: value
]

{ #category : #dispatching }
ICCalendarGenerator >> end: aString [
	(self specialEnds includes: aString)
		ifTrue: [
			self perform: ('end' , aString asLowercase capitalized) asSymbol ]
		ifFalse: [
			self calendar addComponent: self tempComponent.
			self tempComponent: nil ]
]

{ #category : #'processing-properties' }
ICCalendarGenerator >> endDaylight [
	self tempComponent addDaylightSavingTime: self tempTime.
	self tempTime: nil
]

{ #category : #'processing-properties' }
ICCalendarGenerator >> endStandard [
	self tempComponent addStandardTime: self tempTime.
	self tempTime: nil
]

{ #category : #'processing-properties' }
ICCalendarGenerator >> endValarm [
	self tempComponent addAlarm: self tempAlarm.
	self tempAlarm: nil
]

{ #category : #'processing-properties' }
ICCalendarGenerator >> endVcalendar [
	"nothing"
]

{ #category : #'processing-properties' }
ICCalendarGenerator >> exdate: aString parameters: aDictionary [
	| dates |
	dates := self
		createMulitValue: aString
		parameters: aDictionary
		type: DateAndTime iCalType.
	self tempComponent exclusionDates: dates
]

{ #category : #'processing-properties' }
ICCalendarGenerator >> exrule: aString parameters: aDictionary [
	| value |
	value := self createValue: aString parameters: aDictionary default: ICRecurrenceRule iCalType.
	self tempComponent addExclusionRule: value
]

{ #category : #'processing-properties' }
ICCalendarGenerator >> geo: aString parameters: aDictionary [
	| value |
	value := Point fromICalString: aString.
	self currentCard geo: value
]

{ #category : #'processing-properties' }
ICCalendarGenerator >> lastmodified: aString parameters: aDictionary [
	| value |
	value := self createDateAndTime: aString parameters: aDictionary.
	self tempComponent lastModified: value
]

{ #category : #'processing-properties' }
ICCalendarGenerator >> location: aString parameters: aDictionary [
	| value |
	value := self createValue: aString parameters: aDictionary default: String iCalType.
	self tempComponent location: value
]

{ #category : #'processing-properties' }
ICCalendarGenerator >> method: aString parameters: aDictionary [
	| value |
	value := self createValue: aString parameters: aDictionary default: String iCalType.
	self calendar method: value
]

{ #category : #'processing-properties' }
ICCalendarGenerator >> percentcomplete: aString parameters: aDictionary [
	| value |
	value := self createValue: aString parameters: aDictionary default: Integer iCalType.
	self tempComponent percentComplete: value
]

{ #category : #'processing-properties' }
ICCalendarGenerator >> priority: aString parameters: aDictionary [
	| value |
	value := self createValue: aString parameters: aDictionary default: Integer iCalType.
	self tempComponent priority: value
]

{ #category : #'processing-properties' }
ICCalendarGenerator >> prodid: aString parameters: aDictionary [
	| value |
	value := self createValue: aString parameters: aDictionary default: String iCalType.
	self calendar productId: value
]

{ #category : #accessing }
ICCalendarGenerator >> product [
	^self calendar
]

{ #category : #'processing-properties' }
ICCalendarGenerator >> rdate: aString parameters: aDictionary [
	| dates |
	dates := self createMulitValue: aString parameters: aDictionary type: DateAndTime iCalType.
	self topStack recurrenceDates: dates
]

{ #category : #'processing-properties' }
ICCalendarGenerator >> repeat: aString parameters: aDictionary [
	| value |
	value := self createValue: aString parameters: aDictionary default: Integer iCalType.
	self tempAlarm repetitions: value
]

{ #category : #'processing-properties' }
ICCalendarGenerator >> resources: aString parameters: aDictionary [
	| resources |
	resources := self
		createMulitValue: aString
		parameters: aDictionary
		type: String iCalType.
	self tempComponent resources: resources
]

{ #category : #'processing-properties' }
ICCalendarGenerator >> rrule: aString parameters: aDictionary [
	| value |
	value := self createValue: aString parameters: aDictionary default: ICRecurrenceRule iCalType.
	self topStack addRecurrenceRule: value
]

{ #category : #'processing-properties' }
ICCalendarGenerator >> sequence: aString parameters: aDictionary [
	| value |
	value := self createValue: aString parameters: aDictionary default: Integer iCalType.
	self tempComponent sequenceNumber: value
]

{ #category : #accessing }
ICCalendarGenerator >> specialBegins [
	^Array
		with: ICCalendar iCalType
		with: ICAlarm iCalType
		with: ICStandardTime iCalType
		with: ICDaylightSavingTime iCalType
]

{ #category : #accessing }
ICCalendarGenerator >> specialEnds [
	^self specialBegins
]

{ #category : #'processing-properties' }
ICCalendarGenerator >> status: aString parameters: aDictionary [
	| value |
	value := self createValue: aString parameters: aDictionary default: String iCalType.
	self tempComponent status: value
]

{ #category : #'processing-properties' }
ICCalendarGenerator >> summary: aString parameters: aDictionary [
	| value |
	value := self createValue: aString parameters: aDictionary default: String iCalType.
	self tempComponent summary: value
]

{ #category : #accessing }
ICCalendarGenerator >> tempAlarm [
	^tempAlarm
]

{ #category : #accessing }
ICCalendarGenerator >> tempAlarm: anObject [
	tempAlarm := anObject
]

{ #category : #accessing }
ICCalendarGenerator >> tempComponent [
	^tempComponent
]

{ #category : #accessing }
ICCalendarGenerator >> tempComponent: anObject [
	tempComponent := anObject
]

{ #category : #accessing }
ICCalendarGenerator >> tempTime [
	^tempTime
]

{ #category : #accessing }
ICCalendarGenerator >> tempTime: aTime [
	tempTime := aTime
]

{ #category : #accessing }
ICCalendarGenerator >> topStack [
	self tempAlarm isNil ifFalse: [
		^self tempAlarm ].
	
	self tempTime isNil ifFalse: [
		^self tempTime ].
	
	^self tempComponent
]

{ #category : #'processing-properties' }
ICCalendarGenerator >> transp: aString parameters: aDictionary [
	| value |
	value := self createValue: aString parameters: aDictionary default: String iCalType.
	self tempComponent transparency: value
]

{ #category : #'processing-properties' }
ICCalendarGenerator >> trigger: aString parameters: aDictionary [
	| value |
	value := ICTrigger fromICalString: aString parameters: aDictionary.
	self tempAlarm trigger: value
]

{ #category : #'processing-properties' }
ICCalendarGenerator >> tzid: aString parameters: aDictionary [
	| value |
	value := self createValue: aString parameters: aDictionary default: String iCalType.
	self tempComponent id: value
]

{ #category : #'processing-properties' }
ICCalendarGenerator >> tzname: aString parameters: aDictionary [
	| value |
	value := ICTimezoneName fromICalString: aString parameters: aDictionary.
	self topStack addName: value
]

{ #category : #'processing-properties' }
ICCalendarGenerator >> tzoffsetfrom: aString parameters: aDictionary [
	| value |
	value := ICUtcOffset fromICalString: aString parameters: aDictionary.
	self tempTime offsetFrom: value
]

{ #category : #'processing-properties' }
ICCalendarGenerator >> tzoffsetto: aString parameters: aDictionary [
	| value |
	value := ICUtcOffset fromICalString: aString parameters: aDictionary.
	self tempTime offsetTo: value
]

{ #category : #'processing-properties' }
ICCalendarGenerator >> tzurl: aString parameters: aDictionary [
	self url: aString parameters: aDictionary
]

{ #category : #'processing-properties' }
ICCalendarGenerator >> uid: aString parameters: aDictionary [
	| value |
	value := self createValue: aString parameters: aDictionary default: String iCalType.
	self tempComponent uid: value
]

{ #category : #'processing-properties' }
ICCalendarGenerator >> url: aString parameters: aDictionary [
	| value |
	value := self createValue: aString parameters: aDictionary default: ZnUrl iCalType.
	self tempComponent url: value
]

{ #category : #'processing-properties' }
ICCalendarGenerator >> version: aString parameters: aDictionary [
	| value |
	value := self createValue: aString parameters: aDictionary default: Float iCalType.
	self calendar version: value
]

{ #category : #'processing-properties' }
ICCalendarGenerator >> xwrcalname: aString parameters: aDictionary [
	| value |
	value := self createValue: aString parameters: aDictionary default: String iCalType.
	calendar name: value
]
