#!/bin/bash
sleep 5s
javac DockerApp.java
java DockerApp insert 123 456 789
java DockerApp insert text1 text2 text3
java DockerApp insert abc def ghi
java DockerApp list
