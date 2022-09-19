FROM ubuntu:22.04
ENV DEBIAN_FRONTEND=noninteractive
RUN apt update && apt install -y ansible ansible-lint git
RUN groupadd --gid 1000 vscode && useradd --uid 1000 --gid 1000 -m vscode
USER vscode
