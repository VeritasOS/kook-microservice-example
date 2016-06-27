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

from flask import Flask, render_template, request, redirect, url_for
import os
import redis

app = Flask(__name__)


@app.route("/")
def index():
    return render_template('index.html', phrases=getWords())


@app.route("/words")
def getWords():
    r = getRedis()
    phrases = r.smembers("phrases")
    return phrases


@app.route("/addPhrase", methods=['POST'])
def addPhrase():
    r = getRedis()
    
    r.sadd("phrases", request.form['phrase'])
    return redirect(url_for('index'))


def getRedis():
	return redis.StrictRedis(host=os.environ['REDIS_MASTER_SERVICE_HOST'], decode_responses=True)
    # Uncomment to use with docker
	# return redis.StrictRedis(host=os.environ['KOOK_DB_PORT_6379_TCP_ADDR'], decode_responses=True)


if __name__ == "__main__":
    app.run(host="0.0.0.0")
