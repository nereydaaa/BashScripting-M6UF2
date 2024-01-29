:'
Realitza un script que mostri per pantalla les principals variables globals i tots els 
arguments del Shell, el valor retornat per la darrera funció o comanda i el PID de la Shell actual.
'
#!/bin/bash

echo "Variables globals:"
echo "-------------------"
echo "SHELL: $SHELL"
echo "DISPLAY: $DISPLAY"
echo "HOME: $HOME"
echo "PATH: $PATH"
echo "MANPATH: $MANPATH"
echo "PS1: $PS1"
echo "PS2: $PS2"
echo "USER: $USER"
echo "TERM: $TERM"
echo "PWD: $PWD"
echo "-------------------"

echo "Arguments Shell:"
echo "----------------"
echo "$@"
echo "----------------"

echo "Valor de sortida de l'última funció: $?"

echo "PID de la Shell actual: $$"
