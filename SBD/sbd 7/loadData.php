<?php
$con = mysqli_connect("localhost","root","", "importowanie");
mysqli_query($con,"SET names UTF8");
$file = fopen("osoby.txt","r");
$lines = explode("\n", fread($file,filesize("osoby.txt")));
$columns = explode(";",$lines[0]);
$kw = "CREATE TABLE IF NOT EXISTS `importowanie`.`osoby_txt` (`$columns[0]` varchar(11),`$columns[1]` varchar(10),`$columns[2]` varchar(20),`$columns[3]` varchar(20),`$columns[4]` varchar(3) ,`$columns[5]` varchar(3) ,`$columns[6]` varchar(3) )  DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;";
mysqli_query($con,$kw);
$kw1 = "INSERT INTO `iportowanie`.`osoby_txt` (`$columns[0]`,`$columns[1]`,`$columns[2]`,`$columns[3]`,`$columns[4]`,`$columns[5]`,`$columns[6]`) VALUES ";
for ($i = 1; $i < sizeof($lines) - 2; $i++){
    $row = explode(";",$lines[$i]);
    $kw1 = $kw1." ('$row[0]','$row[1]','$row[2]','$row[3]','$row[4]','$row[5]','$row[6]'),";
}
$row = explode(";",$lines[sizeof($lines)-2]);
$kw1 = $kw1." ('$row[0]','$row[1]','$row[2]','$row[3]','$row[4]','$row[5]','$row[6]');";
mysqli_query($con,$kw1);
$con->close();