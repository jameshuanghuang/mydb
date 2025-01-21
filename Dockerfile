FROM postgres:16-alpine

ENV POSTGRES_USER=myuser
ENV POSTGRES_PASSWORD=mypassword
ENV POSTGRES_DB=mydb

COPY init-scripts/ /docker-entrypoint-initdb.d/

EXPOSE 5432