<?php
$myFile = fopen("imiona_czyste.txt", "r") or die("Unable to open file!");
$wholeText = fread($myFile,filesize("imiona_czyste.txt"));
fclose($myFile);
policz($wholeText,"imona-czyste.txt");

$myFile = fopen("imiona.txt", "r") or die("Unable to open file!");
$wholeText = fread($myFile,filesize("imiona.txt"));
fclose($myFile);
policz($wholeText,"imona.txt");


function policz($text,$fileName){
    $lines = explode("\n", $text);
    $lImion = sizeof(remove_empty($lines));
    $lZnakow = 0;
    echo "Jest $lImion imion. Tyle samo niepustych lini.";
    foreach($lines as $line){
        $lZnakow = $lZnakow + strlen($line);
    }
    echo "Jest $lZnakow znaków w pliku $fileName<br>";
}


function remove_empty($array) {
    return array_filter($array, '_remove_empty_internal');
}


function _remove_empty_internal($value) {
    return !empty($value) || $value === 0;
}