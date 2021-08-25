# Роль Consul-template

## Как пользоваться?

 1. В общей папке host_vars создаем файл с хостнеймом машины
 2. Добавляем в него такие переменные:
   
  ```
  consul_template:
    prometheus:
      need: true
      script_needed: true
      consul_config_path: /configs/consul-templates/prometheus01.infra.puls.local/  prometheus.yml
      file_source: keyfile.tpl
      file_destination: /opt/prometheus/prometheus.yml
      script_command:
        - /root/promtool check config /opt/prometheus/prometheus.yml
        - if [ $? -eq 0 ]; then
        -     systemctl restart vmagent
        -   fi
  ```
  - `need` - необходимость ставить консул-темплейт
  -  `script_needed` - нужен ли запуск какого-либо скрипта при обновлении файла
  - `consul_config_path` - пусть к KV с конфигом
   - `file_destination` - куда положить конфиг на удаленной машине
   - `script_command` - построчный код скрипта для запуска

  3. Прокатываем плейбук с тэгом `consul-template`


4. Если нужно несколько файлов:

```
  consul_template:
    prometheus:
      need: true
      script_needed: true
      consul_config_path: /configs/consul-templates/prometheus01.infra.puls.local/  prometheus.yml
      file_source: keyfile.tpl
      file_destination: /opt/prometheus/prometheus.yml
      script_command:
        - /root/promtool check config /opt/prometheus/prometheus.yml
        - if [ $? -eq 0 ]; then
        -     systemctl restart vmagent
        -   fi
  
  
  
    nginx:
      need: true
      script_needed: true
      consul_config_path: /configs/consul-templates/prometheus01.infra.puls.local/nginx/  prometheus.conf
      file_source: keyfile.tpl
      file_destination: /etc/nginx/sites-enabled/prometheus.conf
      script_command:
        - sudo nginx -t && sudo service nginx reload

```