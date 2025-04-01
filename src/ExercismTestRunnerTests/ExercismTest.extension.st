Extension { #name : 'ExercismTest' }

{ #category : '*ExercismTestRunnerTests' }
ExercismTest class >> exTonelExtensionFilename [

	^ ClassDescription exTonelExtensionFilenameFor: self name 
]

{ #category : '*ExercismTestRunnerTests' }
ExercismTest class >> exTonelSourceFilename [

	^ ClassDescription exTonelClassFilenameFor: self exercise exerciseClassName 
]

{ #category : '*ExercismTestRunnerTests' }
ExercismTest class >> exTonelTestFilename [

	^ ClassDescription exTonelClassFilenameFor: self name 
]

{ #category : '*ExercismTestRunnerTests' }
ExercismTest class >> exampleDirName [

	^ self exercise exerciseClassName asKebabCase
]

{ #category : '*ExercismTestRunnerTests' }
ExercismTest class >> exampleSolutionExtensionSourceCode [
	
	"No estension methods by default"
	^ ''
]

{ #category : '*ExercismTestRunnerTests' }
ExercismTest class >> exampleSolutionSourceCode [
	
	"No solution class by default"
	^ ''
]

{ #category : '*ExercismTestRunnerTests' }
ExercismTest class >> exampleTestCasesSourceCode [ 
	
	"No test class by default"
	^ ''
]

{ #category : '*ExercismTestRunnerTests' }
ExercismTest class >> prepareExampleSolutionSourceCode [

" this is used for generating STON representation of MCSnapshot, that can be used to generate solution of example (golden test) - this is used for serialized version of source code to be exported in Tonel format"
| solutionClass|

	solutionClass  := Object << (self exercise exerciseClassName)
	slots: {};
	package: self package name asString;
	install.

	solutionClass compile: ('exerciseMethodA
	^ $A').
	solutionClass compile: ('exerciseMethodB
	^ $B').	
	solutionClass compile: ('exerciseMethodC
	^ $C').

	^ TonelWriter sourceCodeOf: solutionClass.
]

{ #category : '*ExercismTestRunnerTests' }
ExercismTest class >> prepareExampleTestCasesSourceCode [

" this is used for generating STON representation of MCSnapshot for desired test class (subclass of ExercismTest), that can be used to generate solution of example (golden test). It serves as serialized version of source code in ExercismTest>>exampleTestCasesSourceCode"
|testClass solutionClassName|

	testClass := self.
	solutionClassName := self exercise exerciseClassName.

	testClass compile: ('testExerciseMethodA
	self assert: {1} new exerciseMethodA equals: $A' format: {solutionClassName}).
	testClass compile: ('testExerciseMethodB
	self assert: {1} new exerciseMethodB equals: $B' format: {solutionClassName}).	
	testClass compile: ('testExerciseMethodC
	self assert: {1} new exerciseMethodC equals: $C' format: {solutionClassName}).

	^ TonelWriter sourceCodeOf: testClass.
]
