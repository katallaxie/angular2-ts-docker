# CI/IDE Docker for angular2-ts generator

This docker is intended to be used along with [generator-angular2-ts](https://github.com/katallaxie/generator-angular2-ts).

## Build

You can build the docker image by running

```
npm run build
```

## Running

You have to map your `[app]` directory into the docker at start.

```
docker run -it -v [app]:/app -e USER_ID=$(id -u) --rm -p 8080:8080 angular2-ts-docker
```

You can then access the app in your browser via `[docker]:8080`.
