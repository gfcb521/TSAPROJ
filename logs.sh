
#!/bin/bash

LOG_FILE="access.log"


if [[ ! -f $LOG_FILE ]]; then
  echo "Arquivo de log '$LOG_FILE' não encontrado!"
  exit 1
fi

echo "Escolha uma opção para gerar o relatório:"
echo "1. Contar os IPs mais frequentes"
echo "2. Contar as URLs mais acessadas"
echo "3. Contar os códigos de status (200, 404, etc.)"
read -p "Digite sua escolha (1/2/3): " OPTION

case $OPTION in
  1)
    echo "IPs mais frequentes:"
    awk '{print $1}' "$LOG_FILE" | sort | uniq -c | sort -nr | head -10
    ;;
  2)
    echo "URLs mais acessadas:"
    awk '{print $7}' "$LOG_FILE" | sort | uniq -c | sort -nr | head -10
    ;;
  3)
    echo "Códigos de status mais frequentes:"
    awk '{print $9}' "$LOG_FILE" | sort | uniq -c | sort -nr | head -10
    ;;
  *)
    echo "Opção inválida!"
    exit 1
    ;;
esac

