<?php

$result = exec('curl --request POST --data "test message" http://host.docker.internal:8080/pub');

print_r($result);