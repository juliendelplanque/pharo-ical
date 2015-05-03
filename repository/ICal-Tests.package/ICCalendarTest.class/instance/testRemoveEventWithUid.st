testing-events
testRemoveEventWithUid
   self assert: (calendar includesEventWithUid: 'app1').
   calendar removeEventWithUid: 'app1'.
   self should: [ calendar eventWithUid: 'app1' ] raise: Error.
   calendar removeEventWithUid: 'todo1'.
  self should: [ calendar eventWithUid: 'todo1' ] raise: Error.