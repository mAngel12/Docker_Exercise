FROM java:8
COPY ./mysql-connector-java-8.0.13.jar /mysql-connector-java-8.0.13.jar
COPY ./DockerApp.java /DockerApp.java
COPY ./script.sh /script.sh
ENV CLASSPATH=/mysql-connector-java-8.0.13.jar:${CLASSPATH}
WORKDIR /
RUN ["javac", "DockerApp.java"]
CMD ["./script.sh"]
