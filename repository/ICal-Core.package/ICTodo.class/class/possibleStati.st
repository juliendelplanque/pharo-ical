accessing
possibleStati
	^super possibleStati
		add: self statusInProcess;
		add: self statusNeedsAction;
		add: self statusCompleted;
		yourself