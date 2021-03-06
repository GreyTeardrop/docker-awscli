#!/usr/bin/env bash

set -e
set -o pipefail

if [ $# -ne 1 ]
then
    echo "Requires single parameter: AWS CLI version"
    exit 1
fi

new_version="$1"

sed -i.bak "s/org\.label-schema\.version=\"[0-9.]*\"/org.label-schema.version=\"${new_version}\"/; s/awscli==[0-9.]* /awscli==${new_version} /" Dockerfile
rm Dockerfile.bak

IMAGE_NAME=awscli-test ./hooks/build
docker rmi awscli-test

git add Dockerfile
git commit --no-edit -m "Update AWS CLI version to ${new_version}"
git tag "${new_version}"
git push origin master "${new_version}"
