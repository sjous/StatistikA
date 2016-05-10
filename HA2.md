# Aufgabenblatt zu Lage- und Streuungsmaßen
Sarah Thiesen  
09.05.2016  

##Daten einlesen

```r
library(readstata13)
mydata <- read.dta13("/home/sarah/Dropbox/Uni/StatA_OwnData_V14.dta", nonint.factors = TRUE, generate.factors = TRUE)
var.labels <- data.frame(variable = names(mydata), description = attr(mydata,"var.labels"))
```

##Aufgabe 1

```r
library(plyr)
mytbl <- count(na.omit(mydata$v_beruf))
myfreq <- data.frame(x = mytbl$x, freq = mytbl$freq, relative = mytbl$freq/sum(mytbl$freq), 
                     cumulative = cumsum(mytbl$freq/sum(mytbl$freq)))
myfreq
```

```
##                               x freq   relative cumulative
## 1    kein beruflicher abschluss    6 0.03174603 0.03174603
## 2        lehre/berufsausbildung   52 0.27513228 0.30687831
## 3 meister/technicker-ausbildung   20 0.10582011 0.41269841
## 4        fachhochschulabschluss   19 0.10052910 0.51322751
## 5            hochschulabschluss   80 0.42328042 0.93650794
## 6               weiss ich nicht   12 0.06349206 1.00000000
```

```r
library(scales)
data.frame(x = myfreq$x, freq = myfreq$freq, relative = percent(myfreq$relative), cumulative = percent(myfreq$cumulative))
```

```
##                               x freq relative cumulative
## 1    kein beruflicher abschluss    6     3.2%       3.2%
## 2        lehre/berufsausbildung   52    27.5%      30.7%
## 3 meister/technicker-ausbildung   20    10.6%      41.3%
## 4        fachhochschulabschluss   19    10.1%      51.3%
## 5            hochschulabschluss   80    42.3%      93.7%
## 6               weiss ich nicht   12     6.3%     100.0%
```

Wie groß ist der Anteil der Väter mit einer Lehre bzw. Berufsausbildung?

```r
percent(myfreq$relative[2])
```

```
## [1] "27.5%"
```

Wie viel Prozent der Befragten haben einen Vater mit mindestens Fachhochschulabschluss?

```r
percent(sum(myfreq$relative[4:5]))
```

```
## [1] "52.4%"
```

Wie groß ist der Anteil mit höchstens Meister- oder Techniker-Ausbildung?

```r
percent(myfreq$cumulative[3])
```

```
## [1] "41.3%"
```

##Aufgabe 2

Arithmetisches Mittel

```r
mean(as.numeric(mydata$statwichtig))
```

```
## [1] 4.25
```

Median

```r
median(as.numeric(mydata$statwichtig))
```

```
## [1] 4
```

Modus

```r
getmode <- function(v) {
   uniqv <- unique(v)
   uniqv[which.max(tabulate(match(v, uniqv)))]
}

getmode(mydata$statwichtig)
```

```
## [1] 5
## 7 Levels: 1. Stimme ueberhaupt nicht zu 2 3 4 5 ... 7. Stimme voll und ganz zu
```

Range

```r
max(as.numeric(mydata$statwichtig)) - min(as.numeric(mydata$statwichtig))
```

```
## [1] 6
```

Varianz

```r
var(as.numeric(mydata$statwichtig), na.rm = TRUE)
```

```
## [1] 2.329146
```

Standardabweichung

```r
sd(as.numeric(mydata$statwichtig))
```

```
## [1] 1.526154
```

##Aufgabe 4

Data frame erstellen

```r
rent <- data.frame(id = c(18, 25, 45, 49, 57, 88, 100, 174), miete = c(350, 390, 330, 290, 300, 270, 280, 360))
```

Erstes Quartil

```r
quantile(rent$miete, probs = 0.25)
```

```
##   25% 
## 287.5
```

Median

```r
median(rent$miete, na.rm = TRUE)
```

```
## [1] 315
```

Arithmetisches Mittel

```r
mean(rent$miete, na.rm = TRUE)
```

```
## [1] 321.25
```
