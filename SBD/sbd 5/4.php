<?php
$con = mysqli_connect("localhost","root","", "2020_10");
mysqli_query($con,"SET names UTF8");
$kw = "INSERT INTO `osoby`(`pesel`, `imie`, `nazwisko`, `data_urodzenia`, `id_miejsce_urodzenia`) VALUES 
('1001011235','Ela','Marna','2018-10-11','3'),
('1201011245','Olek','Ranny','2016-09-09','7'),
('1763218648','Kama','Lte/Lpg','2010-12-10','2'),
('1761237648','Dawid','5G','2007-07-06','6'),
('1789098848','Kacper','Winda','2001-01-01','1')";
mysqli_query($con,$kw);
$con->close();