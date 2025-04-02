Class {
#name : #ExampleExtensionMethodTest,
#superclass : #ExercismTest,
#category : #'Exercise@ExampleExtensionMethod'
}

{ #category : 'as yet unclassified' }
ExampleExtensionMethodTest class >> exercise [
	^ (ExercismExercise for: self)
		difficulty: 1;
		topics: #('introduction');
		yourself.
]

{ #category : #'as yet unclassified' }
ExampleExtensionMethodTest >> testStringExtensionSomethingReturned [
	self assert: String new somethingReturned equals: 'something returned'
]
