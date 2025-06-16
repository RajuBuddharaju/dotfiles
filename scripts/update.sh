#!/bin/bash

sudo apt update
sudo apt full-upgrade -y
sudo flatpak update -y
sudo flatpak upgrade
brew update
brew upgrade

