#!/bin/bash
set -e

# Install Java (alternative method)
export DEBIAN_FRONTEND=noninteractive
apt-get update
apt-get install -y --no-install-recommends openjdk-17-jdk

# Build the application
./gradlew build