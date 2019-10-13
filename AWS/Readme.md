# Домашнее задание по AWS
Задача: 
1. Создать Инстанс. Прицепить к нему volume. Сделать снапшот этого volume. Увеличить его размер.
2. Создать IAM role с правами только на чтение S3 и прикрепить его к созданому выше инстансу.  
3. Создать AMI из работающего инстанса. Развернуть этот AMI в новый инстанс

## Создание инстанса и работа с volume
1. Залогинится на AWS, войти в сервис EC2. Войти в раздел Instance и нажать кнопку 'Launch instance'. В мастере выбрать параметры инстанса (скриншоты 1_createinstance, 3_createinstance). (Примечание не забыть выделить IP и в дефолтную security group добавить права на SSH доступ)

2. Создания образа тома. Зайти в раздел Volume в контексном меню volume-а выбрать пункт CreateImage. Результат - 5_volumesnapshot

3. Увеличение раздела тома. В разделе Volume в контекстном меню нужного тома выбрать опцию Modify volume и определить новый размер (увеличить с 8 до 10 Гб). Далее подключится по SSH к инстансу и выполнить следующие команды:
  Расширение раздела
    [ec2-user@ip-172-31-90-29 dev]$ sudo growpart /dev/xvda 1
    CHANGED: disk=/dev/xvda partition=1: start=4096 old: size=16773086,end=16777182 new: size=20967390,end=20971486

  Проверка
    [ec2-user@ip-172-31-90-29 dev]$ lsblk
    NAME    MAJ:MIN RM SIZE RO TYPE MOUNTPOINT
    xvda    202:0    0  10G  0 disk
    └─xvda1 202:1    0  10G  0 part /

  Расширение файловой системы
    [ec2-user@ip-172-31-90-29 dev]$ sudo resize2fs /dev/xvda1
    resize2fs 1.43.5 (04-Aug-2017)
    Filesystem at /dev/xvda1 is mounted on /; on-line resizing required
    old_desc_blocks = 1, new_desc_blocks = 1
    The filesystem on /dev/xvda1 is now 2620923 (4k) blocks long.

  Проверка
    [ec2-user@ip-172-31-90-29 dev]$ df -h
    Filesystem      Size  Used Avail Use% Mounted on
    devtmpfs        483M   60K  483M   1% /dev
    tmpfs           493M     0  493M   0% /dev/shm
    /dev/xvda1      9.8G  1.1G  8.7G  12% /

Конечный результат на скриншоте 7_modifyvolume

## Работа с IAM ролью
1. открыть сервис IAM

2. Зайти в раздел роли и нажать CreateRole

3. Выбрать сервис для применения роли - EC2

4. Создать новую политику (права чтения на сервисе S3, ресурсы - все). Скриншоты 8_newpolicy, 9_newpolicy.

5. Зайти в раздел Instances и прикрепить роль (скриншоты 11_AttacheRole, 12_AttacheRole)

## Работа с AMI
1. Создать образ (скриншоты 13_CreateAMI, 14_CreateImage)

2. Зайти в раздел AMI и запустить созданный образ (скриншоты 15_LaunchAMI, 16_LaunchAMI, 17_LaunchAMI)
