"
Instances of this class represent specialized extensions of ADAType instances of type 'access function/procedure', e.g.

- type myFuncType  is access function(X: Float) return Float;
- type myProcType is access procedure(X: Float; Y: Float);

 


"
Class {
	#name : #ADATypeAccessSubprogram,
	#superclass : #ADAType,
	#instVars : [
		'declaredType',
		'signature'
	],
	#category : #'Ada-Entities-FAMIX'
}

{ #category : #'initialize-release' }
ADATypeAccessSubprogram class >> annotation [
	<MSEClass: #TypeAccessSubprogram super: #ADAType>
	<package: #ADA>
]

{ #category : #queries }
ADATypeAccessSubprogram class >> commonBooleanFilters [
	^ super commonBooleanFilters
		,
			{(#isFunction -> 'Is function').
			(#isProcedure -> 'Is Procedure')}
]

{ #category : #accessing }
ADATypeAccessSubprogram >> declaredType [
	<MSEProperty: #declaredType type: #ADAType opposite: #subprogramAccessesWithDeclaredType>
	<MSEComment: 'Return type of the function (nil for procedures)'>
	
	^ declaredType
]

{ #category : #accessing }
ADATypeAccessSubprogram >> declaredType: aType [
	declaredType :=  FMMultivalueLink on: self
					update: #subprogramAccessesWithDeclaredType
					from: self declaredType
					to: aType.

]

{ #category : #testing }
ADATypeAccessSubprogram >> isAdaAccessType [

	^true
]

{ #category : #testing }
ADATypeAccessSubprogram >> isFunction [
	^ declaredType notNil
]

{ #category : #testing }
ADATypeAccessSubprogram >> isProcedure [
	^ declaredType isNil
]

{ #category : #accessing }
ADATypeAccessSubprogram >> numberOfParameters [
	<MSEProperty: #numberOfParameters type: #Number>
	<MSEComment: 'The number of parameters in a method'>
	<derived>
	^self
		lookUpPropertyNamed: #numberOfParameters
		computedAs: [self parameters size]
]

{ #category : #accessing }
ADATypeAccessSubprogram >> signature [
	<MSEProperty: #signature type: #String>
	<MSEComment: 'Signature characterizing this subprogram.'>

	^ signature
]

{ #category : #accessing }
ADATypeAccessSubprogram >> signature: anObject [
	
	signature := anObject
]
