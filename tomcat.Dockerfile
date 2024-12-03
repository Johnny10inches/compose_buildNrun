FROM alpine:3.18

# Install required packages: JRE and wget
RUN apk add --no-cache openjdk11-jre wget tar

# Set working directory
WORKDIR /usr/local

# Download and extract Tomcat
RUN wget https://dlcdn.apache.org/tomcat/tomcat-9/v9.0.97/bin/apache-tomcat-9.0.97.tar.gz && \
    tar -xzvf apache-tomcat-9.0.97.tar.gz && \
    mv apache-tomcat-9.0.97.tar.gz tomcat && \
    rm -f apache-tomcat-9.0.97.tar.gz

# Copy WAR file from shared volume
COPY --from=compose_buildnrun-builder /build/target/*.war /usr/local/tomcat/webapps/

# Expose default Tomcat port
EXPOSE 8080

# Start Tomcat
CMD ["tomcat/bin/catalina.sh", "run"]
