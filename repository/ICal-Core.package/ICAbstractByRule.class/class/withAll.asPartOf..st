as yet unclassified
withAll: aCollectionOfValues asPartOf: aRecurringSchedule
	^ self new
		byValues: aCollectionOfValues;
		recurringSchedule: aRecurringSchedule;
		yourself