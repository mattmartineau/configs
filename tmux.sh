#!/bin/bash

tmux new-session -e HOME=${PWD} -d -s matt_session

tmux attach -t matt_session

