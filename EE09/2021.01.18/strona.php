<html>
<head>
<meta charset="utf8">
<title>PHP und MySQL</title>
</head>
<body>
<h1>PHP und MySQL</h1>
<table border="1">
<tr>
    <th>nr</th>
    <th>zawodnik</th>
    <th>kraj</th>
    <th>skok1</th>
    <th>skok2</th>
    <th>punkty</th>	
</tr>
<?php
    $con=mysqli_connect("localhost", "root", "","tcs2020");
	mysqli_query($con,"set names utf8");

    $query = "SELECT * FROM bischofshofen ORDER BY `bischofshofen`.`Punkty` DESC ";
    $result = mysqli_query($con,$query);
    while ($row = mysqli_fetch_array  ($result))
    {
        echo "<tr>";
        echo "<td>".$row['Nr']."</td>";
        echo "<td>".$row['Zawodnik']."</td>";
        echo "<td>".$row['Kraj']."</td>";
        echo "<td>".$row['Skok1']."</td>";	
        echo "<td>".$row['Skok2']."</td>";	
        echo "<td>".$row['Punkty']."</td>";			
        echo "</tr>";
    }

?>
</table>
</body>
</html>
