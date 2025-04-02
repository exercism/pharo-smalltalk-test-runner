Class {
#name : #ExampleTypoInMethodNameTest,
#superclass : #ExercismTest,
#category : #'Exercise@ExampleTypoInMethodName'
}

{ #category : 'as yet unclassified' }
ExampleTypoInMethodNameTest class >> exercise [
	^ (ExercismExercise for: self)
		difficulty: 1;
		topics: #('introduction');
		yourself.
]

{ #category : #'as yet unclassified' }
ExampleTypoInMethodNameTest >> testExampleMethodA [
	self assert: ExampleTypoInMethodName new exerciseMethodA equals: $A
]
