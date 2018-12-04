FROM java:8
COPY ./mysql-connector-java-8.0.13.jar  /mysql-connector-java-8.0.13.jar
COPY ./DockerApp.java /DockerApp.java
ENV CLASSPATH=/mysql-connector-java-8.0.13.jar:${CLASSPATH}
WORKDIR /
RUN ["javac", "DockerApp.java"]
CMD ["java", "DockerApp", "insert", "123", "456", "789"]
CMD ["java", "DockerApp", "insert", "abc", "def", "ghi"]
CMD ["java", "DockerApp", "insert", "text1", "text2", "text3"]
CMD ["java", "DockerApp", "list"]
