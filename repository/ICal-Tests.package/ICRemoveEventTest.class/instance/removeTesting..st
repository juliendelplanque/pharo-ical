private
removeTesting: anEvent
"Helper method for testing methods. Test removing the current event"
  | eventSizeBeforeRemove |
  eventSizeBeforeRemove := calendar events size.
  calendar removeEvent: anEvent.
  self deny: (calendar events size = eventSizeBeforeRemove).
  self assert: (calendar events size = (eventSizeBeforeRemove - 1)).
