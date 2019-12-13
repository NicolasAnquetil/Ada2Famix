"
An ADAGenericSubprogramInstanciation is aan Ada subprogram that is an instanciation of a generic subprogram

It use the scope of the generic to resolve names
"
Class {
	#name : #ADAGenericSubprogramInstanciation,
	#superclass : #ADASubprogram,
	#category : #'Ada-Entities-FAMIX'
}

{ #category : #'initialize-release' }
ADAGenericSubprogramInstanciation class >> annotation [
	<MSEClass: #GenericSubprogramInstanciation super: #ADASubprogram>
	<package: #ADA>
]

{ #category : #accessing }
ADAGenericSubprogramInstanciation >> fastScope: aScope [
	"the scope should be the one of the instanciated generic and should not be chnaged"
	self shouldNotImplement 
]
