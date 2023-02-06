FROM ghcr.io/ba-st/pharo-loader:v10.0.1 AS loader
RUN pharo metacello install github://exercism/pharo-smalltalk:main/releases/latest BaselineOfExercism --groups=mentor

FROM ghcr.io/ba-st/pharo:v10.0.1
COPY --from=loader /opt/pharo /opt/test-runner

COPY /bin /opt/test-runner/bin

WORKDIR /opt/test-runner
ENTRYPOINT [ "/opt/test-runner/bin/run.sh" ]
