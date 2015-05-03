testing
testTesting

  self deny: (appointment1 isFullDayEvent).
  self deny: (appointment1 isRecurrent).

  self deny: (todo isRecurrent).

  self assert: (appointment1 isValidForDate: (self dateAndTimeClass 
							year: 2005
							month: 5
							day: 18)).
							
   self assert: (todo startsInHour: todo due - (self durationClass days: 0 hours: 0 minutes: 0 seconds: 1)).