<?php
$button = $_POST['button'];
$con = mysqli_connect("localhost","root","", "2020_10");
mysqli_query($con,"SET names UTF8");
$kw = "";
switch($button){
    case 1:
        $kw =   "SELECT * FROM `osoby`";
        printDatabase($con,$kw);
        break;
    case 2:
        $kw =   "SELECT distinct miejscowosc_urodzenia FROM miejsca WHERE miejsca.id_miejsce_urodzenia 
                IN (SELECT id_miejsce_urodzenia FROM osoby)";
        printDatabase($con,$kw);
        break;
    case 3:
        $kw =   "SELECT distinct miejscowosc_urodzenia FROM miejsca WHERE miejsca.id_miejsce_urodzenia 
                NOT IN (SELECT id_miejsce_urodzenia FROM osoby)";
        printDatabase($con,$kw);
        break;
    case 4:
        $kw =   "SELECT * FROM osoby WHERE osoby.data_urodzenia > date('2000-01-01')";
        printDatabase($con,$kw);
        break;
    case 5:
        $kw =   "SELECT * FROM osoby WHERE LEFT(osoby.imie,1) = 'A'";
        printDatabase($con,$kw);
        break;
    case 6:
        $imie = (string)$_POST['name'];
        $nazwisko = (string)$_POST['surname'];
        $pesel = (string)$_POST['pesel'];
        $miejsceId = (string)$_POST['city'];
        $data = (string)$_POST['date'];
        $kw =   "INSERT INTO `osoby`(`pesel`, `imie`, `nazwisko`, `data_urodzenia`, `id_miejsce_urodzenia`) VALUES 
                ('$pesel','$imie','$nazwisko','$data','$miejsceId')";
        mysqli_query($con,$kw);
        break;
}

$con->close();

function printDatabase($con,$kw){
    $result = mysqli_query($con,$kw);

    echo "<table border=1>";
    while($p = mysqli_fetch_row($result)){
        echo "<tr>";
        foreach($p as $value){
            echo "<td>$value</td>";
        }
        echo "</tr>";
    }
}

