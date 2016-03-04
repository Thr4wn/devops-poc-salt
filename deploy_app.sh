#!/bin/bash

url=https://github.com/Thr4wn/devops-poc-app.git

cd /var/
if [ ! -d ./app ]; then
  echo no exist
  git clone $url app
  cd app
else
  echo exist
  cd app
  git pull $url
fi

rsync -rp --delete-during Gizmo/ /srv/app/
