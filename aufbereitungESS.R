#Daten einlesen und data frame mit Beschreibungen der Variablen erstellen
library(foreign)
ess <- read.dta("/home/sarah/Dropbox/Uni/ESS7DE.dta")
var.labels <- data.frame(variable = names(ess), description = attr(ess,"var.labels"))

#Nur Einheimische im Datensatz behalten
library(dplyr)
ess <- filter(ess, brncntr != "No", facntr != "No", mocntr != "No")

#Recodiere fehlende Werte in NA
ess[ess == "Not applicable"] <- NA
ess[ess == "Don't know"] <- NA
ess[ess == "No answer"] <- NA
ess[ess == "Not available"] <- NA
ess[ess == "Refusal"] <- NA

ess$agea[ess$agea > 900] <- NA
ess$alcwknd[ess$alcwknd > 600] <- NA
ess$wkhtot[ess$wkhtot > 120] <- NA
ess$eduyrs[ess$eduyrs > 40] <- NA

#Generiere Xenophobie-Skala
ess <- mutate(ess, xeno = (as.numeric(imdetbs) + as.numeric(imdetmr) - 2) / 2)

#Generiere eine kategoriale Varibale die Ost-/Westdeutsche identifiziert
ess <- mutate(ess, ost = factor(intewde, levels(intewde)[c(2, 1)]))
levels(ess$ost)[levels(ess$ost)=="Interview takes place in West Germany, West Berlin"] <- "West"
levels(ess$ost)[levels(ess$ost)=="Interview takes place in East Germany, East Berlin"] <- "Ost"

#Behalte nur die Variablen die wir fuer die Uebungen und die Vorlesung brauchen
ess <- select(ess, idno, alcwknd, lvgptnea, wkhtot, ost, dscrsex, dfegcf, xeno, dfegcon, alcfreq, 
              agea, eduyrs, gndr, trstprt, imwbcnt)
var.labels2 <- filter(var.labels, variable %in% names(ess))