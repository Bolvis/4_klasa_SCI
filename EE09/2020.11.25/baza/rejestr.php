<?php
$con = mysqli_connect("localhost","kierownik","kierownik123", "egzamin_ee09");
$kw = "SELECT imie, nazwisko, data, ilosc FROM zamowienia INNER JOIN osoby ON zamowienia.id_osoba = osoby.id_osoba";

printDatabase($con,$kw);

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