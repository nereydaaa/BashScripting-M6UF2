# Ens han passat aquest script en què, malauradament, no hi ha cap mena de comentari afegit que expliqui què fa cadascuna de les funcions incloses. 
# Analitza’l, doncs, i afegeix els comentaris que siguin necessaris.
#!/bin/bash

# Definim una constant per a l'error d'ús
errors=7

# Funció que compara dos nombres i retorna el més gran
max_dos ( ) {
	# Els paràmetres $1 i $2 representen els dos nombres a comparar
	# Si els dos nombres són iguals
	if [ "$1" -eq "$2" ] ; then
		echo 'Iguals'
		exit 0
	# Si el primer nombre és major que el segon
	elif [ "$1" -gt "$2" ] ; then
		# Assignem el primer nombre a la variable ret_val
		ret_val=$1
	# Si el segon nombre és major que el primer
	else
		# Assignem el segon nombre a la variable ret_val
		ret_val=$2
	fi
}

# Funció que mostra un missatge d'error quan l'ús de l'script no és correcte
err_str ( ) {
	# Mostrem el missatge d'error i sortim de l'script amb el codi d'error definit
	echo "Ús: $0 <nombre1>  <nombre2>"
	exit $errors
}

# Assignem els arguments a variables
# num1 i num2 representen els dos nombres que es passaran a l'script
num1=$1
num2=$2

# Comprovem que el nombre d'arguments sigui correcte
# $# representa el nombre d'arguments passats a l'script
if [ $# -ne 2 ] ; then
	# Si el nombre d'arguments no és 2, cridem a la funció d'error
	err_str
# Comprovem que els arguments siguin nombres
elif [ `expr $num1 : '[0-9]*'` -eq ${#num1} ] ; then
	if [ `expr $num2 : '[0-9]*'` -eq ${#num2} ] ; then  
		# Si tots dos arguments són nombres, cridem a la funció max_dos
		max_dos $num1 $num2
		# Imprimim el valor retornat per la funció max_dos
		echo $ret_val
	else
		# Si algun dels arguments no és un nombre, cridem a la funció d'error
		err_str
	fi
else
	# Si algun dels arguments no és un nombre, cridem a la funció d'error
	err_str
fi

# Sortim de l'script amb el codi d'èxit
exit 0

