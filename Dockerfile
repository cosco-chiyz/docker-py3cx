FROM python:3.5.6

MAINTAINER bonashen  cn.tony@outlook.com

WORKDIR /app

ENV ORACLE_HOME /data/instantclient_11_2

ENV PATH $ORACLE_HOME:$PATH

ENV TNS_ADMIN $ORACLE_HOME/network/admin

ENV LD_LIBRARY_PATH $ORACLE_HOME:$LD_LIBRARY_PATH

ENV NLS_LANGE "SIMPLIFIED CHINESE_CHINA.ZHS16GBK"

COPY instantclient_11_2 /data/instantclient_11_2


RUN apt-get update\
   && apt-get install -y libaio1 \
   && rm -rf /var/lib/apt/lists/* \   
   && ln -s $ORACLE_HOME/libclntsh.so.11.1 $ORACLE_HOME/libclntsh.so \
   && pip install cx_oracle \
   && pip install --upgrade pip


CMD ["python3"]
