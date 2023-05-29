Class {
#name : #ExampleExtensionMethodTest,
#superclass : #ExercismTest,
#category : #'Exercise@ExampleExtensionMethod'
}

{ #category : #'as yet unclassified' }
ExampleExtensionMethodTest >> testStringExtensionSomethingReturned [
	self assert: String new somethingReturned equals: 'something returned'
]
