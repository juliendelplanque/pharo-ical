Class {
	#name : #ICConversion,
	#superclass : #Object,
	#category : 'ICal-Core-IO'
}

{ #category : #'accessing-types' }
ICConversion class >> actionType [
	^ICTypeInformation
		name: 'ACTION' 
		type: String iCalType 
		multivalued: false
]

{ #category : #'accessing-types' }
ICConversion class >> attachmentType [
	^ICTypeInformation
		name: 'ATTACH' 
		type: ZnUrl iCalType 
		multivalued: false
]

{ #category : #'accessing-types' }
ICConversion class >> beginComponentType [
	^ICTypeInformation 
		name: 'BEGIN' 
		type: String iCalType 
		multivalued: false
]

{ #category : #'accessing-types' }
ICConversion class >> calendarNameType [
	^ICTypeInformation 
		name: 'X-WR-CALNAME' 
		type: String iCalType 
		multivalued: false
]

{ #category : #'accessing-types' }
ICConversion class >> categoriesType [
	^ICTypeInformation 
		name: 'CATEGORIES' 
		type: String iCalType 
		multivalued: true
]

{ #category : #'accessing-types' }
ICConversion class >> classificationType [
	^ICTypeInformation
		name: 'CLASS' 
		type: String iCalType 
		multivalued: false
]

{ #category : #'accessing-types' }
ICConversion class >> commentType [
	^ICTypeInformation
		name: 'COMMENT' 
		type: String iCalType 
		multivalued: false
]

{ #category : #'accessing-types' }
ICConversion class >> completedType [
	^ICTimeTypeInformation
		name: 'COMPLETED' 
		type: DateAndTime iCalType 
		multivalued: false
		utc: true
]

{ #category : #accessing }
ICConversion class >> componentClassFor: anICalComponentName [
	^self supportedComponents detect: [ :each |
		each iCalType sameAs: anICalComponentName ]
]

{ #category : #'accessing-types' }
ICConversion class >> createdType [
	^ICTimeTypeInformation
		name: 'CREATED' 
		type: DateAndTime iCalType 
		multivalued: false
		utc: true
]

{ #category : #accessing }
ICConversion class >> dateAndTimeClass [
	^self hasChronosLoaded
		ifTrue: [ self environment classNamed: 'Timepoint' ]
		ifFalse: [ DateAndTime ]
]

{ #category : #accessing }
ICConversion class >> dateClass [
	^self hasChronosLoaded
		ifTrue: [ self environment classNamed: 'YearMonthDay' ]
		ifFalse: [ Date ]
]

{ #category : #'accessing-types' }
ICConversion class >> descriptionType [
	^ICTypeInformation
		name: 'DESCRIPTION' 
		type: String iCalType 
		multivalued: false
]

{ #category : #'accessing-types' }
ICConversion class >> dueType [
	^ICTimeTypeInformation
		name: 'DUE' 
		type: DateAndTime iCalType 
		multivalued: false
]

{ #category : #accessing }
ICConversion class >> durationClass [
	^self hasChronosLoaded
		ifTrue: [ self environment classNamed: 'ScientificDuration' ]
		ifFalse: [ Duration ]
]

{ #category : #'accessing-types' }
ICConversion class >> durationType [
	^ICTimeTypeInformation
		name: 'DURATION' 
		type: Duration iCalType 
		multivalued: false
]

{ #category : #'accessing-types' }
ICConversion class >> endComponentType [
	^ICTimeTypeInformation
		name: 'END' 
		type: String iCalType 
		multivalued: false
]

{ #category : #'accessing-types' }
ICConversion class >> endType [
	^ICTimeTypeInformation 
		name: 'DTEND' 
		type: DateAndTime iCalType 
		multivalued: false
]

{ #category : #'accessing-types' }
ICConversion class >> exclusionDatesType [
	^ICTimeTypeInformation
		name: 'EXDATE' 
		type: DateAndTime iCalType 
		multivalued: true
]

{ #category : #'accessing-types' }
ICConversion class >> exculsionRuleType [
	^ICTypeInformation
		name: 'EXRULE' 
		type: ICRecurrenceRule iCalType 
		multivalued: false
]

{ #category : #'accessing-types' }
ICConversion class >> geoType [
	^ICTypeInformation
		name: 'GEO'
		type: Float iCalType 
		multivalued: false
]

{ #category : #testing }
ICConversion class >> hasChronosLoaded [
	^self environment hasClassNamed: 'ChronosObject'
]

{ #category : #accessing }
ICConversion class >> infiniteDuration [ 
	^self hasChronosLoaded
		ifTrue: [ self environment classNamed: 'InfiniteDuration' ]
		ifFalse: [ (1000*1000*365.25 ) days ]
]

{ #category : #accessing }
ICConversion class >> isSupportedComponent: anICalComponentName [
	^self supportedComponents anySatisfy: [ :each |
		each iCalType sameAs: anICalComponentName ]
]

{ #category : #'accessing-types' }
ICConversion class >> lastModifiedType [
	^ICTimeTypeInformation
		name: 'LAST-MODIFIED' 
		type: DateAndTime iCalType 
		multivalued: false
		utc: true
]

{ #category : #'accessing-types' }
ICConversion class >> locationType [
	^ICTypeInformation 
		name: 'LOCATION' 
		type: String iCalType 
		multivalued: false
]

{ #category : #'accessing-types' }
ICConversion class >> methodType [
	^ICTypeInformation
		name: 'METHOD' 
		type: String iCalType 
		multivalued: false
]

{ #category : #'accessing-types' }
ICConversion class >> offsetFromType [
	^ICTypeInformation
		name: 'TZOFFSETFROM' 
		type: ICUtcOffset iCalType 
		multivalued: false
]

{ #category : #'accessing-types' }
ICConversion class >> offsetToType [
	^ICTypeInformation
		name: 'TZOFFSETTO' 
		type: ICUtcOffset iCalType 
		multivalued: false
]

{ #category : #'accessing-types' }
ICConversion class >> percentCompleteType [
	^ICTypeInformation
		name: 'PERCENT-COMPLETE' 
		type: Integer iCalType 
		multivalued: false
]

{ #category : #'accessing-types' }
ICConversion class >> priorityType [
	^ICTypeInformation
		name: 'PRIORITY' 
		type: Integer iCalType 
		multivalued: false
]

{ #category : #'accessing-types' }
ICConversion class >> productIdType [
	^ICTypeInformation
		name: 'PRODID' 
		type: String iCalType 
		multivalued: false
]

{ #category : #accessing }
ICConversion class >> propertyClassFor: anICalType [
	^self supportedClasses detect: [ :each |
		each iCalType = anICalType ]
]

{ #category : #'accessing-types' }
ICConversion class >> recurrenceDatesType [
	^ICTimeTypeInformation
		name: 'RDATE' 
		type: DateAndTime iCalType 
		multivalued: true
]

{ #category : #'accessing-types' }
ICConversion class >> recurrenceRuleType [
	^ICTypeInformation
		name: 'RRULE' 
		type: ICRecurrenceRule iCalType 
		multivalued: false
]

{ #category : #'accessing-types' }
ICConversion class >> repetitionType [
	^ICTypeInformation
		name: 'REPEAT' 
		type: Integer iCalType 
		multivalued: false
]

{ #category : #'accessing-types' }
ICConversion class >> resourcesType [
	^ICTypeInformation
		name: 'RESOURCES' 
		type: String iCalType 
		multivalued: true
]

{ #category : #'accessing-types' }
ICConversion class >> sequenceNumberType [
	^ICTypeInformation
		name: 'SEQUENCE'
		type: Integer iCalType 
		multivalued: false
]

{ #category : #'accessing-types' }
ICConversion class >> stampType [
	^ICTimeTypeInformation 
		name: 'DTSTAMP' 
		type: DateAndTime iCalType 
		multivalued: false
		utc: true
]

{ #category : #'accessing-types' }
ICConversion class >> startType [
	^ICTimeTypeInformation 
		name: 'DTSTART' 
		type: DateAndTime iCalType 
		multivalued: false
]

{ #category : #'accessing-types' }
ICConversion class >> statusType [
	^ICTypeInformation 
		name: 'STATUS' 
		type: String iCalType 
		multivalued: false
]

{ #category : #'accessing-types' }
ICConversion class >> summaryType [
	^ICTypeInformation 
		name: 'SUMMARY' 
		type: String iCalType 
		multivalued: false
]

{ #category : #accessing }
ICConversion class >> supportedClasses [
	^OrderedCollection new
		add: Boolean;
		add: ByteArray;
		add: Float;
		add: ICRecurrenceRule;
		add: Integer;
		add: String;
		add: ZnUrl;
		add: self timeClass;
		add: self dateClass;
		add: self dateAndTimeClass;
		add: self durationClass;
		add: ICUtcOffset;
		yourself.
]

{ #category : #accessing }
ICConversion class >> supportedComponents [
	^(OrderedCollection new)
		add: ICCalendar;
		add: ICEvent;
		add: ICTodo;
		add: ICAlarm;
		add: ICFreeBusy;
		add: ICTimezone;
		add: ICJournal;
		add: ICVCard;
		yourself
]

{ #category : #accessing }
ICConversion class >> timeClass [
	^self hasChronosLoaded
		ifTrue: [ self environment classNamed: #TimeOfDay ]
		ifFalse: [ Time ]
]

{ #category : #accessing }
ICConversion class >> timespanClass [
	^ self hasChronosLoaded
		ifTrue: [ self environment classNamed: #Timeperiod ]
		ifFalse: [ Timespan ]
]

{ #category : #'accessing-types' }
ICConversion class >> timezoneNameType [
	^ICTypeInformation
		name: 'TZNAME' 
		type: String iCalType 
		multivalued: false
]

{ #category : #'accessing-types' }
ICConversion class >> transparencyType [
	^ICTypeInformation 
		name: 'TRANSP' 
		type: String iCalType 
		multivalued: false
]

{ #category : #'accessing-types' }
ICConversion class >> triggerType [
	^ICTypeInformation
		name: 'TRIGGER' 
		type: Duration iCalType 
		multivalued: false
]

{ #category : #'accessing-types' }
ICConversion class >> tzidType [
	^ICTypeInformation
		name: 'TZID' 
		type: String iCalType 
		multivalued: false
]

{ #category : #'accessing-types' }
ICConversion class >> tzurlType [
	^ICTypeInformation
		name: 'TZURL' 
		type: ZnUrl iCalType 
		multivalued: false
]

{ #category : #'accessing-types' }
ICConversion class >> uidType [
	^ICTypeInformation 
		name: 'UID' 
		type: String iCalType
		multivalued: false
]

{ #category : #'accessing-types' }
ICConversion class >> urlType [
	^ICTypeInformation
		name: 'URL' 
		type: ZnUrl iCalType 
		multivalued: false
]

{ #category : #'accessing-types' }
ICConversion class >> versionType [
	^ICTypeInformation 
		name: 'VERSION'
		type: Float iCalType 
		multivalued: false
]
