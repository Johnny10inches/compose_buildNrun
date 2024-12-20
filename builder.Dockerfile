FROM maven:3.8.8-eclipse-temurin-11

# Set the working directory inside the container
WORKDIR /build

# Copy the Maven configuration file (pom.xml) to the working directory
COPY java-tomcat-maven-example/pom.xml .

# Pre-download and resolve dependencies based on the pom.xml file
RUN mvn dependency:resolve

# Copy the source code of the Java project into the container
COPY java-tomcat-maven-example/src ./src

# Copy the built WAR1 file to a volume
RUN mkdir -p /war1

# Build the project and cp to war1
CMD mvn clean package && cp target/*.war /war1/
