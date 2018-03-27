#!/bin/bash
docker login -u="$DOCKER_USER" -p="$DOCKER_PASSWORD"
docker build -t $TRAVIS_COMMIT .
docker tag $TRAVIS_COMMIT $DOCKER_USER/blog:$TRAVIS_BRANCH.$TRAVIS_COMMIT
docker push $DOCKER_USER/blog:$TRAVIS_BRANCH.$TRAVIS_COMMIT
if [[ $TRAVIS_BRANCH == 'master' ]]
then
  docker push $DOCKER_USER/blog:latest
fi