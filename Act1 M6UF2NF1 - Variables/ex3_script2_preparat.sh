
# Conscients del teu potencial programant scripts en Bash, els teus companys i companyes de l’Institut consideren que és necessari vital que els ajudis a 
# identificar en què consisteixen els paràmetres d’expansió i quines tasques ens faciliten aquests tipus de paràmetres dins de l’script següent.

# En què ens pot beneficiar l’ús dels paràmetres d’expansió? Quin ús els hi puc donar a l’hora de programar Bash scripts?

# Resposta: Els paràmetres d'expansió s'utilitzen per diferents utilitats com poden ser: la manipulació de cadenes de text, iteració a través d'arguments,
# gestió d'arxius i directoris, substitució de variables, control de flux, etc. Per tant, ens facilita la manipulació de dades i la creació d'scripts més 
# flexibles i eficients.

#!/bin/bash

CRACK=oriolorioloriol
echo CRCKMAQUINAFIERAJEFE=$CRACK
# Identifica què fa el paràmetre ##*
echo 'El resultat de ##*ori és' ${CRACK##*ori}
# Elimina la cadena més llarga des del primer ori que troba per la dreta

# Identifica què fa el paràmetre #*
echo 'El resultat of #*ori és' ${CRACK#*ori}
# Elimina la cadena més curta des del primer ori que troba per la esquerra

# Identifica què fa el paràmetre %% i/amb el * final
echo 'El resultat of %%ol* és' ${CRACK%%ol*}
# Elimina la cadena més llarga des del primer ol que troba per la esquerra

# Proposta de canvi del vostre company i veí Joel
# Identifica què fa el paràmetre % i/amb el * final
echo 'El resultat of %ori* és' ${CRACK%ori*}
# Elimina la cadena més curta des del primer ori que troba per la dreta
