<?php
$con = mysqli_connect("localhost","magazynier","magazynier123", "egzamin_ee09");
$kw = "SELECT * FROM towary ORDER BY nazwa_towaru";

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