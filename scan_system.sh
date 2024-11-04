#!/bin/bash

# Função para matar o processo do freshclam
kill_freshclam() {
    echo "Matando o processo do freshclam..."
    sudo pkill -f freshclam
    if [ $? -eq 0 ]; then
        echo "Processo do freshclam morto com sucesso."
    else
        echo "Falha ao matar o processo do freshclam."
    fi
}

# Função para atualizar as definições de vírus
update_definitions() {
    echo "Atualizando as definições de vírus..."
    sudo freshclam
    if [ $? -eq 0 ]; then
        echo "Definições de vírus atualizadas com sucesso."
    else
        echo "Falha ao atualizar as definições de vírus."
        exit 1
    fi
}

# Função para escanear todos os diretórios no sistema
scan_system() {
    echo "Iniciando escaneamento do sistema..."
    sudo clamscan -r --infected --remove /
    if [ $? -eq 0 ]; then
        echo "Escaneamento do sistema concluído."
    else
        echo "Falha ao escanear o sistema."
    fi
}

# Executa as funções
kill_freshclam
update_definitions
scan_system
