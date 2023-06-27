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

./project.sh start : Starts the WordPress containers. <br />
./project.sh stop : Stops the WordPress containers.<br />
./project.sh delete : Stops and deletes the WordPress site containers and local files.<br />

## Script Explanation ##
The script performs the following steps:

1) Checks if Docker is installed. If not, it installs Docker and adds the current user to the docker group.<br />
2) Checks if Docker Compose is installed. If not, it installs Docker Compose.<br />
3) Prompts the user to enter a site name and creates a directory with the specified name.<br />
4) Creates a docker-compose.yml file in the site directory with the necessary configurations for MySQL and WordPress containers.<br />
5) Starts the containers using Docker Compose.<br />
6) Checks if the WordPress site is reachable by sending an HTTP request to the specified IP and port.<br />
7) Provides additional commands to manage the site:<br />
8) start: Starts the WordPress containers.<br />
9) stop: Stops the WordPress containers.<br />
10) delete: Stops and deletes the WordPress site containers and local files.<br />

## Notes
You may need to modify the IP address (15.152.40.162) in the script to match your own server's IP address or domain name.<br />
The script assumes it is running as a user with sufficient permissions to execute Docker-related commands.<br />
Take caution when using the delete command, as it permanently deletes the site containers and local files.<br />
Feel free to modify and adapt the script to suit your specific needs.<br />
