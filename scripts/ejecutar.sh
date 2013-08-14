#! /bin/bash

# $1 es el .jar
# $2 es el ip destino
# $3 es el user
archivo=$1
ruta=$2
ipDestino=$3
usuario=$4
parametros=${@:5}

scp $ruta$archivo $usuario@$ipDestino:/home/$usuario/Desktop
ssh $usuario@$ipDestino -t "cd Desktop; java -jar $archivo $parametros"
