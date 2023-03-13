#!/bin/bash

function start_up() {
    fish
}

start_up; 

alias startcambly="cd ~/cambly/Cambly-Backend && heroku local -f Procfile.local"

