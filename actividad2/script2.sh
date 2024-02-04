#!/bin/bash

# Leer la variable GITHUB_USER
read -p "Ingrese el nombre de usuario de GitHub: " GITHUB_USER

# Consultar la URL de GitHub API
API_URL="https://api.github.com/users/$GITHUB_USER"

echo "visitare: $API_URL"

JSON_RESPONSE=$(curl -s $API_URL)

# Extraer datos del JSON
USER_ID=$(echo $JSON_RESPONSE | jq -r '.id')
CREATED_AT=$(echo $JSON_RESPONSE | jq -r '.created_at')

# Crear mensaje de saludo
MESSAGE="Hola $GITHUB_USER. User ID: $USER_ID. Cuenta fue creada el: $CREATED_AT."


ECHO $MESSAGE

ECHO "fin del script"
# Crear el directorio de logs basado en la fecha
# LOG_DIR="/tmp/$(date +'%Y%m%d')"
# mkdir -p $LOG_DIR

# Crear el archivo de log
# LOG_FILE="$LOG_DIR/saludos.log"
# echo $MESSAGE > $LOG_FILE

# Imprimir mensaje en consola
# echo $MESSAGE

# Configurar el cronjob para ejecutar el script cada 5 minutos
# CRON_COMMAND="*/5 * * * * /ruta/del/script.sh"
# (crontab -l ; echo "$CRON_COMMAND") | crontab -
