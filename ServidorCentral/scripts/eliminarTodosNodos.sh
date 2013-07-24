#! /bin/bash

parametro=1
for parametros in ${@:1}
do
    if (($parametro == 1)) 
    then
        usuario=$parametros
    elif (($parametro == 2))
    then
        ip=$parametros
    elif (($parametro == 3))
    then
        proceso=$parametros     
        ssh $usuario@$ip -t "kill -9 $proceso"
        parametro=0    
    fi
        ((parametro++))        
done
