"
a visitor on LewisAda model to build the signature of a subprogram (i.e. a String in the form 'function( argType;argType): retrunType'

Expected entry points are:
- visitQualifiedIdentifier:
- visitSubprogramDeclaration: (actually its  two sub-cases procedure and function)
"
Class {
	#name : #LwsVisitorSubprogramSignature,
	#superclass : #LwsWalkingVisitor,
	#category : #LewisMoose
}

{ #category : #visiting }
LwsVisitorSubprogramSignature >> visit: anAST [
	^ anAST accept: self

	
]

{ #category : #visiting }
LwsVisitorSubprogramSignature >> visitCompoundName: aCompoundName [
	^ aCompoundName elements last 
]

{ #category : #visiting }
LwsVisitorSubprogramSignature >> visitEntryDeclaration: anEntryDeclaration [
	"very similar to SubprogramDeclaration but the name is a string"
	^ String streamContents: [ :s |
			s nextPutAll: anEntryDeclaration name.
			s nextPut: $( .
			anEntryDeclaration parameters do: [ :p | s nextPutAll: (p accept: self) ] separatedBy: [ s nextPutAll: '; ' ].
			s nextPut: $) .
		]
]

{ #category : #visiting }
LwsVisitorSubprogramSignature >> visitFormalParameter: aFormalParameter [
	| domain |
	domain := aFormalParameter domainName accept: self.
	^ String streamContents: [ :s |
			aFormalParameter names do: [ :n | s nextPutAll: domain ] separatedBy: [ s nextPut: $; ].
		]
]

{ #category : #visiting }
LwsVisitorSubprogramSignature >> visitFunctionDeclaration: aFunctionDeclaration [
	^ (self visitSubprogramDeclaration: aFunctionDeclaration) , ': '
		,
			(aFunctionDeclaration returnType
				ifNotNil: [ :node | node accept: self ]
				ifNil: [ '**VOID**' ])
]

{ #category : #visiting }
LwsVisitorSubprogramSignature >> visitNamedAttribute: aNamedAttribute [
	"ENTITY LwsNamedAttribute SUBTYPE OF (LwsQualifier);
		parsedString : String;
	END_ENTITY;"

   ^ '''' , aNamedAttribute parsedString
]

{ #category : #visiting }
LwsVisitorSubprogramSignature >> visitNamedSelector: aNamedSelector [
	"ENTITY LwsNamedSelector SUBTYPE OF (LwsQualifier);
		parsedString : String;
	END_ENTITY;"
	^ aNamedSelector parsedString
]

{ #category : #visiting }
LwsVisitorSubprogramSignature >> visitOperatorOverloadDeclaration: anOperatorOverloadDeclaration [
	^ self visitFunctionDeclaration: anOperatorOverloadDeclaration
]

{ #category : #visiting }
LwsVisitorSubprogramSignature >> visitProcedureDeclaration: aProcedureDeclaration [
	^ self visitSubprogramDeclaration: aProcedureDeclaration
]

{ #category : #visiting }
LwsVisitorSubprogramSignature >> visitQualifiedIdentifier: aQualifiedIdentifier [

	^ String streamContents: [ :s |
			s nextPutAll: aQualifiedIdentifier name.
			aQualifiedIdentifier qualifiers do: [ :q |
				s nextPut: $. .
				s nextPutAll: (q accept: self)
			]
		]

]

{ #category : #visiting }
LwsVisitorSubprogramSignature >> visitStringDesignator: aStringDesignator [
	^ aStringDesignator name allButFirst allButLast
]

{ #category : #visiting }
LwsVisitorSubprogramSignature >> visitSubprogramDeclaration: aSubprogramDeclaration [

	^ String streamContents: [ :s |
			s nextPutAll: (aSubprogramDeclaration name accept: self).
			s nextPut: $( .
			aSubprogramDeclaration parameters do: [ :p | s nextPutAll: (p accept: self) ] separatedBy: [ s nextPutAll: ';' ].
			s nextPut: $) .
		]
]
