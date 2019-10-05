FROM nginx

MAINTAINER Pavel Rodskiy <rodskiy@ukr.net>
#Для выполнения задания ps команда не нужна, понадобилась для уточнения PID запущенных процессов
RUN apt-get update && apt-get install --no-install-recommends --no-install-suggests -y procps && apt-get install tini

VOLUME /data

COPY entrypoint.sh entrypoint.sh

CMD /bin/bash entrypoint.sh 
