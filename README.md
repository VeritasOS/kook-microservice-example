This is a sample project split into two pieces, each running in a docker container.

The frontend (a simple python flask app) runs in one container, while the backend (a redis database) runs in another.

To build and push it to the docker registry, use

```
# This script uses the env variables KOOK_REGISTRY and KOOK_REPOSITORY}
# to override push locations and tagging
./pushexternal.sh
```

To run, use:
```
./run.sh [d|docker|k|kubernetes]
```



### Naming
"Kook" is a slang term for a novice surfer - http://www.urbandictionary.com/define.php?term=kook
