# Python tools


## build image
```
docker build --file pytools.dockerfile --build-arg USER_UID=$(id -u) --build-arg USER_GID=$(id -g) --tag nakonechniyd/pytools:latest --tag nakonechniyd/pytools:3.8-v1 .
```

## shell scripts
```
copy ./bin/* $HOME/.local/bin/
```
