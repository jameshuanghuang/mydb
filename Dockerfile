FROM postgres:16-alpine

ENV POSTGRES_USER=myuser
ENV POSTGRES_PASSWORD=mypassword
ENV POSTGRES_DB=mydb

COPY bought_history.sql /docker-entrypoint-initdb.d/