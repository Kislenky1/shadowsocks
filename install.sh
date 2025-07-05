#!/bin/bash

if [ "$EUID" -ne 0 ]
  then echo "❌ Этот скрипт нужно запускать от root. Используй: sudo ./install.sh"
  exit
fi

echo "==============================="
echo " Установка Shadowsocks-libev"
echo "==============================="

# === Запрос пароля ===
while true; do
  read -p "Введите пароль для Shadowsocks: " SS_PASSWORD
  if [[ -z "$SS_PASSWORD" ]]; then
    echo "❌ Пароль не может быть пустым!"
  elif [[ "$SS_PASSWORD" =~ [[:space:]] ]]; then
    echo "❌ Пароль не должен содержать пробелов!"
  else
    break
  fi
done

# === Определяем IP сервера ===
SERVER_IP=$(curl -s ifconfig.me)

# === Обновляем систему ===
apt update && apt upgrade -y

# === Ставим shadowsocks-libev и ufw ===
apt install -y shadowsocks-libev ufw qrencode

# === Настройка UFW ===
ufw allow 8388/tcp
ufw allow 8388/udp
ufw --force enable

# === Создаём конфиг ===
cat > /etc/shadowsocks-libev/config.json <<EOF
{
    "server":"0.0.0.0",
    "mode":"tcp_and_udp",
    "server_port":8388,
    "local_port":1080,
    "password":"$SS_PASSWORD",
    "timeout":500,
    "method":"aes-256-gcm"
}
EOF
# === Перезапускаем сервис ===
systemctl restart shadowsocks-libev
systemctl enable shadowsocks-libev

# === ✅ Shadowsocks-libev статус: ===
systemctl status shadowsocks-libev --no-pager

# === Генерируем ссылку и QR ===
SS_URI="ss://$(echo -n "aes-256-gcm:${SS_PASSWORD}@${SERVER_IP}:8388" | base64 -w0)#MySSS"

echo ""
echo "==============================="
echo "🔗 Вот твоя Shadowsocks ссылка:"
echo "$SS_URI"
echo ""
echo "📱 QR-код для клиента:"
qrencode -t ansiutf8 "$SS_URI"
echo "==============================="
