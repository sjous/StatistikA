<h1>
Übung 2: Lage- und Streuungsmaße
</h1>
Sarah Thiesen<br> 29.01.2017
<hr />
<h3>
Aufgabe 1 - Berufsausbildung des Vaters
</h3>
          .  use "StatA_OwnData_V13", clear
          
          . tab v_beruf
          
               Berufsbildung des Vaters |      Freq.     Percent        Cum.
          ------------------------------+-----------------------------------
             kein beruflicher abschluss |          6        3.17        3.17
                 lehre/berufsausbildung |         52       27.51       30.69
          meister/technicker-ausbildung |         20       10.58       41.27
                 fachhochschulabschluss |         19       10.05       51.32
                     hochschulabschluss |         80       42.33       93.65
                        weiss ich nicht |         12        6.35      100.00
          ------------------------------+-----------------------------------
                                  Total |        189      100.00
          
          

<p>
Anteil der Väter mit Lehre bzw. Berufsausbildung: 30,69% <br> Anteil der
Väter mit mindestens Fachhochschulabschluss: 10,05% + 42,33% = 52,38%
<br
> Anteil der Väter mit höchstens Meister- oder Technikerausbildung:
41,27%
</p>
<h3>
Aufgabe 2 - Kennwerte der Variable "Statistik-Verständnis ist wichtig im
Leben"
</h3>
          .  tab statwichtig
          
             Statistik-Verstaendnis ist |
                       wichtig im Leben |      Freq.     Percent        Cum.
          ------------------------------+-----------------------------------
          1. Stimme ueberhaupt nicht zu |         10        5.00        5.00
                                      2 |         22       11.00       16.00
                                      3 |         26       13.00       29.00
                                      4 |         43       21.50       50.50
                                      5 |         58       29.00       79.50
                                      6 |         31       15.50       95.00
             7. Stimme voll und ganz zu |         10        5.00      100.00
          ------------------------------+-----------------------------------
                                  Total |        200      100.00
          
          . sum statwichtig, detail
          
                   Statistik-Verstaendnis ist wichtig im Leben
          -------------------------------------------------------------
                Percentiles      Smallest
           1%            1              1
           5%          1.5              1
          10%            2              1       Obs                 200
          25%            3              1       Sum of Wgt.         200
          
          50%            4                      Mean               4.25
                                  Largest       Std. Dev.      1.526154
          75%            5              7
          90%            6              7       Variance       2.329146
          95%          6.5              7       Skewness      -.3497015
          99%            7              7       Kurtosis       2.442982
          
          

<p>
Arithmetisches Mittel: 4,25<br> Median: 4<br> Modus: 5<br> Range: 6<br>
Varianz: 2,329<br> Standardabweichung: 1,526<br>
</p>
<h3>
Aufgabe 4 - Miethöhe der Studenten, die in Hessen ihr Abitur gemacht
haben
</h3>
          .  numlabel _all, add
          
          
          . sum miethoehe if hzbnote_bl == 7, detail
          
                               Mietkosten in Euro
          -------------------------------------------------------------
                Percentiles      Smallest
           1%          270            270
           5%          270            280
          10%          270            290       Obs                   8
          25%          285            300       Sum of Wgt.           8
          
          50%          315                      Mean             321.25
                                  Largest       Std. Dev.      42.90771
          75%          355            330
          90%          390            350       Variance       1841.071
          95%          390            360       Skewness       .3144581
          99%          390            390       Kurtosis       1.745386
          
          
