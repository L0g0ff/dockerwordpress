# Powerdock

A personal containerized Powershell learning and development environment.

# Motivation

Install, explore, test, validate and break stuff without worrying about damaging anything other than the environment inside the container.

# prerequisites

* [Docker](https://docs.docker.com/get-docker/)
* [Docker compose](https://docs.docker.com/compose/install/)
* [VScode](https://code.visualstudio.com/download)
* [VScode remote containers extension](https://marketplace.visualstudio.com/items?itemName=ms-vscode-remote.remote-containers)

# Installation

```
git clone https://github.com/michael-akkermans/powerdock.git
cd powerdock
docker-compose up -d
```

# How to use?

Attach with shell:

```
docker exec -it wordpress /bin/bash
```

# Bring him down

```
docker compose down
```

Attach with VScode:

Read this [how to](https://code.visualstudio.com/docs/remote/containers-tutorial).

* Attach VScode to running container
* Select File->Option->Open Workspace
* Select /development/workspace/default.code-workspace
