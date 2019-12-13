Extension { #name : #FAMIXInheritance }

{ #category : #'*Ada-Entities' }
FAMIXInheritance >> adaSubclass [
	"THIS IS REALLY UGLY AND WE KNOW IT :(
	The problem is that, for now, FAMIX does not manage entities that are containers AND behaviourals. 	But in Ada we have this case. So we define #adaSubclass to be good with the pragmas. 
	We put it as derived because it will already be exported in the MSE with the #subclass property. Thus we do not want to export it two times.
	"

	<MSEProperty: #adaSubclass type: #ADAType opposite: #superInheritances>
	<MSEComment: 'Subclass linked to in this relationship. from-side of the association'>
	<derived>
	<source>
	^ self subclass
]

{ #category : #'*Ada-Entities' }
FAMIXInheritance >> adaSubclass: aType [
	"THIS IS REALLY UGLY AND WE KNOW IT :(
	The problem is that, for now, FAMIX does not manage entities that are containers AND behaviourals. 	But in Ada we have this case. So we define #adaSubclass to be good with the pragmas. 
	"

	^ self subclass: aType
]

{ #category : #'*Ada-Entities' }
FAMIXInheritance >> adaSuperclass [
	"THIS IS REALLY UGLY AND WE KNOW IT :(
	The problem is that, for now, FAMIX does not manage entities that are containers AND behaviourals. 	But in Ada we have this case. So we define #adaSuperclass to be good with the pragmas. 
	We put it as derived because it will already be exported in the MSE with the #superclass property. Thus we do not want to export it two times.
	"

	<MSEProperty: #adaSuperclass type: #ADAType opposite: #subInheritances>
	<MSEComment: 'Superclass linked to in this relationship. to-side of the association'>
	<derived>
	<target>
	^ self superclass
]

{ #category : #'*Ada-Entities' }
FAMIXInheritance >> adaSuperclass: aType [
	"THIS IS REALLY UGLY AND WE KNOW IT :(
	The problem is that, for now, FAMIX does not manage entities that are containers AND behaviourals. 	But in Ada we have this case. So we define #adaSuperclass to be good with the pragmas. 
	"

	^ self superclass: aType
]
