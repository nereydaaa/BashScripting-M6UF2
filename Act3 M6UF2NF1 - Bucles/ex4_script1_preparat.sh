# Elabora un script per jugar al joc de pedra, paper o tisores contra la màquina. L’usuari ha de tenir la possibilitat de tornar a jugar tants cops com vulgui.
#!/bin/bash

while true; do
  echo "Escull pedra, paper o tisores (o 'surt' per terminar)"
  read -r usuari

  # Verificar l'opció de l'usuari
  if [ "$usuari" = "surt" ]; then
      echo "¡Gràcies per jugar!"
      exit 0
  elif [[ "$usuari" != "pedra" && "$usuari" != "paper" && "$usuari" != "tisores" ]]; then
      echo "Opció incorrecta. Escull entre pedra, paper o tisores."
      continue
  fi

  # Màquina escull aleatòriament entre les tres opcions
  opcions=("pedra" "paper" "tisores")
  maquina=${opcions[$RANDOM % 3]}

  # Determinar el resultat del joc
  if [ "$usuari" = "$maquina" ]; then
      echo "¡Empat! Els dos heu escollit $usuari."
  else
    if [ "$usuari = "pedra" ]; then
      if [ "$maquina" = "paper" ]; then
        echo "Perds! La màquina ha escollit $maquina."
      else 
        echo "Guànyes! La màquina ha escollit $maquina."
      fi
    elif [ "$usuari = "paper" ]; then
      if [ "$maquina" = "tisores" ]; then
        echo "Perds! La màquina ha escollit $maquina."
      else 
        echo "Guànyes! La màquina ha escollit $maquina."
      fi
    else # "$usuari = "tisores"
      if [ "$maquina" = "pedra" ]; then
        echo "Perds! La màquina ha escollit $maquina."
      else 
        echo "Guànyes! La màquina ha escollit $maquina."
      fi
    fi
  fi
done
