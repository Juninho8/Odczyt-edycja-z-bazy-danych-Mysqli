<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<link rel="stylesheet" type="text/css" href="styl.css">
	<title>Tabela kontrahentow </title>
	<?php
		function dodaj() {
			$polaczenie = mysqli_connect("127.0.0.1","root","","janczak") or die("wystąpił błąd połączenia");
			mysqli_query($polaczenie,"SET CHARACTER SET 'utf8'");
            mysqli_query($polaczenie,"SET SESSION collation_connection = 'utf8_unicode_ci'");
			$nip=$_POST['nip'];
			$regon=$_POST['regon'];
			$nazwa=$_POST['nazwa'];
			$ulica=$_POST['ulica'];
			$nrdomu=$_POST['nrdomu'];
			$nrmieszkania=$_POST['nrmieszkania'];
			
			if(isset($_POST['vat'])){
				$vat= 1;
			}
			else {
				$vat = 0;
			}
			if($nip!=""){
			$zapytanie = mysqli_query($polaczenie,"INSERT INTO `danekontrahentow`(`NIP`, `REGON`, `NAZWA`, `PLATNIKVAT`, `ULICA`, `NUMERDOMU`, `NUMERMIESZKANIA`) VALUES ('$nip','$regon','$nazwa','$vat','$ulica','$nrdomu','$nrmieszkania')");
			
			}
			
			
			
			mysqli_close($polaczenie);
		}
		
		if (isset($_POST['dodaj'])){
			dodaj();
			header('Location:danekontrahentow.php');
		}
		
		
		function edycja() {
			$polaczenie = mysqli_connect("127.0.0.1","root","","janczak") or die("wystąpił błąd połączenia");
			mysqli_query($polaczenie,"SET CHARACTER SET 'utf8'");
            mysqli_query($polaczenie,"SET SESSION collation_connection = 'utf8_unicode_ci'");
			$wyb=$_POST['wyb'];
			$kogo=$_POST['kogo'];
			$co=$_POST['co'];
			$na=$_POST['na'];
			if($wyb=='nip'){
				$zapytanie=mysqli_query($polaczenie,"UPDATE danekontrahentow SET $co='$na' WHERE `NIP`=$kogo");
			}
			else {
				$zapytanie=mysqli_query($polaczenie,"UPDATE danekontrahentow SET $co='$na' WHERE `REGON`=$kogo");
			}
			mysqli_close($polaczenie);
		}
		if (isset($_POST['edytuj'])){
			edycja();
		
		}
	
		function usun() {
			$polaczenie = mysqli_connect("127.0.0.1","root","","janczak") or die("wystąpił błąd połączenia");
			mysqli_query($polaczenie,"SET CHARACTER SET 'utf8'");
            mysqli_query($polaczenie,"SET SESSION collation_connection = 'utf8_unicode_ci'");
			$nipusun = $_POST['nipusun'];
			$zapytanie = mysqli_query($polaczenie,"UPDATE danekontrahentow SET USUNIETY=1 WHERE `NIP`=$nipusun");
			mysqli_close($polaczenie);
		}
		if (isset($_POST['usun'])){
			usun();
		
		}
	
	?>
</head>
<body>
	<div id="Lewy"> 
		<ol type="a">
			<li><a href="http://krzysztofjanczak.cba.pl/roznekontrolkihtml.html"> Różne kontrolki HTML</a></li>
			<li><a href="http://krzysztofjanczak.cba.pl/tabelapracownikow.html"> Tabela Pracowników</a></li>
			<li><a href="http://krzysztofjanczak.cba.pl/tabelafakturvat.html"> Tabela Faktur VAT</a></li>
			<li><a href="http://krzysztofjanczak.cba.pl/tabeladelegacjibd.html"> Tabele Delegacji BD</a></li>
			<li><a href="http://krzysztofjanczak.cba.pl/danekontrahentow.html"> Dane Kontrahentów</a></li>
		
		</ol>
	
	</div>
	<div id="Prawy"> 
		<div id="kontraheci">
		
		<?php
			
			
			function wyswietl() {
				$polaczenie = mysqli_connect("127.0.0.1","root","","janczak") or die("wystąpił błąd połączenia");
				mysqli_query($polaczenie,"SET CHARACTER SET 'utf8'");
				mysqli_query($polaczenie,"SET SESSION collation_connection = 'utf8_unicode_ci'");
				$zapytanie = mysqli_query($polaczenie,"SELECT * FROM `danekontrahentow` WHERE USUNIETY=0");
			echo "<table border id='kontraheci'>
				<tr><th>NIP</th><th>REGON</th><th>NAZWA</th><th>CZY PŁATNIK VAT</th><th>ULICA</th><th>NUMER DOMU</th><th>NUMER MIESZKANIA</th></tr>";
				while ($wyn=mysqli_fetch_row($zapytanie)) {
				if($wyn[4]==1){
					$vat="<input type='checkbox' checked>";
				}
				else {
					$vat="<input type='checkbox'>";
				}
				echo "<tr>";
				echo ("<td>$wyn[1]</td><td>$wyn[2]</td><td>$wyn[3]</td><td>$vat
						</td><td>$wyn[5]</td><td>$wyn[6]</td><td>$wyn[7]</td>");
				echo "</tr>";
		
				}
				echo "</table>";
				mysqli_close($polaczenie);
			}
		wyswietl();
	
		?>
		</div>
		
		<div id="panel">
			DODAWANIE
			<form method="post">
				NIP:<input type="text" name="nip"><br>
				REGON:<input type="text" name="regon"><br>
				NAZWA:<input type="text" name="nazwa"><br>
				CZY PŁATNIK VAT:<input type="checkbox" name="vat"><br>
				ULICA:<input type="text" name="ulica"><br>
				NUMER DOMU:<input type="text" name="nrdomu"><br>
				NUMER MIESZKANIA:<input type="text" name="nrmieszkania"><br>
				<button type="submit" name="dodaj">DODAJ</button>
			
			</form>
			EDYCJA
			<form method="post">
				Po czym szukać?(NIP czy REGON):
				<select name="wyb">
					<option value="nip">NIP</option>
					<option value="regon">REGON</option>
				</select><br>
				Jaki wpis edytować:<input type="text" name="kogo"><br>
				Co zmieniamy?<select name="co">
					<option value="NIP">NIP</option>
					<option value="REGON">REGON</option>
					<option value="NAZWA">NAZWA</option>
					<option value="PLATNIKVAT">VAT</option>
					<option value="ULICA">ULICA</option>
					<option value="NUMERDOMU">NUMER DOMU</option>
					<option value="NUMERMIESZKANIA">NUMER MIESZKANIA</option>
				</select><br>
				Na co?(w przypadku vatu 1 jak jest płatnikiem,0 jak nie)<br>
				<input type="text" name="na"><br>
				<button type="submit" name="edytuj">EDYTUJ</button>
				
			
			</form>
			USUWANIE
			<form method="post">
			Wpisz nr nip który chcesz usunąć?<input type="text" name="nipusun"><br>
			<button type="submit" name="usun">USUŃ</button>
			</form>
		</div>
		
	
	</div>
</body>
</html>