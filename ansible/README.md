# Домашнее задание по Ansible. Родский Павел
## Задача
1. Создать ansible playbook для установки nginx. Конфиг файл
   передать через шаблон. Имя сервера нужно брать из
   переменных. Установить php и php-fpm. Вывести phpinfo()

2. Все это закомитить в GitHub и открыть пул реквест на
   Dgadavin

## Выполнение
Для выполнения задания подготовлен docker image с установленным ansible и две виртуалки в облаке Амазона.
Созданы файлы hosts, playbook и роли
Выполнены следуюие команды:
1. Проверка localhost и файлов роли 
   ansible local -m ping -i hosts --connection local
   ansible-playbook /homework/nginx.yml  -i /hosts --connection local --check

2. Выполнение сценария на localhost
   ansible-playbook /homework/nginx.yml  -i /hosts --connection local
   
3. Получение php-info
   ansible local -m shell -a "php -r 'phpinfo();'" --connection local -i /hosts

4. Проверка удаленных серверов из облака
   ansible AWS -m ping --private-key /ansible_test.pem -i /hosts

5. Выполнение playbook на удаленных серверах
   ansible-playbook /homework/remote_nginx.yml  -i /hosts -l AWS --private-key /ansible_test.pem

6. Получение php-info с удаленных серверов
   ansible AWS -m shell "php -r 'phpinfo();'" --private-key /ansible_test.pem

