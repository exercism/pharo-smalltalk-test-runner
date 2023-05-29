Class {
#name : #ExampleEmptySolutionClassTest,
#superclass : #ExercismTest,
#category : #'Exercise@ExampleEmptySolutionClass'
}

{ #category : #'as yet unclassified' }
ExampleEmptySolutionClassTest >> testExampleMethodA [
	self assert: ExampleEmptySolutionClass new exerciseMethodA equals: $A
]

{ #category : #'as yet unclassified' }
ExampleEmptySolutionClassTest >> testExampleMethodB [
	self assert: ExampleEmptySolutionClass new exerciseMethodB equals: $B
]

{ #category : #'as yet unclassified' }
ExampleEmptySolutionClassTest >> testExampleMethodC [
	self assert: ExampleEmptySolutionClass new exerciseMethodC equals: $C
]
