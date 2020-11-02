<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Manage Database</title>
</head>
<body>
    <form method="post" action="loadData.php">
        <button type="submit">Load Data</button>
    </form>
    <form method="post" action="kwerendy.php">
        <button type="submit">SQL</button>
    </form>
</body>
<?php
$username = $_POST['username'];
$password = $_POST['password'];
$con = mysqli_connect("localhost",$username,$password, "importowanie");
mysqli_query($con,"SET names UTF8");

$con->close();