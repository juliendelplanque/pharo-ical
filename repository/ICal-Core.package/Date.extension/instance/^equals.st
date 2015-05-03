*ICal-Core
= comparand
	^ self species = comparand species 
		and: [ self start year = comparand start year
				and: [ self start  month = comparand start month 
					and:[self start day= comparand start day ]]]
