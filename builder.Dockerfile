# Use the official Maven image with the latest version
FROM maven:latest

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

# Copy the generated WAR file to a shared volume or directory
CMD cp target/*.war /build/target/
