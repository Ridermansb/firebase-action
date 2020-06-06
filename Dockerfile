FROM openjdk:8-jre@sha256:3b92ddf1617d90f81b0bfe5e41aa27b621c1cb856e67ae06605be2601404b10d

LABEL version="2.0.0"
LABEL repository="https://github.com/Ridermansb/firebase-action"
LABEL homepage="https://github.com/Ridermansb/firebase-action"
LABEL maintainer="Riderman <ridermansb@gmail.com>"

LABEL com.github.actions.name="GitHub Action with Firebase CLI and Java ready"
LABEL com.github.actions.description="Wraps the firebase-tools CLI to enable common commands."
LABEL com.github.actions.icon="package"
LABEL com.github.actions.color="gray-dark"

SHELL ["/bin/bash", "-o", "pipefail", "-c"]

RUN curl -sL https://deb.nodesource.com/setup_10.x | bash -
RUN apt-get update -qq && apt-get install -qq --no-install-recommends \
  nodejs \
  && rm -rf /var/lib/apt/lists/*

RUN npm install -g firebase-tools

COPY LICENSE README.md /
COPY "entrypoint.sh" "/entrypoint.sh"

ENTRYPOINT ["/entrypoint.sh"]
CMD ["--help"]
