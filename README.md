# Docker CLI plugins for [`cas`](https://cas.codenotary.com)
Docker CLI plugins for [cas](cas.codenotary.com) attestation platform.
These plugins integrate `cas` commands into `docker` CLI commands to simplify authentication and notarization.

**cas Docker CLI plugins** (cas) is a Docker client plugin allowing to authenticate (aka verify) and notarize (aka sign) Docker container images including SBOM (software bill of materials) for the [Community Attestation Service](https://cas.codenotary.com).  Requires to install the [cas binary](https://github.com/codenotary/cas/releases) and being cas logged in (cas login).
Project is written entirely in Bash.

[![](https://raw.githubusercontent.com/vchaindz/cas-docker-cli-plugins/main/casdocker.svg)](animation)


## Install

Docker CLI plugins are found in `~/.docker/cli-plugins` and names like `docker-<command>`.

You can download and install these as follows:

```bash
mkdir -p ~/.docker/cli-plugins
for cmd in docker-auth docker-authbom docker-notarize docker-notarizebom docker-untrust; do
    curl https://raw.githubusercontent.com/vchaindz/cas-docker-cli-plugins/main/$cmd \
        -o ~/.docker/cli-plugins/$cmd && \
        chmod +x ~/.docker/cli-plugins/$cmd
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


## Examples

make sure to log into cas before using the plugins
```bash
export CAS_API_KEY=<your API_KEY>
cas login
```

Trust the wordpress container image
```bash
docker notarize wordpress
```

Trust the wordpress container image and its dependencies
```bash
docker notarizebom wordpress
```

Untrust the wordpress container image
```bash
docker untrust wordpress
```

Authenticate the wordpress container image
```bash
docker auth wordpress
```

