## dockerized-chef-workstation

![](https://github.com/kodelint/dockerized-chef-workstation/actions/workflows/dockerfile-lint.yml/badge.svg)
![](https://github.com/kodelint/dockerized-chef-workstation/actions/workflows/build-and-push.yml/badge.svg)

`chef-workstation` docker image with base `ubuntu:18.04`. Comes with following pre-installed
 
- `git=1:2.17.1-1ubuntu0.12` 
- `graphviz=2.40.1-2` 
- `make=4.1-9.1ubuntu1` 
- `rsync=3.1.2-2.1ubuntu1.5` 
- `ssh=1:7.6p1-4ubuntu0.7` 
- `vim-tiny=2:8.0.1453-1ubuntu1.8` 
- `curl=7.58.0-2ubuntu3.19`

| **Component** | **Version** |
| --- | --- |
| `ubuntu` | `18.04`|
| `chefdk` | `20.10.168`|
| `awscli` | `latest`|
| `azureCli` | `latest`|
| `boto3` | `latest`|
| `python` | `3`|

This repo usage [hodolint](https://github.com/hadolint/hadolint) for `Dockefile` linting process. Any push the `main` branch will trigger [dockerfile-lint](https://github.com/kodelint/dockerized-chef-workstation/blob/main/.github/workflows/dockerfile-lint.yml). For ignore certain warning please use [.hodolint.yaml](https://github.com/kodelint/dockerized-chef-workstation/blob/main/.hadolint.yaml)

**GITHUB Repo:** [dockerized-chef-workstation](https://github.com/kodelint/dockerized-chef-workstation)