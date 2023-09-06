#! /bin/bash

add_user_group(){
        sudo usermod -a -G $2 $1
        sudo usermod -a -G $2 $3
}


change_script_permissions(){
        sudo chown :"$1" Script_1.sh
}



read -p "Ingrese el nombre de un nuevo usuario: " nombre_usuario

lista_usuarios="$(cat /etc/passwd | awk -F: '{print $1}')"

for user in $lista_usuarios; do
        if [ $nombre_usuario = "$user" ];then
                echo "el usuario $user ya existe"
                nombre_usuario1=$user
                break
        fi
done
if [ $nombre_usuario != "$nombre_usuario1" ];then
        sudo useradd "$nombre_usuario"
fi

read -p "ingrese el nombre de un nuevo grupo: " nombre_grupo

lista_grupos="$(cat /etc/group | awk -F: '{print $1}')"

for group in $lista_grupos; do
        if [ $nombre_grupo = "$group" ];then
                echo "el grupo $group ya existe"
                nombre_grupo1=$group
                break
        fi
done
if [ $nombre_grupo != "$nombre_grupo1" ];then
        sudo groupadd "$nombre_grupo"
fi

default_user="caleb"

add_user_group $nombre_usuario $nombre_grupo $default_user
change_permissions $nombre_grupo



