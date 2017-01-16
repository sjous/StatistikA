# Aufgabenblatt Multivariable Regression
Sarah Thiesen  
20.06.2016  

##Daten einlesen

```r
library(readstata13)
mydata <- read.dta13("/home/sarah/Uni/StatA_OwnData_V14.dta", nonint.factors = TRUE, generate.factors = TRUE)
var.labels <- data.frame(variable = names(mydata), description = attr(mydata,"var.labels"))

library(dplyr)
mydata <- mutate(mydata, weiblich = mydata$geschlecht=="1. weiblich", 
                 num_statint = as.numeric(statint), 
                 num_math = as.numeric(statmath),
                 lk = mydata$mathe_lk == "1. Ja",
                 num_zahl = as.numeric(statzahl))
```

## Aufgabe 1

a) Schätzen Sie nun selbst ein Regressionsmodell mit allen Teilnehmern der Statistikveranstaltung. Sie sind davon überzeugt, dass nicht nur das Geschlecht einen Einfluss auf den Wunsch, im späteren Berufsleben nichts mit Zahlen zu tun haben zu wollen, sondern auch das generelle Statistikinteresse, die Abneigung gegen Mathematik und die Tatsache, einen Mathe-LK besucht zu haben.


```r
fit1 <- lm(num_zahl ~ weiblich + num_statint + num_math + lk, data = mydata)
summary(fit1)
```

```
## 
## Call:
## lm(formula = num_zahl ~ weiblich + num_statint + num_math + lk, 
##     data = mydata)
## 
## Residuals:
##     Min      1Q  Median      3Q     Max 
## -4.1205 -0.8657 -0.0171  0.8316  5.0557 
## 
## Coefficients:
##              Estimate Std. Error t value Pr(>|t|)    
## (Intercept)   2.40922    0.45814   5.259 3.85e-07 ***
## weiblichTRUE  0.21653    0.21340   1.015   0.3115    
## num_statint  -0.15135    0.07202  -2.102   0.0369 *  
## num_math      0.37801    0.05231   7.227 1.14e-11 ***
## lkTRUE       -0.24006    0.24860  -0.966   0.3354    
## ---
## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1
## 
## Residual standard error: 1.434 on 192 degrees of freedom
##   (3 observations deleted due to missingness)
## Multiple R-squared:  0.3323,	Adjusted R-squared:  0.3184 
## F-statistic: 23.89 on 4 and 192 DF,  p-value: 4.755e-16
```

b) Berufliche Bildung des Vaters


```r
fit2 <- lm(num_zahl ~ weiblich + num_statint + num_math + lk + v_beruf, data = mydata)
summary(fit2)
```

```
## 
## Call:
## lm(formula = num_zahl ~ weiblich + num_statint + num_math + lk + 
##     v_beruf, data = mydata)
## 
## Residuals:
##     Min      1Q  Median      3Q     Max 
## -4.0620 -0.9720 -0.0113  0.8728  3.9203 
## 
## Coefficients:
##                                      Estimate Std. Error t value Pr(>|t|)
## (Intercept)                           1.98735    0.75487   2.633  0.00922
## weiblichTRUE                          0.17791    0.21765   0.817  0.41481
## num_statint                          -0.14697    0.07370  -1.994  0.04767
## num_math                              0.38700    0.05382   7.191 1.77e-11
## lkTRUE                               -0.17375    0.25553  -0.680  0.49742
## v_beruflehre/berufsausbildung         0.33472    0.66942   0.500  0.61769
## v_berufmeister/technicker-ausbildung  0.30475    0.71805   0.424  0.67178
## v_beruffachhochschulabschluss        -0.10887    0.71982  -0.151  0.87996
## v_berufhochschulabschluss             0.32868    0.65807   0.499  0.61808
## v_berufweiss ich nicht                1.55622    0.75933   2.049  0.04190
##                                         
## (Intercept)                          ** 
## weiblichTRUE                            
## num_statint                          *  
## num_math                             ***
## lkTRUE                                  
## v_beruflehre/berufsausbildung           
## v_berufmeister/technicker-ausbildung    
## v_beruffachhochschulabschluss           
## v_berufhochschulabschluss               
## v_berufweiss ich nicht               *  
## ---
## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1
## 
## Residual standard error: 1.417 on 176 degrees of freedom
##   (14 observations deleted due to missingness)
## Multiple R-squared:  0.3607,	Adjusted R-squared:  0.328 
## F-statistic: 11.03 on 9 and 176 DF,  p-value: 1.448e-13
```


