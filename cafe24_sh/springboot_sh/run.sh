#!/bin/bash

java -jar -Dspring.profiles.active=dev example-mvc.jar > log.out 2>&1 &
echo $!
