accessing
possibleFrequencies
	^OrderedCollection new
		add: self frequencySecondly;
		add: self frequencyMinutely;
		add: self frequencyHourly;
		add: self frequencyDaily;
		add: self frequencyWeekly;
		add: self frequencyMonthly; 
		add: self frequencyYearly;
		yourself