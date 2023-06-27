# WordPress Site Creation Script
This script allows you to create a WordPress site using the latest WordPress version in a LEMP stack running inside containers (Docker). It provides commands to enable/disable the site, as well as delete the site.
## Installation

Clone the repository or download the script file (`project.sh`) to your desired location.
Make the script executable:
   ```bash
   chmod +x project.sh

## Check Dependencies

This command checks if Docker and Docker Compose are installed on the system. If they are not present, it installs the missing packages.
./project.sh check

## Enable Site <site_name>

This subcommand starts the containers for the specified site, enabling it to be accessible.
./project.sh enable 

## Disable Site

This subcommand stops the containers for the specified site, disabling it.
./project.sh disable <site_name>
Replace <site_name> with the name of the site you want to disable.

## Delete Site

This command deletes the containers and local files for the specified site.
./project.sh delete <site_name>
Replace <site_name> with the name of the site you want to delete.

Note: Deleting a site will permanently remove all associated containers and local files. Proceed with caution.
