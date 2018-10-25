FROM python:3.5.6

MAINTAINER bonashen  cn.tony@outlook.com

WORKDIR /app

ENV ORACLE_HOME /data/instantclient

ENV PATH $ORACLE_HOME:$PATH

ENV TNS_ADMIN $ORACLE_HOME/network/admin

ENV LD_LIBRARY_PATH $ORACLE_HOME:$LD_LIBRARY_PATH

ENV NLS_LANGE "SIMPLIFIED CHINESE_CHINA.ZHS16GBK"


RUN apt-get update\
   && apt-get install -y libaio1 \
   && rm -rf /var/lib/apt/lists/* \      
   && pip install cx_oracle \
   && pip install --upgrade pip


CMD ["python3"]
