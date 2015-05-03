growing
newDatesFrom: neededByValues considering: existingDates
	^ neededByValues collect: [ :each | self newDateFrom: existingDates first withInterestingCharacteristic: each ]