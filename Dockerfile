FROM java:8
COPY ./mysql-connector-java-8.0.13.jar  /mysql-connector-java-8.0.13.jar
COPY ./DockerApp.java /DockerApp.java
WORKDIR /
RUN ["javac", "DockerApp.java"]
CMD ["java", "-classpath", "mysql-connector-java-8.0.13.jar", "DockerApp", "insert", "123", "456", "789"]
CMD ["java", "-classpath", "mysql-connector-java-8.0.13.jar", "DockerApp", "insert", "abc", "def", "ghi"]
CMD ["java", "-classpath", "mysql-connector-java-8.0.13.jar", "DockerApp", "insert", "text1", "text2", "text3"]
CMD ["java", "-classpath", "mysql-connector-java-8.0.13.jar", "DockerApp", "list"]
