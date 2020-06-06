FROM ubuntu:latest

LABEL version="2.0.3"
LABEL repository="https://github.com/Ridermansb/firebase-action"
LABEL homepage="https://github.com/Ridermansb/firebase-action"
LABEL maintainer="Riderman <ridermansb@gmail.com>"

LABEL com.github.actions.name="GitHub Action with Firebase CLI and Java ready"
LABEL com.github.actions.description="Wraps the firebase-tools CLI to enable common commands."
LABEL com.github.actions.icon="package"
LABEL com.github.actions.color="gray-dark"

SHELL ["/bin/bash", "-o", "pipefail", "-c"]

RUN apt-get update -qq && apt-get install -qq --no-install-recommends \
  nodejs \
  curl \
  && rm -rf /var/lib/apt/lists/*

RUN curl -sL https://deb.nodesource.com/setup_10.x | bash -
RUN npm install -g firebase-tools

COPY LICENSE README.md /
COPY "entrypoint.sh" "/entrypoint.sh"

ENTRYPOINT ["/entrypoint.sh"]
CMD ["--help"]
