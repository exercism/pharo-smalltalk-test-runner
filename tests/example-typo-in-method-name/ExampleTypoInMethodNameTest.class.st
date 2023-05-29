Class {
#name : #ExampleTypoInMethodNameTest,
#superclass : #ExercismTest,
#category : #'Exercise@ExampleTypoInMethodName'
}

{ #category : #'as yet unclassified' }
ExampleAllPassTest >> testExampleMethodA [
	self assert: ExampleTypoInMethodName new exerciseMethodA equals: $A
]
