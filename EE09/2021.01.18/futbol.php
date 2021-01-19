<!DOCTYPE html>
<html lang="pl">
<head>
    <meta charset="utf-8" />
    <title>Rozgrywki futbolowe</title>
	<link rel="stylesheet" href="styl.css" />	
</head>
<body>  
	<section id="baner">
		<h2>Światowe rozgrywki piłkarskie</h2>
		<img src="obraz1.jpg" alt="boisko" /> 
	</section>
	<section id="mecze">
	<?php
		$con=mysqli_connect("localhost","root","","egzamin");
		//mysqli_query($con,"set names utf8");
		$kw1="SELECT zespol1, zespol2, wynik, data_rozgrywki FROM rozgrywka WHERE zespol1 LIKE 'EVG'";
		$wynik1=mysqli_query($con,$kw1);
		while($row = mysqli_fetch_array($wynik1))
		{
			echo "<section class='wynik'>
				<h3>".$row['zespol1']." - ".$row['zespol2']."</h3>
				<h4>".$row['wynik']." </h4>
				<p>w dniu ".$row['data_rozgrywki']."</p>	
			</section>";
		}
	
	
		mysqli_close($con);
	?>
	
	</section>  
	<section id="glowny">
		<h2>Reprezentacja Polski</h2>
	</section>	
	<section id="lewy">
		<p>Podaj pozcję zawodników (1-bramkarze, 2-obrńcy, 3-pomocnicy, 4-napastnicy):</p>
		<form name="pila" method="post" action="">
			<input type="number" name="poz"></input>
			<input type="submit" value="Sprawdź"></input>		
		</form>
		<ul>
		<?php
			if(!empty($_POST["poz"]))
			{
				$poz=$_POST["poz"];
				$con=mysqli_connect("localhost","root","","egzamin");
				//mysqli_query($con,"set names utf8");
				$kw2="SELECT imie, nazwisko FROM zawodnik WHERE zawodnik.pozycja_id=".$poz;		
				$wynik2=mysqli_query($con,$kw2);
				while(($row = mysqli_fetch_array ($wynik2)))
				{
					echo "<li><p>".$row['imie']." ".$row['nazwisko']."</p></li>";
				}
				mysqli_close($con);		
				
			}

		?>
		</ul>
		
		
	</section>	
	<section id="prawy">
		<img src="zad1.png" alt="piłkarz" />	
		<p>Autor: 11111122222</p>
	</section>  
	
	
	
</body>
</html>