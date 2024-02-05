#!/bin/bash

# Lee la variable USER_GITHUB
# read -p "Buscar usuario de GitHub: " USER_GITHUB

USER_GITHUB="agarcia17948"

# Consultar la URL de GitHub API
API_URL="https://api.github.com/users/$USER_GITHUB"
echo "visitare: $API_URL"
JSON_RESPONSE=$(curl -s $API_URL)

# Extraer datos del JSON
USUARIO=$(echo $JSON_RESPONSE | jq -r '.login')
ID=$(echo $JSON_RESPONSE | jq -r '.id')
CREADO=$(echo $JSON_RESPONSE | jq -r '.created_at')

# Crear mensaje de saludo
echo "Hola $USUARIO. User ID: $ID. Cuenta creada el: $CREADO."

# Crear el directorio de logs basado en la fecha
cadFecha=$(date +'%Y%m%d')
LOG_DIR="/tmp/$cadFecha"
mkdir -p $LOG_DIR

echo "escribiendo en el archivo log"
# Crear el archivo de log
LOG_FILE="$LOG_DIR/saludos.log"
echo " hola $USUARIO. User ID: $ID. Cuenta creada el: $CREADO." > $LOG_FILE

# echo "Guardando el mensaje en: $LOG_FILE"


# Configurar cronjob para ejecutar el script cada 5 minutos

(crontab -l ; echo "*/5 * * * * /home/agarcia/SO1_2024_clase/actividad2/script2.sh") | crontab -

echo "fin del script"
