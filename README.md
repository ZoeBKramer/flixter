Click [here](https://flixter-zoe-kramer.herokuapp.com/) to visit Flixter. 

# Flixter

### Overview

A web application, built with Ruby on Rails, that uses the Stripe API to allow users to enroll in courses. Users are also able to upload their own courses/lessons as well as photos and videos. This application utilizes jQuery so users are able to rearrange their courses without having to refresh the page. 

### Code Structure

**Models** - 

**Views** - 

**Controllers** - 

**Gemfiles** -

# Set Up Vagrant

Click [here](https://github.com/university-bootcamp/coding-environment/blob/master/windows-vagrant.md) to find the instructions for setting up Vagrant.

### Vagrant

Between each of the coding sessions you do, especially if you restart your machine, you will need to run the following command to start your vagrant environment prior to connecting:

`vagrant up`

When this command completes, run the vagrant ssh command to log in to Vagrant.

After this completes, you will be taken to a coding environment inside your virtual machine, and your terminal should contain the green [ENV].

Running the `killall ruby` command in your terminal should quit all running Rails servers.

**To ensure that your server is not running** -— If you visit the URL [http://localhost:3030](http://localhost:3030) in your browser, you should not see a web page load. You should ensure that your server is not running before starting new server windows.

**If you want to preview the application that is running within your coding environment**—Visiting the [http://localhost:3030](http://localhost:3030) from your web browser will allow you to do this.

All the files within this folder inside the Vagrant environment will be automatically synced outside the Vagrant environment to folder inside the `coding-environment/src` folder that is located outside the virtual machine, usually on your Desktop.

# Set Up Flixter

### Checking Out the Repo

Check this repository out into your `coding-environment/src` folder. 

### Create the Initial Database

Connect to your Vagrant instance, change the directory `cd /vagrant/src/flixter`

Run `rake db:create`

### Starting Up Your Server

In a separate terminal, change the directory `cd /vagrant/src/flixter`

Start your server by running `rails server -b 0.0.0.0 -p 3000`

