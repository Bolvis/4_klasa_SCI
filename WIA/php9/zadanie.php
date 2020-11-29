<html>
<head>
    <title>licznik odwiedzin storny</title>
    <meta http-equiv="refresh" content="<?php echo 10?>;URL='<?php echo $_SERVER['PHP_SELF']?>'">
</head>
<body>

</body>
</html>
<?php
session_start();
if (!isset($_SESSION['period']))
    $_SESSION['period'] = (int)$_POST['period'];

if (!isset($_SESSION['time']))
    $_SESSION['time'] = time();

if (isset($_SESSION['views']) AND  $_SESSION['time'] + $_SESSION['period'] <= time()){
    $_SESSION['views'] += 1;
    $_SESSION['time'] = time();
}
else
    if (!isset($_SESSION['views']))
        $_SESSION['views'] = 1;

echo "Views: ".$_SESSION['views'];
$num = rand(1,10);

echo "<br><img src=./grafiki/$num.jpg>";
