running
setUp
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