# rogeriopradoj/progit2 Docker Image

Docker Image to generate books (epub, mobi and pdf) from source of [progit2 repositories](https://github.com/progit/progit2).

It's appropriated either for English official repository as for the translations made via forks from the English official one.

## How to Use

```
$ cd PATH_PROGIT2_REPOSITORY

$ docker run -it --rm \
    -v `pwd`:/documents/ \
    rogeriopradoj/progit2
```

## Dockerfile

<https://github.com/progit2-pt-br/progit2/tree/master/docker>

## Maintainers

- [@rogeriopradoj](https://github.com/rogeriopradoj)
