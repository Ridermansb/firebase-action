FROM node:10-slim

LABEL version="2.0.4"
LABEL repository="https://github.com/Ridermansb/firebase-action"
LABEL homepage="https://github.com/Ridermansb/firebase-action"
LABEL maintainer="Riderman <ridermansb@gmail.com>"

LABEL com.github.actions.name="GitHub Action with Firebase CLI and Java ready"
LABEL com.github.actions.description="Wraps the firebase-tools CLI to enable common commands."
LABEL com.github.actions.icon="package"
LABEL com.github.actions.color="gray-dark"

SHELL ["/bin/bash", "-o", "pipefail", "-c"]

ENV JAVA_HOME="/opt/jdk"
ENV PATH="${PATH}:${JAVA_HOME}/bin"

RUN apt-get update && apt-get install -y wget
RUN npm install -g firebase-tools
RUN mkdir -p ${JAVA_HOME} && wget -qO- https://github.com/AdoptOpenJDK/openjdk11-binaries/releases/download/jdk-11.0.6%2B10/OpenJDK11U-jdk_x64_linux_hotspot_11.0.6_10.tar.gz | tar xvz -C ${JAVA_HOME} --strip-components=1

RUN npm install -g firebase-tools

COPY LICENSE README.md /
COPY "entrypoint.sh" "/entrypoint.sh"

ENTRYPOINT ["/entrypoint.sh"]
CMD ["--help"]
