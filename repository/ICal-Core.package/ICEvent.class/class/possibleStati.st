accessing-stati
possibleStati
	^super possibleStati
		add: self statusConfirmed;
		add: self statusTentative;
		yourself