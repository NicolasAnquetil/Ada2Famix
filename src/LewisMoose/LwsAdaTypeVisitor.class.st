"
This class is responsible for looking ahead in the AST to determine what subclass of ADAType is to be instantiated.

Decisions made are for 5 subclasses: 
- enum 
- range 
- record
- access
- array

"
Class {
	#name : #LwsAdaTypeVisitor,
	#superclass : #AdaImporter,
	#category : #LewisMoose
}

{ #category : #'deciding none' }
LwsAdaTypeVisitor >> defaultDecision [

	^ADAType
]

{ #category : #deciding }
LwsAdaTypeVisitor >> visitAccessToObject: anAccessToObject [

	^ADATypeAccess
]

{ #category : #'deciding none' }
LwsAdaTypeVisitor >> visitAccessToSubprogram: anAccessToSubprogram [

	^self defaultDecision
]

{ #category : #'deciding none' }
LwsAdaTypeVisitor >> visitAnyRangeType: anAnyRangeType [

	^self defaultDecision
]

{ #category : #'deciding none' }
LwsAdaTypeVisitor >> visitAnyType: anAnyType [

	^self defaultDecision
]

{ #category : #deciding }
LwsAdaTypeVisitor >> visitArrayType: anArrayType [

	^ADATypeArray
]

{ #category : #deciding }
LwsAdaTypeVisitor >> visitDefinedRecordType: aDefinedRecordType [

	^ADATypeRecord
]

{ #category : #'deciding none' }
LwsAdaTypeVisitor >> visitDerivedType: aDerivedType [

	^self defaultDecision
]

{ #category : #'deciding none' }
LwsAdaTypeVisitor >> visitDigitsConstraint: aDigitsConstraint [

	^self defaultDecision
]

{ #category : #deciding }
LwsAdaTypeVisitor >> visitEnumerationType: anEnumerationType [

	^ADATypeEnum
]

{ #category : #'deciding none' }
LwsAdaTypeVisitor >> visitFloatingType: aFloatingType [

	^self defaultDecision
]

{ #category : #visiting }
LwsAdaTypeVisitor >> visitFullTypeDeclaration: aFullTypeDeclaration [

	^aFullTypeDeclaration typeDefinition 
		ifNotNil: [ :a | a accept: self ]
		ifNil: [ self defaultDecision ]
]

{ #category : #deciding }
LwsAdaTypeVisitor >> visitModIntegerType: aModIntegerType [

	^ADATypeMod
]

{ #category : #deciding }
LwsAdaTypeVisitor >> visitNullRecordType: aNullRecordType [

	^ADATypeRecord
]

{ #category : #'deciding none' }
LwsAdaTypeVisitor >> visitOrdinaryFixedType: anOrdinaryFixedType [

	^self defaultDecision
]

{ #category : #deciding }
LwsAdaTypeVisitor >> visitRangeConstraint: aRangeConstraint [

	^ADATypeRange
]

{ #category : #visiting }
LwsAdaTypeVisitor >> visitRangeIntegerType: aRangeIntegerType [

	^aRangeIntegerType range 
		ifNotNil: [ :a | a accept: self ]
		ifNil: [ self defaultDecision ]
]

{ #category : #visiting }
LwsAdaTypeVisitor >> visitSubtypeDeclaration: aSubtypeDeclaration [

	^aSubtypeDeclaration subtypeIndication 
		ifNotNil: [ :a | a accept: self ]
		ifNil: [ self defaultDecision ]
]

{ #category : #visiting }
LwsAdaTypeVisitor >> visitSubtypeIndication: aSubtypeIndication [
	
	^aSubtypeIndication constraint 
		ifNotNil: [ :a | a accept: self ]
		ifNil: [ self defaultDecision ]		
]
