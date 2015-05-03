accessing-types
possibleTypes
	^super possibleTypes
		add: self typeBulletinBoard;
		add: self typeCar;
		add: self typeCellular;
		add: self typeFax;
		add: self typeISDN;
		add: self typeModem;
		add: self typePager;
		add: self typePersonalCommunication;
		add: self typeVideo;
		add: self typeVoice;
		add: self typeVoiceMessage;
		yourself