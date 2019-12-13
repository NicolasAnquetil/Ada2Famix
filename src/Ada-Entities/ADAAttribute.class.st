"
An ADAAttribute represents an Ada attribute, e.g.
Instances of this class represent built-in functions attached to ADAType instances to support ADA ""attributes"",
for instance :
	subtype t_code is INTEGER range 0 .. 65536;
  	subtype t_range  is INTEGER range t_code'first + 1 .. t_code'last;
where
	'first and 'last are attributes  of t_code
These can be seen as built-in methods of types.

See https://en.wikibooks.org/wiki/Ada_Programming/Attributes

parentType
	- return the type that implements the Ada attribute

"
Class {
	#name : #ADAAttribute,
	#superclass : #ADASubprogram,
	#instVars : [
		'parentType'
	],
	#category : #'Ada-Entities-FAMIX'
}

{ #category : #testing }
ADAAttribute >> isAttribute [
	
	^true
]

{ #category : #accessing }
ADAAttribute >> parentType [
	<MSEProperty: #parentType type: #ADAContainerEntity opposite: #attributes>
	<MSEComment: 'The entity owning this attribute'>

	^ parentType
]

{ #category : #accessing }
ADAAttribute >> parentType: aType [

	parentType := FMMultivalueLink on: self
					update: #attributes
					from: self parentType
					to: aType
]
