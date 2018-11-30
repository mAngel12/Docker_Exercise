FROM java:8
COPY ./mysql-connector-java-8.0.13.jar  /mysql-connector-java-8.0.13.jar
COPY ./DockerApp.java /DockerApp.java
WORKDIR /
RUN ["javac", "DockerApp.java"]
