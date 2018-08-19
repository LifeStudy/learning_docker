#!/bin/bash

rm -rf .cache .config .gnupg .pki .rpmdb
rm .bashrc my_cron_tasks.ini selectcomp.txt .sudo_as_admin_successful 

docker kill $(docker ps -q)
docker rm $(docker ps --filter=status=exited --filter=status=created -q)
docker rmi $(docker images -a -q)