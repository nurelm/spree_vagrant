#!/usr/bin/env bash

## Change this to the name you'd like for your new Spree folder
SPREE_FOLDER=spree

## Aditional system tools
sudo apt-get update
sudo apt-get install -y git
sudo apt-get install -y nodejs
sudo apt-get install -y imagemagick
sudo apt-get install -y libsqlite3-dev sqlite3
sudo apt-get -y install autoconf bison build-essential libssl-dev libyaml-dev libreadline6-dev zlib1g-dev libncurses5-dev libffi-dev libgdbm3 libgdbm-dev

## Install rbenv and rbenv-build to manage ruby environment
su - vagrant -c "git clone https://github.com/sstephenson/rbenv.git ~/.rbenv"
su - vagrant -c "echo 'export PATH=\"~/.rbenv/bin:$PATH\"' >> ~/.bash_profile"
su - vagrant -c "echo 'eval \"\$(rbenv init -)\"' >> ~/.bash_profile"
su - vagrant -c "git clone https://github.com/sstephenson/ruby-build.git ~/.rbenv/plugins/ruby-build"

## Install Ruby
su - vagrant -c "rbenv install 2.2.2"
su - vagrant -c "rbenv global 2.2.2"
su - vagrant -c "rbenv rehash"

## Install Rails
su - vagrant -c "gem install rails -v 4.2.2"
su - vagrant -c "rbenv rehash"

## Install Spree gem
su - vagrant -c "gem install spree"
su - vagrant -c "rbenv rehash"

## Setup Spree app
su - vagrant -c "rm -rf /vagrant/spree"
su - vagrant -c "mkdir -p /vagrant/$SPREE_FOLDER"
su - vagrant -c "rails _4.2.2_ new /vagrant/$SPREE_FOLDER -s"
su - vagrant -c "spree install -A /vagrant/$SPREE_FOLDER"
su - vagrant -c "cd /vagrant/$SPREE_FOLDER; bundle install"
