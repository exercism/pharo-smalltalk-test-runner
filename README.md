# Exercism's Pharo Smalltalk Test Runner

[![Build & Unit tests](https://github.com/exercism/pharo-smalltalk-test-runner/actions/workflows/ci.yml/badge.svg)](https://github.com/exercism/pharo-smalltalk-test-runner/actions/workflows/ci.yml)

This is [Exercism's test runner](https://github.com/exercism/v3-docs/tree/master/anatomy/track-tooling/test-runners#test-runners) for the [Pharo Smalltalk track](https://exercism.org/tracks/pharo-smalltalk).  
>__Note:__ Pharo track Test Runner used on Exercism website (Docker image build) should be in sync with code changes in this repository - commit: [3efa3e7](https://github.com/exercism/pharo-smalltalk-test-runner/pull/38/commits/3efa3e763580b9666cbfa3771453d3c34c225655)

## Prepare Pharo image for Test Runner
If you'd use test runner from scripts using Docker, there is no need to prepare Pharo image, since `bin/run-in-docker.sh` and `bin/run-tests-in-docker.sh` will prepare Pharo image for you (specified in Dockerfile).  
__BUT:__ If you want to test locally without using Docker, you should use following:
- 1st command downloads Pharo 11 (latest) including VM.  
- 2nd command installs test runner into image.  
- 3rd command runs test runner with given input parameters.  
```
curl https://get.pharo.org | bash 
./pharo Pharo.image metacello install github://exercism/pharo-smalltalk:main/releases/latest BaselineOfExercism --groups=testRunner
./pharo Pharo.image clap testExercise slug-name pathToDirWithSolution pharoOutputDirectory
```

>__Note__: Instead of `testRunner` group (2nd command above) you could load ` 'testRunnerTests` to load Test Runner project baseline with tests, in case you want to run example tests.
## Executing the Test Runner

The test runner requires 3 parameters:
- `slug-name` Exercise slug-name (name of exercise in kebap case format)
- `input directory` Path to existing directory containing the solution to be tested (one or more .st files)
- `output directory` Existing directory path for the test result output (results.json)

### Running the Test Runner locally

```bash
./bin/run.sh two-fer ~/exercises/two-fer /tmp/result
```
>__Note__: As prerequisite, you must have Pharo VM with Pharo.image (with Test Runner installed) in working directory, otherwise runner script won't able to run Pharo locally (see [how to prepare image](#prepare-pharo-image-for-test-runner)).

### Running the Test Runner from Pharo CLI
Pharo has its own command line interface to handle arguments, so you can run Test Runner directly from Pharo image using command line (same prerequisite as above):
```bash
./pharo --headless Pharo.image clap testExercise slug-name pathToDirWithSolution pharoOutputDirectory
```

### Running Test Runner in Docker

A docker container is used to run the Test Runner against submitted exercises. As prerequisite, you'd need have Docker installed on your host OS (local) environment. To build the container locally, execute the following from the repository `root` directory:

```bash
docker build --rm --no-cache --load -t exercism/pharo-smalltalk-test-runner .
```

If you want to run example exercises (in `tests` directory) you should used different build argument, in order to prepare Pharo image with sample examples/exercises:

```bash
docker build --build-arg GROUP_NAMES=testRunnerTests --rm --no-cache --load -t exercism/pharo-smalltalk-test-runner .
```

Run the test runner in the container by passing in the slug name, and absolute paths to the exercise (solution) and a writeable output directory. These directories should be mounted as volumes (see also `bin/run-in-docker.sh`):
```
docker run \
    --read-only \
    --network none \
    --mount type=bind,src=$PWD/$2,dst=/solution \
    --mount type=bind,src=$PWD/$3,dst=/output \
    exercism/pharo-smalltalk-test-runner $1 /solution/ /output/
```
