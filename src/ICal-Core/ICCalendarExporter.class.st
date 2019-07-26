"
I can export a calendar and save it in an iCalendar file.
"
Class {
	#name : #ICCalendarExporter,
	#superclass : #ICExporter,
	#instVars : [
		'calendar'
	],
	#category : 'ICal-Core-IO'
}

{ #category : #'instance creation' }
ICCalendarExporter class >> calendar: aCalendar [
	^(self new calendar: aCalendar)
]

{ #category : #examples }
ICCalendarExporter class >> example1 [
	"self example1"
	| calendar event exporter |
	calendar := ICCalendar new.
	event :=( ICEvent summary: 'demo event')
		start: Date today;
		addRecurrenceRule: ICRecurrenceRule weekly; 
		yourself.
	calendar addEvent: event.
	
	exporter := self calendar: calendar.
	exporter dataStream: (FileStream forceNewFileNamed: 'demo.ics').
	exporter export.
	
]

{ #category : #accessing }
ICCalendarExporter >> calendar [
	^calendar
]

{ #category : #accessing }
ICCalendarExporter >> calendar: aCalendar [
	calendar := aCalendar
]

{ #category : #accessing }
ICCalendarExporter >> contentType [
	^'text/calendar'
]

{ #category : #exporting }
ICCalendarExporter >> export [
	self dataStream reset.
	self lineStream reset.
	self export: self calendar.
	self save
]

{ #category : #'exporting-values' }
ICCalendarExporter >> exportAction: anObject [ 
	self exportProperty: anObject type: ICConversion actionType
]

{ #category : #'exporting-values' }
ICCalendarExporter >> exportAttachments: anObject [ 
	self exportProperty: anObject type: ICConversion attachmentType
]

{ #category : #'exporting-values' }
ICCalendarExporter >> exportCalendarName: anObject [ 
	self exportProperty: anObject type: ICConversion calendarNameType
]

{ #category : #'exporting-values' }
ICCalendarExporter >> exportCategories: anObject [ 
	self exportProperty: anObject type: ICConversion categoriesType
]

{ #category : #'exporting-values' }
ICCalendarExporter >> exportClassification: anObject [ 
	self exportProperty: anObject type: ICConversion classificationType
]

{ #category : #'exporting-values' }
ICCalendarExporter >> exportComments: anObject [ 
	self exportProperty: anObject type: ICConversion commentType
]

{ #category : #'exporting-values' }
ICCalendarExporter >> exportCompleted: anObject [ 
	self exportProperty: anObject type: ICConversion completedType
]

{ #category : #'exporting-values' }
ICCalendarExporter >> exportCreated: anObject [ 
	self exportProperty: anObject type: ICConversion createdType
]

{ #category : #'exporting-values' }
ICCalendarExporter >> exportDescription: anObject [ 
	self exportProperty: anObject type: ICConversion descriptionType
]

{ #category : #'exporting-values' }
ICCalendarExporter >> exportDue: anObject [ 
	self exportProperty: anObject type: ICConversion dueType
]

{ #category : #'exporting-values' }
ICCalendarExporter >> exportDuration: anObject [ 
	self exportProperty: anObject type: ICConversion durationType
]

{ #category : #'exporting-values' }
ICCalendarExporter >> exportExclusionDates: anObject [ 
	self exportProperty: anObject type: ICConversion exclusionDatesType
]

{ #category : #'exporting-values' }
ICCalendarExporter >> exportExclusionRules: anObject [
	self exportProperty: anObject type: ICConversion exculsionRuleType
]

{ #category : #'exporting-values' }
ICCalendarExporter >> exportLastModified: anObject [ 
	self exportProperty: anObject type: ICConversion lastModifiedType
]

{ #category : #'exporting-values' }
ICCalendarExporter >> exportLocation: anObject [ 
	self exportProperty: anObject type: ICConversion locationType
]

{ #category : #'exporting-values' }
ICCalendarExporter >> exportMethod: anObject [ 
	self exportProperty: anObject type: ICConversion methodType
]

{ #category : #'exporting-values' }
ICCalendarExporter >> exportOffsetFrom: anObject [ 
	self exportProperty: anObject type: ICConversion offsetFromType
]

{ #category : #'exporting-values' }
ICCalendarExporter >> exportOffsetTo: anObject [ 
	self exportProperty: anObject type: ICConversion offsetToType
]

{ #category : #'exporting-values' }
ICCalendarExporter >> exportPercentComplete: anObject [ 
	self exportProperty: anObject type: ICConversion percentCompleteType
]

{ #category : #'exporting-values' }
ICCalendarExporter >> exportPriority: anObject [ 
	self exportProperty: anObject type: ICConversion priorityType
]

{ #category : #'exporting-values' }
ICCalendarExporter >> exportProductId: anObject [ 
	self exportProperty: anObject type: ICConversion productIdType
]

{ #category : #'exporting-values' }
ICCalendarExporter >> exportRecurrenceDates: anObject [ 
	self exportProperty: anObject type: ICConversion recurrenceDatesType
]

{ #category : #'exporting-values' }
ICCalendarExporter >> exportRecurrenceRules: anObject [
	self exportProperty: anObject type: ICConversion recurrenceRuleType
]

{ #category : #'exporting-values' }
ICCalendarExporter >> exportRepetition: anObject [ 
	self exportProperty: anObject type: ICConversion repetitionType
]

{ #category : #'exporting-values' }
ICCalendarExporter >> exportResources: anObject [ 
	self exportProperty: anObject type: ICConversion resourcesType
]

{ #category : #'exporting-values' }
ICCalendarExporter >> exportSequenceNumber: anObject [ 
	self exportProperty: anObject type: ICConversion sequenceNumberType
]

{ #category : #'exporting-values' }
ICCalendarExporter >> exportStamp: anObject [ 
	self exportProperty: anObject type: ICConversion stampType
]

{ #category : #'exporting-values' }
ICCalendarExporter >> exportStart: anObject [ 
	self exportProperty: anObject type: ICConversion startType
]

{ #category : #'exporting-values' }
ICCalendarExporter >> exportStatus: anObject [ 
	self exportProperty: anObject type: ICConversion statusType
]

{ #category : #'exporting-values' }
ICCalendarExporter >> exportSummary: anObject [ 
	self exportProperty: anObject type: ICConversion summaryType
]

{ #category : #'exporting-values' }
ICCalendarExporter >> exportTimezoneNames: anObject [ 
	self exportProperty: anObject type: ICConversion timezoneNameType
]

{ #category : #'exporting-values' }
ICCalendarExporter >> exportTransparency: anObject [ 
	self exportProperty: anObject type: ICConversion transparencyType
]

{ #category : #'exporting-values' }
ICCalendarExporter >> exportTrigger: anObject [ 
	self exportProperty: anObject type: ICConversion triggerType
]

{ #category : #'exporting-values' }
ICCalendarExporter >> exportTzid: anObject [ 
	self exportProperty: anObject type: ICConversion tzidType
]

{ #category : #'exporting-values' }
ICCalendarExporter >> exportTzurl: anObject [ 
	self exportProperty: anObject type: ICConversion tzurlType
]

{ #category : #'exporting-values' }
ICCalendarExporter >> exportUid: anObject [ 
	self exportProperty: anObject type: ICConversion uidType
]

{ #category : #'exporting-values' }
ICCalendarExporter >> exportUrl: anObject [ 
	self exportProperty: anObject type: ICConversion urlType
]

{ #category : #'exporting-values' }
ICCalendarExporter >> exportVersion: anObject [ 
	self exportProperty: anObject type: ICConversion versionType
]
