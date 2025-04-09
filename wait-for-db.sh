#!/bin/bash
set -e

ENV=${ENV:-prod}

if [ "$ENV" = "test" ]; then
  echo "Entorno: TEST. Esperando a db-test:5433..."
  until pg_isready -h db-test -p 5433 > /dev/null 2>&1; do
    echo "Esperando a db-test..."
    sleep 2
  done
else
  echo "Entorno: PROD. Esperando a db:5432..."
  until pg_isready -h db -p 5432 > /dev/null 2>&1; do
    echo "Esperando a db..."
    sleep 2
  done
fi

echo "Base de datos disponible. Continuando..."
exec "$@"
