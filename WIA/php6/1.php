<?php
$myFile = fopen("imiona.txt", "r") or die("Unable to open file!");
$wholeText = fread($myFile,filesize("imiona.txt"));
fclose($myFile);
$lines = explode("\n", $wholeText);
$newFile = fopen("imiona_czyste.txt", "w");
foreach ($lines as $line){
    $clrLine = preg_replace('~[^\\pL\d]+~u','', $line);
    fwrite($newFile, $clrLine."\n");
}