#!/bin/bash

# Função para atualizar o sistema
update_system() {
    echo "Iniciando atualização do sistema..."
    sudo apt-get update
    sudo apt-get upgrade -y
    sudo apt-get dist-upgrade -y
    sudo apt-get autoremove -y
    sudo apt-get autoclean
    echo "Atualização do sistema concluída."
}

# Executa a atualização do sistema
update_system
