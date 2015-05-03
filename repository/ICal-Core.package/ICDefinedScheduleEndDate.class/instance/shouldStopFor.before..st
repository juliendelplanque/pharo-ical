testing
shouldStopFor: anElement before: anEndDate
	^ anElement > anEndDate or: [ anElement > self lastDay ]