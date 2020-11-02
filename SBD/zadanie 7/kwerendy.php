<?php
$con = mysqli_connect("localhost","root","", "importowanie");
mysqli_query($con,"SET names UTF8");
$a1 = "SELECT COUNT(*) AS `osoby z zs` FROM osoby_txt WHERE `osoby_txt`.`miasto` = 'Szczecin'";
$a2 = "SELECT COUNT(*) AS `osoby nie z zs` FROM osoby_txt WHERE `osoby_txt`.`miasto` <> 'Szczecin'";
echo "a) <br>Osoby ze Szczecina:";
printDatabase($con,$a1);
echo "<br> Osoby spoza Szczecina:";
printDatabase($con,$a2);

$b = "SELECT imie,nazwisko,czas1,czas2,czas3 FROM osoby_txt";
$result = mysqli_query($con,$b);
$smallest = 2147483647;
$name = "";
$surname = "";
while($p = mysqli_fetch_row($result)){
    for($i = 2; $i<sizeof($p); $i++){
        if((int)$p[$i] < $smallest){
            $smallest = (int)$p[$i];
            $name = $p[0];
            $surname = $p[1];
        }
    }
}

echo "<br>b)<br>Minimalny czas ($smallest s) uzyskał $name $surname<br>c)<br>";
$result = mysqli_query($con,"SELECT * FROM `osoby_txt`");
while($p = mysqli_fetch_row($result)){
    $time = ((int)$p[4] + (int)$p[5] + (int)$p[6]) / 3;
   echo "$p[2] $p[1] uzyskał/a średni czas  $time s<br>";
}

$result = mysqli_query($con,"SELECT * FROM `osoby_txt`");
$tryOne = 0;
$tryTwo = 0;
$tryThree = 0;
$numOfRows = 0;
while($p = mysqli_fetch_row($result)){
    $tryOne += (int)$p[4];
    $tryTwo += (int)$p[5];
    $tryThree += (int)$p[6];
    $numOfRows++;
}
$tryOne /= $numOfRows;
$tryTwo /= $numOfRows;
$tryThree /= $numOfRows;
echo "d)<br> Średni czas dla próby pierwszej: $tryOne<br>Średni czas dla próby drugiej: $tryTwo<br>Średni czas dla próby trzeciej: $tryThree<br>";

$con->close();

function printDatabase($con,$kw){
    $result = mysqli_query($con,$kw);
    while($p = mysqli_fetch_row($result)){
        foreach($p as $value){
            echo " $value ";
        }
    }
}