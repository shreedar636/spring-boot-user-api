#!/bin/bash
set -e

# Install OpenJDK 17 without sudo
apt-get update && apt-get install -y openjdk-17-jdk

# Verify Java installation
java -version

# Run the Spring Boot JAR
java -jar build/libs/app.jar