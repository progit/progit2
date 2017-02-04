#!/usr/bin/env bash
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

cp $DIR/../Gemfile \
   $DIR/../docker/Gemfile
cp $DIR/start-container.sh \
   $DIR/../docker/start-container.sh

docker build \
    -t rogeriopradoj/progit2 \
    $DIR/../docker

rm $DIR/../docker/start-container.sh
rm $DIR/../docker/Gemfile
