#!/bin/bash

function start_up() {
    fish
}

start_up; 


export PATH="$HOME/.poetry/bin:$PATH"
alias startcambly="cd ~/cambly/Cambly-Backend && heroku local -f Procfile.local"

