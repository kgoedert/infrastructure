#!/bin/bash
set -e

psql -v ON_ERROR_STOP=1 --username "$POSTGRES_USER" --dbname "$POSTGRES_DB" <<-EOSQL
    CREATE USER crm WITH PASSWORD 'crm';
    CREATE DATABASE crm;
    CREATE DATABASE crm_test;
    GRANT ALL PRIVILEGES ON DATABASE crm_test TO crm;
    GRANT ALL PRIVILEGES ON DATABASE crm TO crm;

EOSQL