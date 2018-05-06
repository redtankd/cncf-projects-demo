# dockerfiles

## China's mirror for docker

~/.docker/daemon.json

```
{
  "debug" : true,
  "experimental" : true,
  "registry-mirrors" : [
    "https://registry.docker-cn.com"
  ]
}
```

## base image

`docker build -t redtankd/base base/`

`docker run -it --name base -h base redtankd/base fish`

`d start -i base`

## rust image

`docker build -t redtankd/rust rust/`

`docker run -it --name rust -h rust --security-opt seccomp=unconfined -v ~/dev/git:/root/dev/git redtankd/rust fish`