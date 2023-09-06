#!/bin/bash
text_converter(){

        if [ "${1:0:1}" == 'r' ]; then
                text1="read "
        else
                text1=""
        fi

        if [ "${1:1:1}" == 'w' ]; then
                text2="write "
        else
                text2=""
        fi

        if [ "${1:2:1}" == 'x' ]; then
                text3="execute"

        else
                text3=""
        fi

        echo "$text1$text2$text3"

}

get_permissions_verbose(){
        permissions=$1
        user="${permissions:1:3}"
        group="${permissions:4:3}"
        others="${permissions:7:3}"

        echo "Users: $(text_converter $user)"
        echo "Group: $(text_converter $group)"
        echo "Others: $(text_converter $others)"

        }

read -p "Porfavor ingrese el nombre de un archivo: " file

if [ -e $file ];then
        permission_list="$(stat -c %A $file)"
        get_permissions_verbose $permission_list
else
        echo "Error: El archivo no existe"
fi	
