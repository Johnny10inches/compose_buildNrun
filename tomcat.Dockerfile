FROM alpine:3.18

# Install required packages: JRE and wget
RUN apk add --no-cache openjdk11-jre tar

# Set working directory
WORKDIR /usr/local

# Download and extract Tomcat
RUN wget https://dlcdn.apache.org/tomcat/tomcat-9/v9.0.97/bin/apache-tomcat-9.0.97.tar.gz && \
    tar -xzvf apache-tomcat-9.0.97.tar.gz && \
    rm -f apache-tomcat-9.0.97.tar.gz && \

# Expose default Tomcat port
EXPOSE 8080

# Start Tomcat
CMD ["/usr/local/apache-tomcat-9.0.97/bin/catalina.sh", "run"]
