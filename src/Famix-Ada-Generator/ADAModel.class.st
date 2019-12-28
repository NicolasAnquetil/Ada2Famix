"
I hold methods to be copied into ADAModel after it is generated
"
Class {
	#name : #ADAModel,
	#superclass : #MooseModel,
	#category : #'Famix-Ada-Generator-predefinedFamix'
}

{ #category : #'initialize-release' }
ADAModel >> initialize [
	"Simple initialize, but made mode difficult by the fact that used classes ADASourceLanguage
	and ADATopLevelContainer may not exist (not generated) when we define it.
	So we have to use reflection"
	super initialize.

	self sourceLanguage: (Smalltalk classNamed: #ADASourceLanguage) new.
	self add: (Smalltalk classNamed: #ADATopLevelContainer) new.
]
