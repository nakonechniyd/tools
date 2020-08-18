FROM python:3.8-slim-buster

ARG USER_UID=1000
ARG USER_GID=1000
ARG USERNAME=vscode

RUN export DEBIAN_FRONTEND=noninteractive &&\
    apt-get update &&\
    apt-get install -y --no-install-recommends \
    sudo &&\
    groupadd --gid $USER_GID $USERNAME &&\
    useradd --uid $USER_UID --gid $USER_GID --create-home --home-dir /$USERNAME $USERNAME &&\
    echo $USERNAME ALL=\(root\) NOPASSWD:ALL > /etc/sudoers.d/$USERNAME &&\
    chmod 0440 /etc/sudoers.d/$USERNAME &&\
    apt-get autoremove -y &&\
    apt-get clean -y &&\
    rm -rf /var/lib/apt/lists/*

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
