<?php
$con = mysqli_connect("localhost","root","", "2020_10");
mysqli_query($con,"SET names UTF8");
$kw = "CREATE TABLE `2020_10`.`miejsca` ( `id_miejsce_urodzenia` INT NOT NULL , `miejscowosc_urodzenia` VARCHAR(30) NOT NULL ) ENGINE = InnoDB; ";
mysqli_query($con,$kw);
$kw = "INSERT INTO `miejsca` (`id_miejsce_urodzenia`, `miejscowosc_urodzenia`) VALUES ('1', 'M-je'), ('2', 'ZS'), ('3', 'ZSW'), ('4', 'Kraków'),('5', 'M-jeasd'), ('6', 'ZasdsadS'), ('7', 'ZasdasdSW'), ('8', 'Krasadaków'),('9', 'M-asdsadje'), ('10', 'ZsadsadsadS')";
mysqli_query($con,$kw);
$con->close();