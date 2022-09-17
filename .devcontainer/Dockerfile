FROM python:3
RUN pip install ansible ansible-lint
RUN groupadd --gid 1000 vscode && useradd --uid 1000 --gid 1000 -m vscode
USER vscode
