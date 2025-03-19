#!/bin/bash

set -e

CONFIG_FILE="/etc/gitlab-runner/config.toml"

if [[ ! -f "${CONFIG_FILE}" ]]; then
  echo "Creando archivo de configuración vacío en ${CONFIG_FILE}..."
  mkdir -p $(dirname "${CONFIG_FILE}")
  touch "${CONFIG_FILE}"
fi

if gitlab-runner list 2>&1 | tee /tmp/runner_check.log; then
  if grep -q "Executor" /tmp/runner_check.log; then
    echo "El runner ya está registrado. Saltando el proceso de registro..."
  else
    if [[ -n "${GITLAB_RUNNER_TOKEN}" ]]; then
      echo "Registrando el runner en GitLab..."

      gitlab-runner register --non-interactive \
        --url "${CI_SERVER_URL}" \
        --registration-token "${GITLAB_RUNNER_TOKEN}" \
        --executor "docker" \
        --docker-image "alpine:latest" \
        --description "Docker Runner" \
        --tag-list "docker,ci" \
        --run-untagged="true" \
        --locked="false" \
        --docker-privileged="true" \
        --docker-volumes "/var/run/docker.sock:/var/run/docker.sock" \
        --docker-network-mode "${GITLAB_NETWORK_NAME}"

      echo "Registro completado. Configuración en ${CONFIG_FILE}:"
      cat "${CONFIG_FILE}"
    else
      echo "No se ha proporcionado un token de registro. Ejecutando el runner sin registrar..."
    fi
  fi
else
  echo "No se pudo obtener la lista de runners, asegurate de que el contenedor está corriendo correctamente."
fi

exec gitlab-runner run --user=gitlab-runner --working-directory=/home/gitlab-runner
