docker-py3cx
====

base from python:3.5.6

### 1. prepare oracle instantclient

download instantclient zip file from [oracle](https://www.oracle.com/technetwork/topics/linuxx86-64soft-092277.html?ssSourceSiteId=otncn).

unzip instantclient.zip to `instantclient` directory .

The `instantclient` looks like this.
```text
.
├── adrci
├── BASIC_README
├── genezi
├── libclntsh.so.11.1
├── libnnz11.so
├── libocci.so.11.1
├── libociei.so
├── libocijdbc11.so
├── ojdbc5.jar
├── ojdbc6.jar
├── uidrvci
└── xstreams.jar
```


### 2. run docker container for test

```bash

docker run -it --rm -v $(pwd)/instantclient:/data/instantclient bonashen/py3cx bash 

```


### 3. build custom image

Dockerfile looks like this.

```Dockerfile

FROM bonashen/py3cx

MAINTAINER yourname yourname@mail.com

COPY instantclient /data/instantclient

# copy python app code
COPY app /app

CMD ["python3"]


```


build custom image

```bash

docker build -t yourname/custom .

```

