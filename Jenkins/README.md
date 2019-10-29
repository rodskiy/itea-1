#Домашнее задание #3 Jenkins

##Задача
1. Написать(DSL) джобу которая будет билдить докер имаджы с nginx и вашим кастомным index.html и сделать docker push в DockerHub.
2. Настроить webhook integration через ngrok. 
3. Все это закомитить в GitHub и открыть пул реквест на Dgadavin

##Последовательность команд для выполнения задания
1. Запуск сохраненного контейнера с пробросом сокета и исполняемого файла докера
   docker run -it -e JENKINS_USER=0 -v /var/run/docker.sock:/var/run/docker.sock -v $(pwd)/jenkins_home:/var/jenkins_home -v $(which docker):/usr/bin/docker -p 8100:8080 -p 50000:50000  -u root itea-jenkins:1.4 /bin/bash  

2. Внутри контейнера расшариваются права на сокет докера и запускается сервис jenkins
   chmod 777 /var/run/docker.sock 
   service jenkins start

3. Логинимся в веб-интерфейс jenkins устанавливаем DSL-плагин и создаем seed джобу с DSL скриптом itea_job_1. 

4. Создаем в jenkins global credentials для докерхаба и гитхаба. Билдим сид джобу, запускаем полученную тестовую джобу(предварительно проверить, что докерфайл лежит по нужному пути на гитхабе). В аккаунте докерхаба создается имедж rodskiy/devops_base (https://cloud.docker.com/u/rodskiy/repository/docker/rodskiy/devops_base)

5. Создаем ngrok туннель
   ngrok http 8100
или
   docker run -e TARGET_HOST=localhost -e TARGET_PORT=8080 --link compassionate_bartik:localhost gtriggiano/ngrok-tunnel

6. Настраиваем webhook на гитхабе (на jenkins пришлось отключить CSRF Protection и security, надеюсь к advanced курсу разберусь как это настроить корректно)

7. В джобе включаем GitHub hook trigger for GITScm polling и Poll SCM, настраиваем параметры Source Code Management. 
Примечание: webhook у меня срабатывает и получает 200 код ответа, но джоба при этом не запускается. Одновременно ее можно запустить вручную командой: 
 curl -v http://127.0.0.1:8100/git/notifyCommit?url=https://github.com/rodskiy/itea-1
А вот POST запрос уже не работает
 curl -vX POST http://127.0.0.1:8100/git/notifyCommit?url=https://github.com/rodskiy/itea-1
Хотя получаю тоже 200 ответ
