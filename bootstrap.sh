#!/usr/bin/env bash

## Change this to the name you'd like for your new Spree folder
SPREE_FOLDER=spree

## Aditional system tools
sudo apt-get install -y git
sudo apt-get install -y nodejs
sudo apt-get install -y imagemagick
sudo apt-get install -y libsqlite3-dev
sudo apt-get install -y sqlite3

## Install rbenv and rbenv-build to manage ruby environment
git clone https://github.com/sstephenson/rbenv.git ~/.rbenv
echo 'export PATH="$HOME/.rbenv/bin:$PATH"' >> ~/.bash_profile
echo 'eval "$(rbenv init -)"' >> ~/.bash_profile
export PATH="$HOME/.rbenv/bin:$PATH"
eval "$(rbenv init -)"
git clone https://github.com/sstephenson/ruby-build.git ~/.rbenv/plugins/ruby-build

## Install Ruby 2.1.0
rbenv install 2.1.0
rbenv global 2.1.0
rbenv rehash

## Install Rails 4.0.5
gem install rails -v 4.0.5
rbenv rehash

## Install Spree gem
gem install spree
rbenv rehash

## Setup Spree app
cd /vagrant
mkdir -p /vagrant/$SPREE_FOLDER
rails _4.0.5_ new /vagrant/$SPREE_FOLDER -s
spree install -A /vagrant/$SPREE_FOLDER
