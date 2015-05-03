accessing
supportedComponents
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