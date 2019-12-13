Extension { #name : #ADAStructuralEntity }

{ #category : #'*SYNAda-Entities-Lewis' }
ADAStructuralEntity >> accept: aVisitor andAssociateWithPackageInstance: packageInstance [
	"Double dispatch
	The association is an Access"
	^ aVisitor associatePackageInstance: packageInstance withStructural: self
]

{ #category : #'*SYNAda-Entities-Lewis' }
ADAStructuralEntity >> accept: aVisitor andCreateAssociationWith: aQualifiedIdentifier [
	"Double dispatch
	The created association is an Access"
	 ^ aVisitor createStructuralAccessResolvedAs: self
]

{ #category : #'*SYNAda-Entities-THALES' }
ADAStructuralEntity >> correspondingThalesMessage [
	^ self mooseModel variablesAndMessagesMap at: self ifAbsent: [ nil ]
]

{ #category : #'*SYNAda-Entities-THALES' }
ADAStructuralEntity >> isThalesCommunicationChannel [
	<MSEProperty: #isThalesCommunicationChannel type: #Boolean>
	<MSEComment: 'Whether this is a constant marking a Thales communication channel'>

	^ self privateState attributeAt: #isThalesCommunicationChannel ifAbsent: [ false ]
]

{ #category : #'*SYNAda-Entities-THALES' }
ADAStructuralEntity >> isThalesCommunicationChannel: aBoolean [

	^ self privateState attributeAt: #isThalesCommunicationChannel put: aBoolean
]
