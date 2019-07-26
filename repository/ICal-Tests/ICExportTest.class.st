Class {
	#name : #ICExportTest,
	#superclass : #ICTest,
	#instVars : [
		'iCalExporter',
		'calendar',
		'event',
		'todo',
		'dateEvent',
		'journal',
		'alarm1',
		'alarm2'
	],
	#category : 'ICal-Tests-Core'
}

{ #category : #running }
ICExportTest >> setUp [
	calendar := ICCalendar name: 'test'.
	event := (ICEvent summary: 'aTitle')
				location: 'Bern';
				uid: 'a short but globally unique id';
				textualDescription: 'a long long long text, very long... really!';
				start: (self dateAndTimeClass 
							year: 2005
							month: 4
							day: 25
							hour: 10
							minute: 45
							second: 0);
				end: (self dateAndTimeClass 
							year: 2005
							month: 4
							day: 25
							hour: 12
							minute: 9
							second: 0);
				lastModified: (self dateAndTimeClass 
							year: 2005
							month: 5
							day: 1
							hour: 11
							minute: 2
							second: 31
							offset: (self durationClass seconds: 0));
				created: (self dateAndTimeClass 
							year: 2005
							month: 5
							day: 1
							hour: 11
							minute: 2
							second: 31
							offset: (self durationClass seconds: 0));
				beHighPriority;
				beTentative;
				beOpaque;
				yourself.
	todo := (ICTodo summary: 'aTitle')
				textualDescription: 'a long long long text, very long... really!';
				uid: 'a very special value';
				due: (self dateAndTimeClass 
							year: 2005
							month: 4
							day: 25
							hour: 12
							minute: 9
							second: 0);
				lastModified: (self dateAndTimeClass 
							year: 2005
							month: 5
							day: 1
							hour: 11
							minute: 2
							second: 31
							offset: (self durationClass seconds: 0));
				created: (self dateAndTimeClass 
							year: 2005
							month: 5
							day: 1
							hour: 11
							minute: 2
							second: 31
							offset: (self durationClass seconds: 0));
				completed: (self dateAndTimeClass 
							year: 2005
							month: 5
							day: 1
							hour: 11
							minute: 2
							second: 31
							offset: (self durationClass seconds: 0));
				beHighPriority;
				beCompleted;
				yourself.	
	dateEvent := (ICEvent summary: 'aTitle')
				uid: 'an event with a start date and not date and time';
				start: (self dateClass
							year: 2005
							month: 4
							day: 25);
				created: (self dateAndTimeClass 
							year: 2005
							month: 5
							day: 1
							hour: 11
							minute: 2
							second: 31
							offset: (self durationClass seconds: 0));
				addCategory: 'category1';
				addCategory: (ICCategory fromICalString: 'category2' parameters: Dictionary new);
				yourself.
	journal := (ICJournal summary: 'aTitle')
				uid: 'jornal1';
				created: (self dateAndTimeClass 
							year: 2005
							month: 5
							day: 1
							hour: 11
							minute: 2
							second: 31
							offset: (self durationClass seconds: 0));
				addTextualDescription: 'description1';
				addTextualDescription: 'description2';
				yourself.
	alarm1 := ICAlarm new
		trigger: (ICTrigger new
			value: (self dateAndTimeClass
				year: 1997 
				month: 3
				day: 17
				hour: 13
				minute: 30
				second: 0);
			yourself);
		repetitions: 4;
		delay: (self durationClass minutes: 15);
		beAudio;
		addAttachment: (ZnUrl fromICalString: 'ftp://host.com/pub/sounds/bell-01.aud');
		yourself.
	alarm2 := ICAlarm  new
		trigger: (ICTrigger new
			value: (self durationClass minutes: 30 negated);
			yourself);
		delay: (self durationClass days: 0 hours: 0 minutes: 15 seconds: 0);
		repetitions: 2;
		beDisplay;
		yourself.		
	iCalExporter := ICCalendarExporter calendar: calendar
]

{ #category : #private }
ICExportTest >> standardCalendarFooter [
	^'END:VCALENDAR' , String crlf.
]

{ #category : #private }
ICExportTest >> standardCalendarHeader [
	^'BEGIN:VCALENDAR' , String crlf 
	, 'PRODID:' , calendar productId , String crlf 
	, 'VERSION:2.0' , String crlf 
	, 'X-WR-CALNAME:test' , String crlf 
	, 'METHOD:PUBLISH' , String crlf
]

{ #category : #testing }
ICExportTest >> testExportAlarmWithAudioAction [
	| export str alarmEvent created |
	alarmEvent := ICEvent summary: 'an alarming event'.
	alarmEvent addAlarm: alarm1.
	created := alarmEvent created.
	alarmEvent uid: 'xxx'.
	calendar addEvent: alarmEvent.
	export := iCalExporter export.
	str := self standardCalendarHeader
				, 'BEGIN:VEVENT' , String crlf 				
				, 'UID:' , alarmEvent uid , String crlf 
				, 'CREATED:' , created asICalUtcString , String crlf 
				, 'SEQUENCE:0' , String crlf
				, 'SUMMARY:an alarming event' , String crlf 
				, 'PRIORITY:5' , String crlf
				, 'BEGIN:VALARM' , String crlf 
				, 'ACTION:AUDIO' , String crlf 
				, 'TRIGGER;VALUE=DATE-TIME:19970317T133000' , String crlf 
				, 'DURATION:PT0H15M0S' , String crlf 
				, 'REPEAT:4' , String crlf 
				, 'ATTACH:ftp://host.com/pub/sounds/bell-01.aud' , String crlf 
				, 'END:VALARM' , String crlf 
				, 'END:VEVENT' , String crlf 
				, self standardCalendarFooter.
	export dataStream contents 
		keysAndValuesDo: [:index :value |
			self assert: value = (str at: index) ].
	self assert: export dataStream contents = str
]

{ #category : #testing }
ICExportTest >> testExportAlarmWithDisplayAction [
	| export str alarmTodo created |
	alarmTodo := ICTodo summary: 'an alarming todo'.
	alarmTodo addAlarm: alarm2.
	created := alarmTodo created.
	alarmTodo uid: '(cons car cdr)'.
	calendar addEvent: alarmTodo.
	export := iCalExporter export.
	str := self standardCalendarHeader
				, 'BEGIN:VTODO' , String crlf 				
				, 'UID:' , alarmTodo uid , String crlf 
				, 'CREATED:' , created asICalUtcString , String crlf 
				, 'SEQUENCE:0' , String crlf
				, 'SUMMARY:an alarming todo' , String crlf 
				, 'PRIORITY:5' , String crlf 
				, 'BEGIN:VALARM' , String crlf 
				, 'ACTION:DISPLAY' , String crlf 
				, 'TRIGGER:-PT0H30M0S' , String crlf 
				, 'DURATION:PT0H15M0S' , String crlf 
				, 'REPEAT:2' , String crlf 
				, 'END:VALARM' , String crlf 
				, 'END:VTODO' , String crlf 
				, self standardCalendarFooter.
	export dataStream contents 
		keysAndValuesDo: [:index :value |
			self assert: value = (str at: index) ].
	self assert: export dataStream contents = str
]

{ #category : #testing }
ICExportTest >> testExportDateEvent [
	| export str |
	calendar addEvent: dateEvent.
	export := iCalExporter export.
	str := self standardCalendarHeader
				, 'BEGIN:VEVENT' , String crlf 				
				, 'UID:' , dateEvent uid , String crlf 
				, 'CATEGORIES:category1,category2' , String crlf
				, 'CREATED:20050501T110231Z' , String crlf 
				, 'SEQUENCE:0' , String crlf
				, 'SUMMARY:aTitle' , String crlf 
				, 'PRIORITY:5' , String crlf 				
				, 'DTSTART;VALUE=DATE:20050425' , String crlf 
				, 'END:VEVENT' , String crlf 
				, self standardCalendarFooter.
	export dataStream contents 
		keysAndValuesDo: [:index :value | self assert: value = (str at: index)].
	self assert: export dataStream contents = str
]

{ #category : #testing }
ICExportTest >> testExportEvent [
	| export str |
	calendar name: 'veriveri''s Calendar'.
	calendar addEvent: event.
	export := iCalExporter export.
	str := 'BEGIN:VCALENDAR' , String crlf 
				, 'PRODID:' , calendar productId , String crlf 
				, 'VERSION:2.0' , String crlf 
				, 'X-WR-CALNAME:veriveri''s Calendar' , String crlf
				, 'METHOD:PUBLISH' , String crlf
				, 'BEGIN:VEVENT' , String crlf 
				, 'UID:' , event uid , String crlf 
				, 'CREATED:20050501T110231Z' , String crlf 
				, 'STATUS:TENTATIVE' , String crlf 
				, 'LAST-MODIFIED:20050501T110231Z' , String crlf 
				, 'SEQUENCE:0' , String crlf
				, 'SUMMARY:aTitle' , String crlf 
				, 'PRIORITY:1' , String crlf 
				, 'DESCRIPTION:a long long long text\, very long... really!' , String crlf 
				, 'LOCATION:Bern' , String crlf 				
				, 'DTSTART:20050425T104500' , String crlf 
				, 'DTEND:20050425T120900' , String crlf 				
				, 'TRANSP:OPAQUE' , String crlf 
				, 'END:VEVENT' , String crlf 
				, self standardCalendarFooter.
	export dataStream contents 
		keysAndValuesDo: [:index :value |
			self assert: value = (str at: index) ].
	self assert: export dataStream contents = str
]

{ #category : #testing }
ICExportTest >> testExportExactlyThreeLines [
	| line expected |
	line := 'aaabbbcccddd dddcccbbbaaa zzz yyy xxx xxx yyy zzz bla foo bar xyz zyx tttttaaabbbcccddd dddcccbbbaaa zzz yyy xxx xxx yyy zzz bla foo bar xyz zyx ttttaaabbbcccddd dddcccbbbaaa zzz yyy xxx xxx yyy zzz bla foo bar xyz zyx tttt'.
	expected := 
		'aaabbbcccddd dddcccbbbaaa zzz yyy xxx xxx yyy zzz bla foo bar xyz zyx ttttt', String crlf,
		' aaabbbcccddd dddcccbbbaaa zzz yyy xxx xxx yyy zzz bla foo bar xyz zyx tttt', String crlf,
		' aaabbbcccddd dddcccbbbaaa zzz yyy xxx xxx yyy zzz bla foo bar xyz zyx tttt' , String crlf.

	self assert: (iCalExporter exportLine: line) dataStream contents = expected.
]

{ #category : #testing }
ICExportTest >> testExportExactlyTowLines [
	| line expected |
	line := 'aaabbbcccddd dddcccbbbaaa zzz yyy xxx xxx yyy zzz bla foo bar xyz zyx tttttaaabbbcccddd dddcccbbbaaa zzz yyy xxx xxx yyy zzz bla foo bar xyz zyx tttt'.
	expected :=
		'aaabbbcccddd dddcccbbbaaa zzz yyy xxx xxx yyy zzz bla foo bar xyz zyx ttttt', String crlf,
		' aaabbbcccddd dddcccbbbaaa zzz yyy xxx xxx yyy zzz bla foo bar xyz zyx tttt', String crlf.
	self assert: (iCalExporter exportLine: line) dataStream contents = expected.
]

{ #category : #testing }
ICExportTest >> testExportFourLines [
	| line expected |
	line := 'aaabbbcccddd dddcccbbbaaa zzz yyy xxx xxx yyy zzz bla foo bar xyz zyx tttttaaabbbcccddd dddcccbbbaaa zzz yyy xxx xxx yyy zzz bla foo bar xyz zyx ttttaaabbbcccddd dddcccbbbaaa zzz yyy xxx xxx yyy zzz bla foo bar xyz zyx tttt fff ggg hhh'.
	expected := 
		'aaabbbcccddd dddcccbbbaaa zzz yyy xxx xxx yyy zzz bla foo bar xyz zyx ttttt', String crlf,
		' aaabbbcccddd dddcccbbbaaa zzz yyy xxx xxx yyy zzz bla foo bar xyz zyx tttt' , String crlf,
		' aaabbbcccddd dddcccbbbaaa zzz yyy xxx xxx yyy zzz bla foo bar xyz zyx tttt' , String crlf,
		'  fff ggg hhh', String crlf.
	self assert: (iCalExporter exportLine: line) dataStream contents = expected.
]

{ #category : #testing }
ICExportTest >> testExportJournal [
	| export str |
	calendar addJournal: journal.
	export := iCalExporter export.
	str := self standardCalendarHeader
				, 'BEGIN:VJOURNAL' , String crlf 				
				, 'UID:' , journal uid , String crlf 
				, 'CREATED:20050501T110231Z' , String crlf 
				, 'SEQUENCE:0' , String crlf
				, 'SUMMARY:aTitle'  , String crlf 
				, 'DESCRIPTION:description1' , String crlf  				
				, 'DESCRIPTION:description2' , String crlf 
				, 'END:VJOURNAL' , String crlf 
				, self standardCalendarFooter.
	export dataStream contents 
		keysAndValuesDo: [:index :value | self assert: value = (str at: index)].
	self assert: export dataStream contents = str
]

{ #category : #testing }
ICExportTest >> testExportLine [
	| line expected |
	line := 'aaabbbcccddd dddcccbbbaaa zzz yyy xxx xxx yyy zzz bla foo bar xyz zyx ttttt fff ggg hhh'.
	expected :=
		'aaabbbcccddd dddcccbbbaaa zzz yyy xxx xxx yyy zzz bla foo bar xyz zyx ttttt', String crlf,
		'  fff ggg hhh', String crlf.

	self assert: (iCalExporter exportLine: line) dataStream contents = expected.
]

{ #category : #testing }
ICExportTest >> testExportThreeLines [
	| line expected |
	line := 'aaabbbcccddd dddcccbbbaaa zzz yyy xxx xxx yyy zzz bla foo bar xyz zyx tttttaaabbbcccddd dddcccbbbaaa zzz yyy xxx xxx yyy zzz bla foo bar xyz zyx tttt fff ggg hhh'.
	expected := 
		'aaabbbcccddd dddcccbbbaaa zzz yyy xxx xxx yyy zzz bla foo bar xyz zyx ttttt', String crlf,
		' aaabbbcccddd dddcccbbbaaa zzz yyy xxx xxx yyy zzz bla foo bar xyz zyx tttt', String crlf,
		'  fff ggg hhh', String crlf.

	self assert: (iCalExporter exportLine: line) dataStream contents = expected.
]

{ #category : #testing }
ICExportTest >> testExportTimezoneFictitiousEastern [
	| export str |
	calendar addTimezone: self timezoneFictitiousEastern.
	export := iCalExporter export.
	str := self standardCalendarHeader,
'BEGIN:VTIMEZONE', String crlf,
'TZID:US--Fictitious-Eastern', String crlf, 
'LAST-MODIFIED:19870101T000000Z', String crlf, 
'BEGIN:STANDARD', String crlf, 
'DTSTART:19671029T020000', String crlf, 
'RRULE:FREQ=YEARLY;BYDAY=-1SU;BYMONTH=10', String crlf, 
'TZOFFSETFROM:-0400', String crlf, 
'TZOFFSETTO:-0500', String crlf, 
'TZNAME:EST', String crlf, 
'END:STANDARD', String crlf, 
'BEGIN:DAYLIGHT', String crlf, 
'DTSTART:19870405T020000', String crlf, 
'RRULE:FREQ=YEARLY;UNTIL=19980404T070000Z;BYDAY=1SU;BYMONTH=4', String crlf, 
'TZOFFSETFROM:-0500', String crlf, 
'TZOFFSETTO:-0400', String crlf, 
'TZNAME:EDT', String crlf, 
'END:DAYLIGHT', String crlf, 
'END:VTIMEZONE', String crlf, 
self standardCalendarFooter.
	export dataStream contents 
		keysAndValuesDo: [:index :value | self assert: value = (str at: index)].
	self assert: export dataStream contents = str
]

{ #category : #testing }
ICExportTest >> testExportTimezoneFictitiousEasternThreeRules [
	| export str |
	calendar addTimezone: self timezoneFictitiousEasternThreeRules.
	export := iCalExporter export.
	str := self standardCalendarHeader,
'BEGIN:VTIMEZONE', String crlf,
'TZID:US--Fictitious-Eastern', String crlf, 
'LAST-MODIFIED:19870101T000000Z', String crlf, 
'BEGIN:STANDARD', String crlf, 
'DTSTART:19671029T020000', String crlf, 
'RRULE:FREQ=YEARLY;BYDAY=-1SU;BYMONTH=10', String crlf, 
'TZOFFSETFROM:-0400', String crlf, 
'TZOFFSETTO:-0500', String crlf, 
'TZNAME:EST', String crlf, 
'END:STANDARD', String crlf, 
'BEGIN:DAYLIGHT', String crlf, 
'DTSTART:19870405T020000', String crlf, 
'RRULE:FREQ=YEARLY;UNTIL=19980404T070000Z;BYDAY=1SU;BYMONTH=4', String crlf, 
'TZOFFSETFROM:-0500', String crlf, 
'TZOFFSETTO:-0400', String crlf, 
'TZNAME:EDT', String crlf, 
'END:DAYLIGHT', String crlf, 
'BEGIN:DAYLIGHT', String crlf, 
'DTSTART:19990424T020000', String crlf, 
'RRULE:FREQ=YEARLY;BYDAY=-1SU;BYMONTH=4', String crlf, 
'TZOFFSETFROM:-0500', String crlf, 
'TZOFFSETTO:-0400', String crlf, 
'TZNAME:EDT', String crlf, 
'END:DAYLIGHT', String crlf, 
'END:VTIMEZONE', String crlf, 
self standardCalendarFooter.
	export dataStream contents 
		keysAndValuesDo: [:index :value | self assert: value = (str at: index)].
	self assert: export dataStream contents = str
]

{ #category : #testing }
ICExportTest >> testExportTimezoneRecurrenceDate [
	| export str |
	calendar addTimezone: self timezoneRecurrenceDate.
	export := iCalExporter export.
	str := self standardCalendarHeader,
'BEGIN:VTIMEZONE', String crlf,
'TZID:US-Eastern', String crlf,
'LAST-MODIFIED:19870101T000000Z', String crlf,
'BEGIN:STANDARD', String crlf,
'DTSTART:19971026T020000', String crlf,
'RDATE:19971026T020000', String crlf,
'TZOFFSETFROM:-0400', String crlf,
'TZOFFSETTO:-0500', String crlf,
'TZNAME:EST', String crlf,
'END:STANDARD', String crlf,
'BEGIN:DAYLIGHT', String crlf,
'DTSTART:19971026T020000', String crlf,
'RDATE:19970406T020000', String crlf,
'TZOFFSETFROM:-0500', String crlf,
'TZOFFSETTO:-0400', String crlf,
'TZNAME:EDT', String crlf,
'END:DAYLIGHT', String crlf,
'END:VTIMEZONE', String crlf,
self standardCalendarFooter.
	export dataStream contents 
		keysAndValuesDo: [:index :value | self assert: value = (str at: index)].
	self assert: export dataStream contents = str
]

{ #category : #testing }
ICExportTest >> testExportTimezoneWithEndDate [
	| export str |
	calendar addTimezone: self timezoneWithEndDate.
	export := iCalExporter export.
	str := self standardCalendarHeader,
'BEGIN:VTIMEZONE', String crlf,
'TZID:US-Eastern', String crlf, 
'LAST-MODIFIED:19870101T000000Z', String crlf, 
'TZURL:http://zones.stds_r_us.net/tz/US-Eastern', String crlf, 
'BEGIN:STANDARD', String crlf, 
'DTSTART:19671029T020000', String crlf, 
'RRULE:FREQ=YEARLY;BYDAY=-1SU;BYMONTH=10', String crlf, 
'TZOFFSETFROM:-0400', String crlf, 
'TZOFFSETTO:-0500', String crlf, 
'TZNAME:EST', String crlf, 
'END:STANDARD', String crlf, 
'BEGIN:DAYLIGHT', String crlf, 
'DTSTART:19870405T020000', String crlf, 
'RRULE:FREQ=YEARLY;BYDAY=1SU;BYMONTH=4', String crlf, 
'TZOFFSETFROM:-0500', String crlf, 
'TZOFFSETTO:-0400', String crlf, 
'TZNAME:EDT', String crlf, 
'END:DAYLIGHT', String crlf, 
'END:VTIMEZONE', String crlf, 
self standardCalendarFooter.
	export dataStream contents 
		keysAndValuesDo: [:index :value | self assert: value equals: (str at: index)].
	self assert: export dataStream contents equals: str
]

{ #category : #testing }
ICExportTest >> testExportTodo [
	| export str |
	calendar addTodo: todo.
	export := iCalExporter export.
	str := self standardCalendarHeader
				, 'BEGIN:VTODO' , String crlf 
				, 'UID:' , todo uid , String crlf 
				, 'CREATED:20050501T110231Z' , String crlf 
				, 'STATUS:COMPLETED' , String crlf 
				, 'LAST-MODIFIED:20050501T110231Z' , String crlf 
				, 'SEQUENCE:0' , String crlf 
				, 'SUMMARY:aTitle' , String crlf 
				, 'PRIORITY:1' , String crlf 
				, 'DESCRIPTION:a long long long text\, very long... really!' , String crlf 
				, 'COMPLETED:20050501T110231Z' , String crlf 
				, 'DUE:20050425T120900' , String crlf 
				, 'END:VTODO' , String crlf 
				, self standardCalendarFooter.
	export dataStream contents 
		keysAndValuesDo: [:index :value | self assert: value = (str at: index)].
	self assert: export dataStream contents = str
]

{ #category : #testing }
ICExportTest >> testExportUmlautLineBreak [
	| line expected |
	iCalExporter stringConversionBlock: [ :string | string convertToEncoding: 'utf-8' ].
	line := 'aaabbbcccddd dddcccbbbaaa zzz yyy xxx xxx yyy zzz bla foo bar xyz zyx tttt¸fff ggg hhh'.
	expected := ('aaabbbcccddd dddcccbbbaaa zzz yyy xxx xxx yyy zzz bla foo bar xyz zyx tttt', String crlf,
		' ¸fff ggg hhh', String crlf) convertToEncoding: 'utf-8'.
	
	self assert: (iCalExporter exportLine: line) dataStream contents = expected.
]

{ #category : #testing }
ICExportTest >> testExportUmlautLineNoBreak [
	| line expected |
	iCalExporter stringConversionBlock: [ :string | string convertToEncoding: 'utf-8' ].
	line := 'aaabbbcccddd dddcccbbbaaa zzz yyy xxx xxx yyy zzz bla foo bar xyz zyx ttt¸fff ggg hhh'.
	expected := ('aaabbbcccddd dddcccbbbaaa zzz yyy xxx xxx yyy zzz bla foo bar xyz zyx ttt¸', String crlf,
		' fff ggg hhh', String crlf) convertToEncoding: 'utf-8'.
	
	self assert: (iCalExporter exportLine: line) dataStream contents equals: expected.
]

{ #category : #testing }
ICExportTest >> testICalDate [
	self assert: event start asDate asICalString = '20050425'.
	self assert: event end asDate asICalString = '20050425'
]

{ #category : #testing }
ICExportTest >> testICalDateAndTime [
	self 
		assert: event start asICalString = '20050425T104500'.
	self 
		assert: event end asICalString = '20050425T120900'
]

{ #category : #private }
ICExportTest >> timezoneFictitiousEastern [
	| timezone standard daylight |
	timezone := ICTimezone new.
	
	timezone := ICTimezone new.
	timezone id: 'US--Fictitious-Eastern'.
	timezone lastModified: (self dateAndTimeClass year: 1987 month: 01 day: 01 hour: 0 minute: 0 second: 0 offset: (self durationClass seconds: 0)).
	
	standard := ICStandardTime new.
	standard start: (self dateAndTimeClass year: 1967 month: 10 day: 29 hour: 02 minute: 00 second: 00).
	standard addRecurrenceRule: (ICRecurrenceRule yearly
		addWeekday: 'SU' occurrence: -1;
		addMonthnumber: 10;
		yourself).
	standard offsetFrom: (ICUtcOffset new positive: false; hours: 4; yourself).
	standard offsetTo: (ICUtcOffset new positive: false; hours: 5; yourself).
	standard addName: 'EST'.
	timezone addStandardTime: standard.
	
	daylight := ICDaylightSavingTime new.
	daylight start: (self dateAndTimeClass year: 1987 month: 04 day: 05 hour: 02 minute: 00 second: 00).
	daylight addRecurrenceRule: (ICRecurrenceRule yearly
		addWeekday: 'SU' occurrence: 1;
		addMonthnumber: 4;
		until: (self dateAndTimeClass year: 1998 month: 04 day: 04 hour: 07 minute: 00 second: 00 offset: (self durationClass seconds: 0));
		yourself).
	daylight offsetFrom: (ICUtcOffset new positive: false; hours: 5; yourself).
	daylight offsetTo: (ICUtcOffset new positive: false; hours: 4; yourself).
	daylight addName: 'EDT'.
	timezone addDaylightSavingTime: daylight.
	
	^timezone
]

{ #category : #private }
ICExportTest >> timezoneFictitiousEasternThreeRules [
	| timezone standard daylight |
	timezone := ICTimezone new.
	
	timezone := ICTimezone new.
	timezone id: 'US--Fictitious-Eastern'.
	timezone lastModified: (self dateAndTimeClass year: 1987 month: 01 day: 01 hour: 0 minute: 0 second: 0  offset: (self durationClass seconds: 0)).
	
	standard := ICStandardTime new.
	standard start: (self dateAndTimeClass year: 1967 month: 10 day: 29 hour: 02 minute: 00 second: 00).
	standard addRecurrenceRule: (ICRecurrenceRule yearly
		addWeekday: 'SU' occurrence: -1;
		addMonthnumber: 10;
		yourself).
	standard offsetFrom: (ICUtcOffset new positive: false; hours: 4; yourself).
	standard offsetTo: (ICUtcOffset new positive: false; hours: 5; yourself).
	standard addName: 'EST'.
	timezone addStandardTime: standard.
	
	daylight := ICDaylightSavingTime new.
	daylight start: (self dateAndTimeClass year: 1987 month: 04 day: 05 hour: 02 minute: 00 second: 00).
	daylight addRecurrenceRule: (ICRecurrenceRule yearly
		addWeekday: 'SU' occurrence: 1;
		addMonthnumber: 4;
		until: (self dateAndTimeClass year: 1998 month: 04 day: 04 hour: 07 minute: 00 second: 00 offset: (self durationClass seconds: 0));
		yourself).
	daylight offsetFrom: (ICUtcOffset new positive: false; hours: 5; yourself).
	daylight offsetTo: (ICUtcOffset new positive: false; hours: 4; yourself).
	daylight addName: 'EDT'.
	timezone addDaylightSavingTime: daylight.
	
	daylight := ICDaylightSavingTime new.
	daylight start: (self dateAndTimeClass year: 1999 month: 04 day: 24 hour: 02 minute: 00 second: 00).
	daylight addRecurrenceRule: (ICRecurrenceRule yearly
		addWeekday: 'SU' occurrence: -1;
		addMonthnumber: 4;
		yourself).
	daylight offsetFrom: (ICUtcOffset new positive: false; hours: 5; yourself).
	daylight offsetTo: (ICUtcOffset new positive: false; hours: 4; yourself).
	daylight addName: 'EDT'.
	timezone addDaylightSavingTime: daylight.
	
	^timezone
]

{ #category : #private }
ICExportTest >> timezoneRecurrenceDate [
	| timezone standard daylight |
	timezone := ICTimezone new.
	timezone id: 'US-Eastern'.
	timezone lastModified: (self dateAndTimeClass year: 1987 month: 01 day:  01 hour: 0 minute: 0 second: 0  offset: (self durationClass seconds: 0)).
	
	standard := ICStandardTime new.
	standard start: (self dateAndTimeClass year: 1997 month: 10 day: 26 hour: 02 minute: 00 second: 0).
	standard addRecurrenceDate: (self dateAndTimeClass year: 1997 month: 10 day: 26 hour: 02 minute: 00 second: 0).
	standard offsetFrom: (ICUtcOffset new positive: false; hours: 4; yourself).
	standard offsetTo: (ICUtcOffset new positive: false; hours: 5; yourself).
	standard addName: 'EST'.
	timezone addStandardTime: standard.
	
	daylight := ICDaylightSavingTime new.
	daylight start: (self dateAndTimeClass year: 1997 month: 10 day: 26 hour: 02 minute: 00 second: 0).
	daylight addRecurrenceDate: (self dateAndTimeClass year: 1997 month: 04 day: 06 hour: 02 minute: 00 second: 0).
	daylight offsetFrom: (ICUtcOffset new positive: false; hours: 5; yourself).
	daylight offsetTo: (ICUtcOffset new positive: false; hours: 4; yourself).
	daylight addName: 'EDT'.
	timezone addDaylightSavingTime: daylight.
	
	^timezone
]

{ #category : #private }
ICExportTest >> timezoneWithEndDate [
	| timezone standard daylight |
	timezone := ICTimezone new.
	
	timezone := ICTimezone new.
	timezone id: 'US-Eastern'.
	timezone lastModified: (self dateAndTimeClass year: 1987 month: 01 day: 01 hour: 0 minute: 0 second: 0  offset: (self durationClass seconds: 0)).
	timezone url: (ZnUrl fromString: 'http://zones.stds_r_us.net/tz/US-Eastern').
	
	standard := ICStandardTime new.
	standard start: (self dateAndTimeClass year: 1967 month: 10 day: 29 hour: 02 minute: 00 second: 00).
	standard addRecurrenceRule: (ICRecurrenceRule yearly
		addWeekday: 'SU' occurrence: -1;
		addMonthnumber: 10;
		yourself).
	standard offsetFrom: (ICUtcOffset new positive: false; hours: 4; yourself).
	standard offsetTo: (ICUtcOffset new positive: false; hours: 5; yourself).
	standard addName: 'EST'.
	timezone addStandardTime: standard.
	
	daylight := ICDaylightSavingTime new.
	daylight start: (self dateAndTimeClass year: 1987 month: 04 day: 05 hour: 02 minute: 00 second: 00).
	daylight addRecurrenceRule: (ICRecurrenceRule yearly
		addWeekday: 'SU' occurrence: 1;
		addMonthnumber: 4;
		yourself).
	daylight offsetFrom: (ICUtcOffset new positive: false; hours: 5; yourself).
	daylight offsetTo: (ICUtcOffset new positive: false; hours: 4; yourself).
	daylight addName: 'EDT'.
	timezone addDaylightSavingTime: daylight.
	
	^timezone
]
