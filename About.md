---
title: "CorrNumbers_About.md"
author: "SonjaHahn"
date: "18 7 2019"
output: html_document
---

## Über diese App

### Hintergrund 

Diese App ermöglicht es, die Höhe der Pearson-Korrelation (Produkt-Moment-Korrelation) sowie weitere Stichprobencharakteristika (Stichprobengröße, -mittelwerte und -standardabweichungen) zu verändern. Es können verschiedene Aspekte beobachtet werden:

* Veränderung zweier Korrelationsmaße (Pearson-Korrelation, Spearman-Korrelation, jeweils mit *p*-Wert) und
* Veränderungen im Streudiagramm.

Das Streudiagramm kann durch Hilfslinien und eine Ellipse ergänzt werden und bildet einen festen Wertebereich ab. Bitte beachten Sie, dass deshalb möglicherweise nicht alle Datenpunkte gezeichnet werden, wenn einzelne Stichproben-Werte zu stark verändert werden. 

Arbeitsaufträge zeigen ein mögliches Vorgehen bei der Verwendung der App auf.

Mit dem Aktualisieren-Button Ihres Browsers können die ursprünglichen Angaben in der App wiederhergestellt werden.


### Code

Diese App wurde mit R und [Shiny](http://www.rstudio.com/shiny/) entwickelt.

Der Code für die App kann unter [GitHub](https://github.com/SonjaHahn/Cor_AO) eingesehen und heruntergeladen werden.
                     
Die App verwendet folgende R-Pakete:

 ```{libraries, eval = FALSE}
library(shiny)
library(MASS)
library(ggplot2)
library(rmarkdown)
``` 

                     
Die App kann mit den folgenden Befehlen lokal auf einem Rechner in R ausgeführt werden:

 ```{run app, eval = FALSE}
library(shiny)
runGitHub("Cor_AO","SonjaHahn")
``` 
                                          
                      
### Autor

Sonja Hahn  
[Pädagogische Hochschule Karlsruhe](https://www.ph-karlsruhe.de)


#### Lizenz
Diese App kann unter folgender Lizenz verwendet und weiterentwickelt werden: [CC BY 4.0](https://creativecommons.org/licenses/by/4.0/)

