<?php

header('Content-Type: text/event-stream');
header('Cache-Control: no-cache');
header('X-Accel-Buffering: no');

while (true) {
  echo "data:{message:\"You received 1 message.\"}\n\n";
  ob_end_flush();  flush();
  sleep(10);
  //break;
}