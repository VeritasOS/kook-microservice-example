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

docker stop kook-frontend
docker stop kook-db

docker rm kook-frontend
docker rm kook-db

# Run
docker run -d --name kook-db redis
docker run -d -p 5000:5000 --name kook-frontend --link kook-db:kook-db emjburns/kook-microservice-example
