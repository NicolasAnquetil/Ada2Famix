Extension { #name : #FASTStatement }

{ #category : #'*Ada-Entities' }
FASTStatement >> fullName [
	^ self mooseName
]

{ #category : #'*Ada-Entities' }
FASTStatement >> parentCase [
	"THIS IS REALLY UGLY AND WE KNOW IT :(
 	But in Ada we have this case. So we define #parentCase to be good with the pragmas. 
	We put it as derived because it will already be exported in the MSE with the #statementContainer property. Thus we do not want to export it two times.
	"

	<MSEProperty: #parentCase type: #FASTAdaCaseAlternative opposite: #statements>
	<MSEComment: 'Ada case alternative containing this statement.'>
	<derived>
	^ self statementContainer
]

{ #category : #'*Ada-Entities' }
FASTStatement >> parentCase: aCase [
	"THIS IS REALLY UGLY AND WE KNOW IT :(
 	But in Ada we have this case. So we define #parentCase to be good with the pragmas. 
	"

	self statementContainer: aCase
]
