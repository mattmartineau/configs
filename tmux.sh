
export HOME=${PWD}

cd $HOME
tmux new-session -d -s matt_session

tmux attach -t matt_session

