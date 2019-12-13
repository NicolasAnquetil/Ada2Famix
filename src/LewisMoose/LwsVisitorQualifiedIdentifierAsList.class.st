"
A LwsQualifiedIdentifierVisitor is a visitor on a QualifierIdentifier to build and return a list of the qualifiers composing it
"
Class {
	#name : #LwsVisitorQualifiedIdentifierAsList,
	#superclass : #LwsWalkingVisitor,
	#instVars : [
		'fastQualified'
	],
	#category : #LewisMoose
}

{ #category : #initialization }
LwsVisitorQualifiedIdentifierAsList >> initialize [
	fastQualified := FASTAdaQualifiedIdentifier new
]

{ #category : #visitor }
LwsVisitorQualifiedIdentifierAsList >> visit: anAST [
	"starting point of the visitor"
	anAST accept: self.
	^ fastQualified
]

{ #category : #visitor }
LwsVisitorQualifiedIdentifierAsList >> visitAccessAttribute: anAccessAttribute [
]

{ #category : #visitor }
LwsVisitorQualifiedIdentifierAsList >> visitAllSelector: anAllSelector [
]

{ #category : #visitor }
LwsVisitorQualifiedIdentifierAsList >> visitArgumentsSelector: anArgumentsSelector [
	"ENTITY LwsArgumentsSelector SUBTYPE OF (LwsQualifier);
		arguments : LwsAggregate;
	END_ENTITY;
	
	ENTITY LwsAggregate SUBTYPE OF (LwsAbstractAggregate);
		elements : list OF LwsAggregateElement ::= OrderedCollection new;
	END_ENTITY;
	TYPE LwsAggregateElement = SELECT ( 
		LwsComponentAssociation,
		LwsExpression );
	END_TYPE;"
	anArgumentsSelector arguments elements do: [ :a |
		fastQualified addArgument: (LwsVisitorQualifiedIdentifierAsList new visit: a)
	]
]

{ #category : #visitor }
LwsVisitorQualifiedIdentifierAsList >> visitCharacterSelector: aCharacterSelector [
	"ENTITY LwsCharacterSelector SUBTYPE OF (LwsQualifier);
		parsedString : String;
	END_ENTITY;"
]

{ #category : #visitor }
LwsVisitorQualifiedIdentifierAsList >> visitComponentAssociation: aComponentAssociation [
	"aComponentAssociation choices ifNotNil: [ :a | a do: [ :e | e accept: self ] ]"
	aComponentAssociation expression accept: self
	
]

{ #category : #visitor }
LwsVisitorQualifiedIdentifierAsList >> visitCompoundName: aCompoundName [
	aCompoundName elements do: [:elem | fastQualified addIdentifier: elem]
]

{ #category : #visitor }
LwsVisitorQualifiedIdentifierAsList >> visitDeltaAttribute: aDeltaAttribute [
]

{ #category : #visitor }
LwsVisitorQualifiedIdentifierAsList >> visitDigitsAttribute: aDigitsAttribute [
]

{ #category : #visitor }
LwsVisitorQualifiedIdentifierAsList >> visitNamedAttribute: aNamedAttribute [
	"ENTITY LwsNamedAttribute SUBTYPE OF (LwsQualifier);
		parsedString : String;
	END_ENTITY;"

	"Change the fastQualified, it is not a FASTAdaQualifiedIdentifier but a FASTAdaNamedAttributeIdentifier
	fastQualified := FASTAdaNamedAttributeIdentifier new initializeFrom: fastQualified."

   fastQualified addIdentifier: aNamedAttribute parsedString
]

{ #category : #visitor }
LwsVisitorQualifiedIdentifierAsList >> visitNamedSelector: aNamedSelector [
	"ENTITY LwsNamedSelector SUBTYPE OF (LwsQualifier);
		parsedString : String;
	END_ENTITY;"
	fastQualified addIdentifier: aNamedSelector parsedString 
]

{ #category : #visitor }
LwsVisitorQualifiedIdentifierAsList >> visitPrimaryQualifier: aPrimaryQualifier [
	"ENTITY LwsPrimaryQualifier SUBTYPE OF (LwsQualifier);
		primary : LwsUnaryExpression;
	END_ENTITY;"
]

{ #category : #visitor }
LwsVisitorQualifiedIdentifierAsList >> visitQualifiedIdentifier: aQualifiedIdentifier [
	"collects all components (simple identifiers) of aQualifiedIdentifier"
	fastQualified addIdentifier: aQualifiedIdentifier name value.

	"Note: if aQualifiedIdentifier is a simple identifier, 'qualifiers' will be empty"
	aQualifiedIdentifier qualifiers
		do: [ :q | q accept: self].

	^ fastQualified
]

{ #category : #visitor }
LwsVisitorQualifiedIdentifierAsList >> visitStringDesignator: aStringDesignator [
	fastQualified addIdentifier: aStringDesignator name allButFirst allButLast
]

{ #category : #visitor }
LwsVisitorQualifiedIdentifierAsList >> visitStringLiteral: aStringLiteral [
]

{ #category : #visitor }
LwsVisitorQualifiedIdentifierAsList >> visitStringSelector: aStringSelector [
	"ENTITY LwsStringSelector SUBTYPE OF (LwsQualifier);
		parsedString : String;
	END_ENTITY;"
	fastQualified addIdentifier: aStringSelector parsedString
]
