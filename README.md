docker-py3cx
====

base from python:3.5.6

### 1. prepare oracle instantclient

download instantclient zip file from [oracle](https://www.oracle.com/technetwork/topics/linuxx86-64soft-092277.html?ssSourceSiteId=otncn).

unzip instantclient.zip to `instantclient` directory .

create `tnsnames.ora` in `instantclient/network/admin` directory.

this is example of `tnsnames.ora` file:

```text

ORCL =

(DESCRIPTION =

        (ADDRESS_LIST =

                  (ADDRESS = (PROTOCOL = TCP)(HOST = your oracle server ip or name )(PORT = 1521))

        )

        (CONNECT_DATA =

                (SERVICE_NAME = ORCL)

        )

)


```

### 2. run docker container for test

```bash

docker run -it --rm -v $(pwd)/instantclient:/data/instantclient bonashen/docker-py3cx bash 

```


### 3. build custom image

Dockerfile looks like this.

```Dockerfile

FROM bonashen/docker-py3cx

MAINTAINER yourname yourname@mail.com

COPY instantclient /data/instantclient

# copy python app code
COPY app /app

CMD ["python3"]


```


build custom image and run custom image.

if you use in production env, don't forgot modify `tnsnames.ora` file.