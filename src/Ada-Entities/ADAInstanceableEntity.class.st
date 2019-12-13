"
Description
--------------------

ADAInstanceableEntity is a small layer for ada entities that can be instanciated. It should only happen for Packages and Subprograms in Ada.
 
Internal Representation and Key Implementation Points.
--------------------

    Instance Variables
	instances:		<aMultivalueLink>	The list of instances of the entity.

"
Class {
	#name : #ADAInstanceableEntity,
	#superclass : #ADABehaviouralEntity,
	#instVars : [
		'instances',
		'generic',
		'isGeneric'
	],
	#category : #'Ada-Entities-FAMIX'
}

{ #category : #'initialize-release' }
ADAInstanceableEntity class >> annotation [
	<MSEClass: #InstanceableEntity super: #ADABehaviouralEntity>
	<package: #ADA>
	<abstract>
]

{ #category : #queries }
ADAInstanceableEntity class >> commonBooleanFilters [
	^ super commonBooleanFilters , {(#isGeneric -> 'Is generic')}
]

{ #category : #accessing }
ADAInstanceableEntity >> addInstance: aPackageInstance [
	self instances add: aPackageInstance
]

{ #category : #accessing }
ADAInstanceableEntity >> generic [
	<MSEProperty: #generic type: #ADAInstanceableEntity opposite: #instances>
	<MSEComment: 'The generic that this entity instantiates'>
	^ generic
]

{ #category : #accessing }
ADAInstanceableEntity >> generic: aGeneric [
	generic := FMMultivalueLink
		on: self
		update: #instances
		from: self generic
		to: aGeneric.	
			
	"sets the scope of the instance to be the same as the scope of the generic
	 must use parent setter method because fastScope: is prohibited in this class"
	aGeneric ifNotNil: [ super fastScope: aGeneric fastScope ]
]

{ #category : #'initialize-release' }
ADAInstanceableEntity >> initialize [
	super initialize.
	instances := FMNullMultivalueLink on: self opposite: #generic: selector: #instances.
	isGeneric := false
]

{ #category : #accessing }
ADAInstanceableEntity >> instances [
	<MSEProperty: #instances type: #ADAInstanceableEntity opposite: #generic>
	<multivalued>
	<derived>
	<MSEComment: 'The instanciations of a generic.'>
	^ instances
]

{ #category : #accessing }
ADAInstanceableEntity >> instances: aCollection [
	instances value: aCollection
]

{ #category : #accessing }
ADAInstanceableEntity >> isGeneric [
	<MSEProperty: #isGeneric type: #Boolean>
	<MSEComment: 'Whether this is a generic subprogram'>
	^ isGeneric
]

{ #category : #accessing }
ADAInstanceableEntity >> isGeneric: aBoolean [
	isGeneric := aBoolean
]
