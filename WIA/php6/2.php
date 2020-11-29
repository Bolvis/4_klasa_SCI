<?php
$myFile = fopen("imiona_czyste.txt", "r") or die("Unable to open file!");
$wholeText = fread($myFile,filesize("imiona_czyste.txt"));
fclose($myFile);
$lines = explode("\n", $wholeText);
foreach ($lines as $line){
    if($line != null) echo $line[0];
}