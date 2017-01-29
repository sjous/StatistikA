cd "/home/sarah/Uni/R/StatistikA"
set linesize 70
set more off
qui log using ha2stata, replace

/***
<!doctype html>
<html>
<head>
<meta charset="utf-8">
<title>Statistik A: &Uuml;bung 2</title>
<style>
	.main-container {
		max-width: 940px;
		margin-left: auto;
		margin-right: auto;
	}
	body {
		font-family: "sans-serif";
	}
}
</style>
</head>
<body>
<div class="container-fluid main-container">
<h1>&Uuml;bung 2: Lage- und Streuungsma&szlig;e</h1>
Sarah Thiesen<br>
29.01.2017
<hr />
***/

/***
<h3>Aufgabe 1 - Berufsausbildung des Vaters</h3>
***/


use "StatA_OwnData_V13", clear
tab v_beruf

/***
<p>
Anteil der V&auml;ter mit Lehre bzw. Berufsausbildung: 30,69% <br>
Anteil der V&auml;ter mit mindestens Fachhochschulabschluss: 10,05% + 42,33% = 52,38% <br>
Anteil der V&auml;ter mit h&ouml;chstens Meister- oder Technikerausbildung: 41,27%
</p>
***/

/***
<h3>Aufgabe 2 - Kennwerte der Variable "Statistik-Verst&auml;ndnis ist wichtig im Leben" </h3>
***/

tab statwichtig
sum statwichtig, detail

/***
<p>
Arithmetisches Mittel: 4,25<br>
Median: 4<br>
Modus: 5<br>
Range: 6<br>
Varianz: 2,329<br>
Standardabweichung: 1,526<br>
</p>
***/

/***
<h3>Aufgabe 4 - Mieth&ouml;he der Studenten, die in Hessen ihr Abitur gemacht haben</h3>
***/

numlabel _all, add
sum miethoehe if hzbnote_bl == 7, detail

qui log c

*Exporting

markdoc ha2stata, replace
markdoc ha2stata, replace export(html)
