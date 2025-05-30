#!/bin/bash
set -e

# Install OpenJDK 17 (required for Spring Boot)
sudo apt update
sudo apt install -y openjdk-17-jdk

# Verify Java installation
java -version

# Run the Spring Boot JAR
java -jar build/libs/app.jar