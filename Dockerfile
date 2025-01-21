FROM postgres:16-alpine

ENV POSTGRES_USER=myuser
ENV POSTGRES_PASSWORD=mypassword
ENV POSTGRES_DB=mydb

COPY init-scripts/ /docker-entrypoint-initdb.d/
COPY init-scripts/postgresql.conf /etc/postgresql/postgresql.conf
COPY init-scripts/pg_hba.conf /etc/postgresql/pg_hba.conf

EXPOSE 5432