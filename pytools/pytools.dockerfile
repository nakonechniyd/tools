FROM python:3.8-slim-buster

ARG USER_UID=1000
ARG USER_GID=1000
ARG USERNAME=vscode

RUN groupadd --gid $USER_GID $USERNAME &&\
    useradd --uid $USER_UID --gid $USER_GID --create-home --home-dir /$USERNAME $USERNAME

USER $USERNAME

ENV PATH="/${USERNAME}/.local/bin:${PATH}"

RUN python -m pip --disable-pip-version-check --no-cache-dir install --user pipx &&\
    pipx install flake8 &&\
    pipx install black &&\
    pipx install bandit &&\
    pipx install mypy &&\
    pipx install pylint &&\
    pipx install pycodestyle &&\
    pipx install pydocstyle
