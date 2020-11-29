<?php
$con = mysqli_connect("localhost","root","", "2020_10");
mysqli_query($con,"SET names UTF8");
$kw = "CREATE TABLE `2020_10`.`osoby` ( `pesel` INT NOT NULL , `imie` VARCHAR(10) NOT NULL , `nazwisko` VARCHAR(20) NOT NULL , `data_urodzenia` DATE NOT NULL , `id_miejsce_urodzenia` INT NOT NULL ) ENGINE = InnoDB; ";
mysqli_query($con,$kw);
$con->close();