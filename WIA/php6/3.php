<?php
$myFile = fopen("imiona_czyste.txt", "r") or die("Unable to open file!");
$wholeText = fread($myFile,filesize("imiona_czyste.txt"));
fclose($myFile);
$lines = explode("\n", $wholeText);
$lines = remove_empty($lines);
$count = 1;
$letter = "";
for ($i = 0; $i < sizeof($lines) - 1; $i++){
    if($lines[$i][0] == $lines[$i+1][0]){
        $count = $count + 1;
        $letter = $lines[$i][0];
    }else{
        echo "$letter - $count, ";
        $count = 1;
    }
    if($i == sizeof($lines) - 2)   echo "$letter - $count, ";
}


function remove_empty($array) {
    return array_filter($array, '_remove_empty_internal');
}


function _remove_empty_internal($value) {
    return !empty($value) || $value === 0;
}