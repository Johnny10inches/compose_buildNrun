FROM maven:3.8.8-eclipse-temurin-11 AS builder

# Set the working directory inside the container
WORKDIR /build

# Copy the Maven configuration file (pom.xml) to the working directory
COPY java-tomcat-maven-example/pom.xml .

# Pre-download and resolve dependencies based on the pom.xml file
RUN mvn dependency:resolve

# Copy the source code of the Java project into the container
COPY java-tomcat-maven-example/src ./src

# Build the project and generate the WAR file
RUN mvn clean package

# Copy the built WAR file to a volume
CMD cp target/*.war /build/target/
