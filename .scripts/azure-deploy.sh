#!/bin/bash

### STYLES
set +e
set -o noglob

bold="\e[1m"
dim="\e[2m"
underline="\e[4m"
blink="\e[5m"
reset="\e[0m"
red="\e[31m"
green="\e[32m"
blue="\e[34m"

h1() {
  printf "\n${bold}${underline}%s${reset}\n" "$(echo "$@" | sed '/./,$!d')"
}
h2() {
  printf "\n${bold}%s${reset}\n" "$(echo "$@" | sed '/./,$!d')"
}
info() {
  printf "${dim}➜ %s${reset}\n" "$(echo "$@" | sed '/./,$!d')"
}
success() {
  printf "${green}✔ %s${reset}\n" "$(echo "$@" | sed '/./,$!d')"
}
error() {
  printf "${red}${bold}✖ %s${reset}\n" "$(echo "$@" | sed '/./,$!d')"
}
warnError() {
  printf "${red}✖ %s${reset}\n" "$(echo "$@" | sed '/./,$!d')"
}
warnNotice() {
  printf "${blue}✖ %s${reset}\n" "$(echo "$@" | sed '/./,$!d')"
}
note() {
  printf "\n${bold}${blue}Note:${reset} ${blue}%s${reset}\n" "$(echo "$@" | sed '/./,$!d')"
}

### STYLES END

### SETUP
ROOT_PROJECT="$(pwd)"
h1 "RUNNING AZURE RELEASE"
info "WORKDIR ($ROOT_PROJECT)"

### RUNNING SCRIPTS
h1 "RUNNING AFTERINSTALL HOOKS"
bash "$ROOT_PROJECT/.scripts/after-install.sh"
success "SUCCESSFULLY RUN AFTERINSTALL HOOKS"

h1 "RUNNING APPLICATIONSTART HOOKS"
bash "$ROOT_PROJECT/.scripts/application-start.sh"
success "SUCCESSFULLY RUN APPLICATIONSTART HOOKS"

h1 "RUNNING VALIDATESERVICE HOOKS"
bash "$ROOT_PROJECT/.scripts/cleanup.sh"
success "SUCCESSFULLY RUN VALIDATESERVICE HOOKS"

### CLEANUP
cd "$ROOT_PROJECT"
rm -rf ./*
info "CURRENT DIR ($(pwd))"
ls -a