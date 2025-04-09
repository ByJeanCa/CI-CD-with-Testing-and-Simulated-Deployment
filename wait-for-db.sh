#!/bin/bash
set -e

# Default to 'prod' if ENV is not set
ENV=${ENV:-prod}

if [ "$ENV" = "test" ]; then
  echo "Entorno: TEST. Esperando a db-test:5433..."
  until nc -z db-test 5433; do
    echo "Esperando a db-test en el puerto 5433..."
    sleep 2
  done
else
  echo "Entorno: PROD. Esperando a db:5432..."
  until nc -z db 5432; do
    echo "Esperando a db en el puerto 5432..."
    sleep 2
  done
fi

echo "Base de datos disponible. Continuando..."
exec "$@"
