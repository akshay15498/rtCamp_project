## Bash Script for Setting Up WordPress with Docker Compose ##
This script automates the setup of a WordPress site using Docker and Docker Compose. It installs Docker and Docker Compose if they are not already installed, creates a WordPress site with a MySQL database, starts the containers, and provides commands to manage the site.

## Prerequisites ##
Linux operating system (tested on Ubuntu)
Bash shell
Internet connectivity
Usage
Make sure you have execution permission for the script. If not, grant it using the command:

chmod +x project.sh

## Run the script: ##
./project.sh 

## Available commands: ##

./project start: Starts the WordPress containers.
./project stop: Stops the WordPress containers.
./project delete: Stops and deletes the WordPress site containers and local files.

## Script Explanation ##
The script performs the following steps:

Checks if Docker is installed. If not, it installs Docker and adds the current user to the docker group.
Checks if Docker Compose is installed. If not, it installs Docker Compose.
Prompts the user to enter a site name and creates a directory with the specified name.
Creates a docker-compose.yml file in the site directory with the necessary configurations for MySQL and WordPress containers.
Starts the containers using Docker Compose.
Checks if the WordPress site is reachable by sending an HTTP request to the specified IP and port.
Provides additional commands to manage the site:
start: Starts the WordPress containers.
stop: Stops the WordPress containers.
delete: Stops and deletes the WordPress site containers and local files.

## Notes
You may need to modify the IP address (15.152.40.162) in the script to match your own server's IP address or domain name.
The script assumes it is running as a user with sufficient permissions to execute Docker-related commands.
Take caution when using the delete command, as it permanently deletes the site containers and local files.
Feel free to modify and adapt the script to suit your specific needs.
