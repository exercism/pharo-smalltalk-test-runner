Class {
	#name : 'BaselineOfExercismTestRunner',
	#superclass : 'BaselineOf',
	#category : 'BaselineOfExercismTestRunner',
	#package : 'BaselineOfExercismTestRunner'
}

{ #category : 'private' }
BaselineOfExercismTestRunner class >> exerciseGoldenTestPackageNames [
	"Answer the list of exercise package names used for golden tests executed by Exercism's test runner"

	^ #('Exercise@ExampleAllFail' 'Exercise@ExampleAllPass' 'Exercise@ExampleAllRaiseError' 'Exercise@ExampleEmptySolutionClass' 'Exercise@ExampleEmptySolutionFile' 'Exercise@ExampleErrorFailPass' 'Exercise@ExampleExtensionMethod' 'Exercise@ExampleSyntaxError' 'Exercise@ExampleTypoInMethodName')
]

{ #category : 'baselines' }
BaselineOfExercismTestRunner >> baseline: spec [
	<baseline>
	spec
		for: #common
		do: [ self setExercismLogo.
			self setUpDependencies: spec.
			self setUpGoldenTestsFor: spec.
			spec
				package: 'ExercismTestRunner'
					with:
						[ spec requires: #('ExercismTools')];
				package: 'ExercismTestRunnerTests'
					with: [ spec requires: #('ExercismTestRunner' 'ExercismTests') ];
				group: 'default' with: #('ExercismTestRunner');
				group: 'testRunner' with: #('ExercismTestRunner');
				group: 'testRunnerTests' with: #('ExercismTestRunnerTests'), self class exerciseGoldenTestPackageNames
		]
]

{ #category : 'baselines' }
BaselineOfExercismTestRunner >> setUpDependencies:	spec [ 
	"Project depends on main Exercism repository classes"
	spec 
		baseline: 'Exercism'
 		with: [spec repository: 'github://exercism/pharo-smalltalk:main/releases/latest'].
]

{ #category : 'initialization' }
BaselineOfExercismTestRunner >> setUpGoldenTestsFor: spec [
	
	self class exerciseGoldenTestPackageNames 
		do:
			[ :name | spec package: name with: [ spec requires: #('ExercismTools') ] ]
]
