Class {
	#name : #ADAEntitiesMooseChiefCompatibility,
	#superclass : #TestCase,
	#category : #'Ada-tests-ThalesUtils'
}

{ #category : #'as yet unclassified' }
ADAEntitiesMooseChiefCompatibility >> classesList [
	^ (FAMIXNamedEntity withAllSubclasses
		select: [ :c | 
			c package name beginsWith: 'SYNAda-Entities' ] )
		reject: #isAlias
]

{ #category : #'as yet unclassified' }
ADAEntitiesMooseChiefCompatibility >> ensure: aSelector worksOnAllButAbstractClasses: aCollectionOfClasses [
	aCollectionOfClasses do: [ :c | [c new perform: aSelector] on: SubclassResponsibility do: [ self assert: c subclasses notEmpty ] ]
]

{ #category : #tests }
ADAEntitiesMooseChiefCompatibility >> testQueryIncomingDependencies [
	self ensure: #queryIncomingDependencies worksOnAllButAbstractClasses: self classesList
]

{ #category : #tests }
ADAEntitiesMooseChiefCompatibility >> testQueryOutgoingDependencies [
	self ensure: #queryOutgoingDependencies worksOnAllButAbstractClasses: self classesList
]
