FROM ghcr.io/ba-st/pharo-loader:v10.0.1 AS loader
ARG GROUP_NAMES=testRunner
RUN pharo metacello install github://bajger/pharo-smalltalk:453-Build-Test-Runner/dev/src BaselineOfExercism --groups=$GROUP_NAMES
RUN pharo eval --save "NoChangesLog install. \
    NoPharoFilesOpener install. \
    PharoCommandLineHandler forcePreferencesOmission: true. \
    EpMonitor reset. "
FROM ghcr.io/ba-st/pharo:v10.0.1
COPY --from=loader /opt/pharo /opt/test-runner

COPY /bin /opt/test-runner/bin

WORKDIR /opt/test-runner
USER root
RUN rm /opt/test-runner/Pharo.changes
USER pharo
ENTRYPOINT [ "/opt/test-runner/bin/run.sh" ]
