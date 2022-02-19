# Docker CLI plugins for [`cas`](https://cas.codenotary.com)
Docker CLI plugins for [cas](cas.codenotary.com) attestation platform.
These plugins integrate `cas` commands into `docker` CLI commands to simplify authentication and notarization.

**cas Docker CLI plugins** (cas) is a Docker client plugin allowing to authenticate and notarize Docker container images including SBOM (software bill of materials) for the [Community Attestation Service](https://cas.codenotary.com).  Requires to install the [cas binary](https://github.com/codenotary/cas/releases) and being cas logged in (cas login).
Project is written entirely in Bash.

## Install

Docker CLI plugins are found in `~/.docker/cli-plugins` and names like `docker-<command>`.

You can fetch and install these as follows:

```bash
mkdir -p ~/.docker/cli-plugins
for cmd in docker-auth docker-authbom docker-notarize docker-notarizebom docker-untrust; do
    curl https://raw.githubusercontent.com/vchaindz/cas-docker-cli-plugins/main/${cmd}.sh \
        -o ~/.docker/cli-plugins/${cmd} && \
        chmod +x ~/.docker/cli-plugins/${cmd}
done
```

## Run

cas plugins should be automatically detected by the Docker client and support:

### `docker auth <img>`

authenticate the container image and return the trust level

### `docker authbom <img>`

authenticate the container image including SBOM (Software Bill of Materials) and return the trust level

### `docker notarize <img>`

notarize the container image on the cas.codenotary.com platform

### `docker notarizebom <img>`

notarize the container image including SBOM (Software Bill of Materials) on the cas.codenotary.com platform

### `docker untrust <img>`

untrust the container image on the cas.codenotary.com platform

