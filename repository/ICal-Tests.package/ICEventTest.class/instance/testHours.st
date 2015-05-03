testing
testHours
  self assert: (appointment1 hours asInteger = 3).
  self assert: (appointment2 hours = (1 +(1/6)) asFloat).
   