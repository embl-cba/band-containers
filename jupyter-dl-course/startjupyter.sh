#!/bin/bash

jupyter lab --allow-root --NotebookApp.token='' &

sleep 2s
/usr/bin/firefox -new-window http://localhost:8888

