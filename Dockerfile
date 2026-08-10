# ИСПОЛЬЗУЕМ СТАБИЛЬНЫЙ ОБРАЗ UBUNTU
FROM ubuntu:22.04

# УСТАНАВЛИВАЕМ НЕОБХОДИМЫЕ СИСТЕМНЫЕ ПРОГРАММЫ
RUN apt-get update && apt-get install -y \
    curl \
    sudo \
    systemd \
    iptables \
    ca-certificates \
    && rm -rf /var/lib/apt/lists/*

# ИСПРАВЛЕНО: СКАЧИВАЕМ И ЗАПУСКАЕМ РЕАЛЬНЫЙ СКРИПТ УСТАНОВКИ 3X-UI
RUN bash <(curl -Ls https://githubusercontent.com) <<EOF
y
admin
admin12345
8080
EOF

# ОТКРЫВАЕМ ПОРТ (Для Render/Koyeb лучше использовать стандартный 8080)
EXPOSE 8080

# ЗАПУСКАЕМ ПАНЕЛЬ ПРИ СТАРТЕ СЕРВЕРА
CMD ["/usr/local/x-ui/x-ui", "run"]
