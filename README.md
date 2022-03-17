# Ansible roles

В этом репозитории я складываю мои роли для Ansible

## 🛠 Список ролей
- `change-hostname` — меняет хостнейм на имя из инвентори
- `consul-template` — устанавливает на хост Consul и добавляет конфигурации для работы шаблонизатора (Consul-template)
- `docker` — устанавливает Docker на хост (версия и пользователи для группы указываются в `defaults`)
- `filebeat` — устанавливает Filebeat как systemd-сервис
- `logstash-exporter` — проверяет наличие Docker и запускает контейнер с Logstash-exporter (alxrem/prometheus-logstash-exporter)
- `openvpn-server` — устанавливает и настраивает OpenVPN сервер [WIP]
- `server-config` — первоначальная настройка сервера: создание пользователей, установка софта, настройка SSH

## 🖐 Порядок запуска

1. В директории `inventories` создать инвентори-файл аналогично примеру (.example файл)
2. Запустить плейбук:  
``ansible-playbook -i inventories docker.yml -l group1``