#! /bin/bash

ipDestino=$1
usuario=$2
proceso=$3


ssh $usuario@$ipDestino pkill $proceso