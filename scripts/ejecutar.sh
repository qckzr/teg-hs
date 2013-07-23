#! /bin/bash

# $1 es el .jar
# $2 es el ip destino
# $3 es el user
archivo=$1
ipDestino=$2
usuario=$3
parametros=${@:4}

scp $archivo $usuario@$ipDestino:/home/$usuario/Desktop
ssh $usuario@$ipDestino 'cd Desktop; java -jar /home/$3/Desktop/$1 $parametros'
