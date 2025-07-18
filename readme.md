#  Shadowsocks Install Script

Простой автоматизированный скрипт для установки и настройки **Shadowsocks-libev** на сервере за пару минут.

---

##  Что делает этот скрипт?

-  Устанавливает **Shadowsocks-libev** и **UFW** (фаервол).
-  Настраивает конфигурацию с паролем, который вы задаёте сами.
-  Открывает нужные порты и включает фаервол.
-  Перезапускает и включает автозапуск Shadowsocks.
-  Автоматически создаёт **Shadowsocks URI-ссылку** и **QR-код** — сканируете и пользуетесь!

---

## ⚙ Что такое Shadowsocks?

[Shadowsocks](https://shadowsocks.org/) — это быстрый и безопасный прокси, который помогает защищает ваш трафик от перехвата.

---

#  Быстрый старт

## 1️  Клонируйте репозиторий

```bash
git clone https://github.com/Kislenky1/shadowsocks.git
cd shadowsocks
```
## 2  Сделайте скрипт исполняемым

```bash
chmod +x install.sh
```
## 3  Запустите скрипт от root

```bash
sudo ./install.sh
```
## 4  После установки

Скрипт выведет:

Готовую ss:// ссылку.

Готовый QR-код — отсканируйте его телефоном.

Просто добавьте эту ссылку в любое приложение:

[Nekoray](https://github.com/MatsuriDayo/nekoray)
[Hiddify](https://hiddify.com/)

##  Настройки по умолчанию

Порт сервера	| 8388
Шифрование	| aes-256-gcm
Пароль	        | Вы задаёте при установке
Протоколы	| TCP и UDP

##  Безопасность

 Не публикуйте конфиг с паролем!

 Меняйте пароль регулярно.

 Открывайте только нужные порты.
