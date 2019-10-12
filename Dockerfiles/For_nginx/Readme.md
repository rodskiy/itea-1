# Занятие #3. Вторая задача по теме docker

## Задание
Создать Dockerfile на базе nginx со своим index.html. С помощью entrypoint.sh добавить в конец строки index.html 
переменную окружения которая будет передаваться в docker run.

## Комментарии к результату
В каталоге itea-1/Dockerfiles/For_nginx находятся Dockerfile и entrypoint.sh. Результат проверялся следующими командами:
1. docker build -t testimage:latest .
2. docker run -e NAME=Pavel  -dp 8080:80 testimage
