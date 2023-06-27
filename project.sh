#!/bin/bash

# Check if Docker is installed
if ! command -v docker &> /dev/null; then
    echo "Docker not found. Installing Docker..."
    # Install Docker
    curl -fsSL https://get.docker.com -o get-docker.sh
    sudo sh get-docker.sh
    sudo usermod -aG docker $USER
    echo "Docker installed successfully."
else
    echo "Docker is already installed."
fi

# Check if Docker Compose is installed
if ! command -v docker-compose &> /dev/null; then
    echo "Docker Compose not found. Installing Docker Compose..."
    # Install Docker Compose
    sudo curl -L "https://github.com/docker/compose/releases/latest/download/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
    sudo chmod +x /usr/local/bin/docker-compose
    echo "Docker Compose installed successfully."
else
    echo "Docker Compose is already installed."
fi

# Create a WordPress site
read -p "Enter the site name: " wordpress
mkdir "$wordpress"
cd "$wordpress"

# Create docker-compose.yml
cat > docker-compose.yml <<EOF
version: "3"

services: 
  mysql_db: 
    container_name: mysql_container
    image: "mysql:5.7"
    restart: always
    environment: 
      MYSQL_DATABASE: wordpress_db
      MYSQL_PASSWORD: wordpress_user_password
      MYSQL_ROOT_PASSWORD: password_of_your_choice
      MYSQL_USER: wordpress_user
    volumes: 
      - "mysql:/var/lib/mysql"

  wordpress: 
    container_name: wordpress_container
    depends_on: 
      - mysql_db
    image: "wordpress:latest"		
    restart: always
    ports: 
      - "8000:80"
    environment: 
      WORDPRESS_DB_HOST: "mysql_db:3306"
      WORDPRESS_DB_NAME: wordpress_db
      WORDPRESS_DB_PASSWORD: wordpress_user_password
      WORDPRESS_DB_USER: wordpress_user
    
    
    volumes: 
      - "./:/var/www/html"
      
volumes: 
  mysql: {}

EOF

# Start containers
docker-compose up -d

echo "WordPress site created successfully"


# Check if example.com is reachable
if curl --output /dev/null --silent --head --fail "http://15.152.40.162:8000"; then
  echo "http://15.152.40.162:8000 is up and healthy. Please open it in your web browser."
else
  echo "http://15.152.40.162:8000 is currently unreachable or experiencing issues."
fi
