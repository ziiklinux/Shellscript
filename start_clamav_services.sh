#!/bin/bash

# Função para instalar o systemctl
install_systemctl() {
    echo "Instalando o systemctl..."
    sudo apt-get update
    sudo apt-get install -y systemd
    if [ $? -eq 0 ]; then
        echo "systemctl instalado com sucesso."
    else
        echo "Falha ao instalar o systemctl."
        exit 1
    fi
}

# Função para iniciar um serviço
start_service() {
    local service_name=$1
    echo "Iniciando o serviço $service_name..."
    sudo systemctl start $service_name
    if [ $? -eq 0 ]; then
        echo "Serviço $service_name iniciado com sucesso."
    else
        echo "Falha ao iniciar o serviço $service_name."
    fi
}

# Verifica se o comando systemctl está disponível
if ! command -v systemctl &> /dev/null
then
    echo "systemctl não está disponível. Tentando instalar..."
    install_systemctl
fi

# Lista de serviços do ClamAV
services=("clamav-daemon.service" "clamav-freshclam.service")

# Inicia cada serviço
for service in "${services[@]}"
do
    start_service $service
done

echo "Todos os serviços do ClamAV foram iniciados."
