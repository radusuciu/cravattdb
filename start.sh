#!/bin/bash

PROJECT_HOME="/home/cravattdb/cravattdb"
# install requirements in virtual environment
cd "${PROJECT_HOME}" || exit
virtualenv --python=/usr/bin/python3.5 env
source env/bin/activate
pip install -r requirements.txt

# start celery daemon
celery -A cravattdb.auto.tasks worker --workdir="${PROJECT_HOME}" --loglevel=info --detach

# get client software
cd "${PROJECT_HOME}/cravattdb/static" || exit
npm install

# run the server
cd "${PROJECT_HOME}" || exit
flask db upgrade

if [[ -n $DEBUG && $DEBUG == true ]]; then
    flask run -h 0.0.0.0 --with-threads
else
    gunicorn --config=config/gunicorn.py cravattdb:app
fi
