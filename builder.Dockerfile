FROM maven:latest

WORKDIR /build

COPY java-tomcat-maven-example/pom.xml .
RUN mvn dependency:resolve

COPY java-tomcat-maven-example/src ./src
RUN mvn clean package

CMD cp target/*.war /build/target/