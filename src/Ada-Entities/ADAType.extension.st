Extension { #name : #ADAType }

{ #category : #'*SYNAda-Entities-Lewis' }
ADAType >> accept: aVisitor andAssociateWithPackageInstance: packageInstance [
	"Double dispatch
	The association is a Reference"
	^ aVisitor associatePackageInstance: packageInstance withType: self
]
