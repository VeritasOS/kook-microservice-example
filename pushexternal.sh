# Copyright 2016 Veritas Technologies LLC.
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#    http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

#!/bin/bash

PRJ="$(cd `dirname $0`; pwd)"

REGISTRY=${KOOK_REGISTRY:=emjburns}
REPOSITORY=${KOOK_REPOSITORY:=kook-microservice-example}

# build and push to artifactory
docker build --no-cache -t ${REGISTRY}/${REPOSITORY} -f ${PRJ}/Dockerfile.dist .
docker push ${REGISTRY}/${REPOSITORY}:latest
