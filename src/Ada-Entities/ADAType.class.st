"
An ADAType represent a type definition in Ada

subprogramsWithDeclaredType
  - list of subprograms with this type as return type
structuresWithDeclaredType
  - list of structural entities with this type as their type
thalesMessage
  - possible thales message that this type implements

 attributes
- list of attributes used in the model (see ADAAttribute class)

  
"
Class {
	#name : #ADAType,
	#superclass : #ADAContainerEntity,
	#instVars : [
		'subInheritances',
		'superInheritances',
		'subprogramsWithDeclaredType',
		'structuresWithDeclaredType',
		'parameters',
		'subprogramAccessesWithDeclaredType'
	],
	#category : #'Ada-Entities-FAMIX'
}

{ #category : #'initialize-release' }
ADAType class >> annotation [
	<MSEClass: #Type super: #ADAContainerEntity>
	<package: #ADA>
]

{ #category : #'*SYNAda-Entities-Lewis' }
ADAType >> accept: aVisitor andAssociateWithPackageInstance: packageInstance [
	"Double dispatch
	The association is a Reference"
	^ aVisitor associatePackageInstance: packageInstance withType: self
]

{ #category : #accessing }
ADAType >> addElement: anElement [
	self addLocalVariable: anElement
]

{ #category : #accessing }
ADAType >> addParameter: aParameter [

	parameters add: aParameter

]

{ #category : #accessing }
ADAType >> addStructureWithDeclaredType: aStructuralEntity [
	structuresWithDeclaredType add: aStructuralEntity
]

{ #category : #accessing }
ADAType >> addSubprogramWithDeclaredType: aSubprogram [
	subprogramsWithDeclaredType add: aSubprogram
]

{ #category : #accessing }
ADAType >> container [
	"We reuse parentPackage in order to not use too much memory."

	<MSEProperty: #container type: #ADAContainerEntity opposite: #types>
	<MSEComment: 'The container defining this type.'>
	<container>
	^ parentPackage
]

{ #category : #accessing }
ADAType >> container: aContainer [
	parentPackage := FMMultivalueLink
		on: self
		update: #types
		from: self container
		to: aContainer
]

{ #category : #testing }
ADAType >> hasSubTypes [

	^self subInheritances notEmpty.

	
]

{ #category : #testing }
ADAType >> hasSuperType [

	^self superInheritances notEmpty.

	
]

{ #category : #'moosequery-queries-incoming' }
ADAType >> incomingTypeDeclarations [
	^ self structuresWithDeclaredType , self subprogramsWithDeclaredType collect: [ :var | MooseChefTypeDeclarationAssociation newFrom: var to: self ]
]

{ #category : #'initialize-release' }
ADAType >> initialize [
	super initialize.
	subInheritances := FMNullMultivalueLink 
			on: self 
			opposite: #superclass: 
			selector: #subInheritances.
	superInheritances := FMNullMultivalueLink 
			on: self 
			opposite: #subclass: 
			selector: #superInheritances.
	parameters := FMNullMultivalueLink 
			on: self 
			opposite: #container: 
			selector: #parameters.
	subprogramsWithDeclaredType := FMNullMultivalueLink 
			on: self 
			opposite: #declaredType: 
			selector: #subprogramsWithDeclaredType.
	subprogramAccessesWithDeclaredType := FMNullMultivalueLink 
			on: self 
			opposite: #declaredType: 
			selector: #subprogramAccessesWithDeclaredType.
	structuresWithDeclaredType := FMNullMultivalueLink 
			on: self 
			opposite: #declaredType: 
			selector: #structuresWithDeclaredType.
	attributes := FMNullMultivalueLink 
			on: self
			opposite: #parentType:
			selector: #attributes.

]

{ #category : #testing }
ADAType >> isAdaAccessType [

	^false
]

{ #category : #testing }
ADAType >> isAdaAttributeType [

	^false
]

{ #category : #testing }
ADAType >> isAdaContainer [
	"Not all types are containers.
	 See subclassed implementations
		(((ADAType allSubclasses collect: #new) select: #isAdaContainer) collect: #class)
	"
		
	^ false
]

{ #category : #testing }
ADAType >> isAdaEnumeratedType [

	^false
]

{ #category : #testing }
ADAType >> isAdaModType [

	^false
]

{ #category : #testing }
ADAType >> isAdaRangeType [

	^false
]

{ #category : #testing }
ADAType >> isAdaRecordType [

	^false
]

{ #category : #testing }
ADAType >> isAdaTaskType [

	^false
]

{ #category : #testing }
ADAType >> isAdaType [
	^ true
]

{ #category : #testing }
ADAType >> isSubType [

	^self hasSuperType.

	
]

{ #category : #testing }
ADAType >> isSuperType [

	^self hasSubTypes.

	
]

{ #category : #testing }
ADAType >> isType [
	^ self isAdaType
]

{ #category : #accessing }
ADAType >> parameters [
	"Do we want to represent these 'discriminant parameters' with a specific famix entity ?
For now, I added the alternate opposite pragma to inform fame that ADAParameter>>container may have several kind of opposites (ADAType>>parameters OR ADASubprogram >> parameters)
"

	<MSEProperty: #parameters type: #ADAParameter opposite: #typeContainer>
	<multivalued>
	<derived>
	<MSEComment: 'List of discriminant parameters declared by this type.'>
	^ parameters
]

{ #category : #accessing }
ADAType >> parameters: anObject [
	
	parameters := anObject
]

{ #category : #accessing }
ADAType >> structuresWithDeclaredType [
	<MSEProperty: #structuresWithDeclaredType type: #ADAStructuralEntity opposite: #adaDeclaredType>
	<multivalued>
	<derived>
	<MSEComment: 'Structural entities that have this type as declaredType'>
	^ structuresWithDeclaredType
]

{ #category : #accessing }
ADAType >> structuresWithDeclaredType: anObject [
	
	structuresWithDeclaredType := anObject
]

{ #category : #accessing }
ADAType >> subInheritances [
	<MSEProperty: #subInheritances type: #FAMIXInheritance opposite: #adaSuperclass>
	<multivalued>
	<derived>
	<MSEComment: 'Subinheritance relationships, i.e. known subclasses of this type.'>
	^ subInheritances
]

{ #category : #accessing }
ADAType >> subInheritances: anInheritance [
	subInheritances value: anInheritance
]

{ #category : #accessing }
ADAType >> subTypes [

	^self subInheritances collect: #subclass

	
]

{ #category : #accessing }
ADAType >> subprogramAccessesWithDeclaredType [
	<MSEProperty: #subprogramAccessesWithDeclaredType type: #ADATypeAccessSubprogram opposite: #declaredType> <multivalued> <derived>
	<MSEComment: 'Ada subprogram that have this type as declaredType'>

	^ subprogramAccessesWithDeclaredType
]

{ #category : #accessing }
ADAType >> subprogramAccessesWithDeclaredType: anObject [
	
	subprogramAccessesWithDeclaredType := anObject
]

{ #category : #accessing }
ADAType >> subprogramsWithDeclaredType [
	<MSEProperty: #subprogramsWithDeclaredType type: #ADABehaviouralEntityWithParameters opposite: #declaredType> <multivalued> <derived>
	<MSEComment: 'Ada subprogram that have this type as declaredType'>

	^ subprogramsWithDeclaredType
]

{ #category : #accessing }
ADAType >> subprogramsWithDeclaredType: anObject [
	
	subprogramsWithDeclaredType := anObject
]

{ #category : #accessing }
ADAType >> superInheritances [
	<MSEProperty: #superInheritances type: #FAMIXInheritance opposite: #adaSubclass>
	<multivalued>
	<derived>
	<MSEComment: 'Superinheritance relationships, i.e. known superclasses of this type.'>
	^ superInheritances
]

{ #category : #accessing }
ADAType >> superInheritances: anInheritance [
	superInheritances value: anInheritance
]

{ #category : #accessing }
ADAType >> superType [

	self hasSuperType ifFalse: [ ^nil ].
	^self superTypes anyOne
	
]

{ #category : #accessing }
ADAType >> superTypes [

	^self superInheritances collect: #superclass

	
]
