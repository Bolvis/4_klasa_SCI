<html>
<head>
    <title>PHasdP 10</title>
    <link rel="stylesheet" href="style.css">
</head>
<body>

<div class="baner">
    BANER
</div>
<div class="menu1">
    <p class="naglowek"> MENU1 </p>
</div>
<div class="text">
    <p class="naglowek"> TREŚĆ STRONY </p>
    <ul class="numbers">
        <li>Europa</li>
        <ul class="countries">
            <li>Polska </li>
            <li>Niemcy </li>
            <li>Czechy </li>
        </ul>
        <li> Afryka </li>
        <ul class="countries">
            <li>Egipt </li>
            <li>Tunezja </li>
            <li>Etiopia </li>
        </ul>
    </ul>
    <form method="post" action="index.php">
        <input type="number" min="2" max="100000" placeholder="number" name="num">
        <button type="submit">Check if prime</button>
    </form>
</div>
<div class="menu2">
    <p class="naglowek"> MENU2 </p>
</div>
<footer>
    <p class="naglowek"> STOPKA </p>
</footer>
</body>
</html>
<?php
if (isset($_POST['num'])){
    $number = $_POST['num'];
    if (isPrime($number))
        echo "<script>alert('Is prime');</script>";
    else
        echo "<script>alert('Isn\'t prime');</script>";
}

function isPrime($num){
    $max = sqrt($num);
    for ($i = 2; $i <= $max; $i++){
        if (!isPrime($i)) continue;
        $float = (float)$num / (float)$i;
        if ($float == round($float)) return false;
    }
    return true;
}