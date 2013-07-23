#! /bin/bash

ipDestino=$1
usuario=$2
proceso=$3


ssh $usuario@$ipDestino -t "kill -9 $proceso"