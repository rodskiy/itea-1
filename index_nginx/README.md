
# Запуск контейнера nginx с файлом index.htm можно выполнить командой:
# docker run -v <путь к каталогу с файлом index.htm>:/usr/share/nginx/html [-p <порт на хост машине>:80] [-name <имя контейнера>] nginx
Проверял такой командой:

docker run -v /home/pavel/itea-1/index_nginx/:/usr/share/nginx/html -p 8080:80 -d --name nginx_test nginx
