accessing-stati
possibleStati
	^super possibleStati
		add: self statusDraft;
		add: self statusFinal;
		yourself