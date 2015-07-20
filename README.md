# Spree Quickstart Vagrant

## Overview
[Spree Commerce](http://www.spreecommerce.com/) has built a Rails-based [open source e-commerce platform](http://github.com/spree/spree).

Developing Spree (and lots of other things) inside a [Vagrant](http://www.vagrantup.com) is nice in a lot of situations:

- Maybe you like to keep a tidy workstation and not install a bunch of junk in your OS that you know you will probably never remove.
- Maybe you are developing on a Windows machine that does not play well with many of the tools you need.
- Or maybe you like the [Vagrant Cloud](https://vagrantcloud.com/) ability to share an application you built on your dev Vagrant with anybody, even outside of your network.
- Perhaps you love the idea of developing and experimenting with wild abandon, knowing that you can blow up and recreate your dev environment at any time, on any machine.
- Or you are working in a team and do not relish the idea of spending an hour with every developer, every week, making sure you have the same dev environment.

Using nothing but [VirtualBox](http://www.virtualbox.org), [Vagrant](http://www.vagrantup.com) and
the 2 humble files in this repository, a nice isolated Spree development environment can be all yours.

## Installation
First, download and install [VirtualBox](http://www.virtualbox.org) and [Vagrant](http://www.vagrantup.com).

Then open up a terminal window and `cd` into the directory containing this README and the files Vagrantfile and bootstrap.sh:

    cd directory_containing_vagrantfile

Now grab copy of the Vagrant box that we'll use.  You'll only have to do this once, and it will grab an image of Ubuntu 14.04 for you to use anytime it pleases you. It will ask you what environment you're using, pick the option for VirtualBox.

    vagrant box add chef/ubuntu-14.04

Now fire up the vagrant. The next two words will start up the box you just downloaded and run the commands in bootstrap.sh within that box, which will grab and setup everything you need to run Spree on that vagrant:

    vagrant up

You may want to go have some coffee or maybe take a shower, as this will take a few minutes while it's loading and installing various packages.

## Basic Usage
While still in your terminal, inside the same directory you were in while installing, log into your new virtual machine (Windows users will be harassed about getting a version of ssh that works on the command line, do it!):

    vagrant ssh

Now you're logged into the new instance.  From here you'll just `cd` to where your Spree app lives and startup a rails server:

    cd /vagrant/spree
    rails s -b 0.0.0.0

Now just fire up the browser of your choice and take a peek at [http://localhost:3001](http://localhost:3001). The admin URL is [http://localhost:3001/admin/](http://localhost:3001/admin/) and the default user / pass is spree@example.com / spree123.

## Development
Back in your host operating system, notice that there is a new directory in the same directory as this README file called "spree".  This is the very same directory that your new vagrant sees, and any edits made from either within the vagrant or from your host operating system will be seen in both places. This means you can edit using any tools in your host OS that you please!

It's easy to tinker with exactly what gets installed, just edit the bootstrap.sh file.

## Further Documentation
- https://github.com/spree/spree
- http://docs.vagrantup.com/v2/getting-started/index.html
- https://www.virtualbox.org/wiki/End-user_documentation

## Credits
Tweet a shout out @nurelm to your friendly Spree / Rails enthusiasts at [NuRelm](http://www.nurelm.com) if this helped you out.
