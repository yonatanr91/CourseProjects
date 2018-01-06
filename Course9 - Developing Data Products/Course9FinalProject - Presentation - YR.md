Course9FinalProject - Presentation - YR
========================================================
author: Yonatan Rafael
date: 12/16/17
autosize: true

Project Objective
========================================================

Create a shiny application and deploy it on Rstudio's servers.

- Provide documentation
- Utilize some form of a widget input
- Perform a calculation on the input in server.R
- Display the calcuation in the html page

Why did I build this tool?

- For Sports fans! A quick way to access stats for players across the league 
- It was the best idea I had.


The Data
========================================================


```r
library(vcd)
data("Baseball")
head(Baseball[,c(1:2,10:15)])
```

```
    name1    name2 atbat hits homeruns runs rbi walks
1      Al   Newman   214   42        1   30   9    24
2    Alan    Ashby  3449  835       69  321 414   375
3    Alan Trammell  4631 1300       90  702 504   488
4    Alan  Wiggins  1941  510        4  309 103   207
5    Alex  Trevino  1876  467       15  192 186   161
6 Alfredo  Griffin  4408 1133       19  501 336   194
```



The Code
========================================================
The first part of the app process allows a user to pick a player. Let's simulate that here by picking "Newman". Then searches for career stats of that player. Then Displays Them.

```r
player = "Newman"
atbat <- Baseball[which(Baseball$name2 == player), 10]
hits <- Baseball[which(Baseball$name2 == player), 11]
homeruns <- Baseball[which(Baseball$name2 == player), 12]
runs <- Baseball[which(Baseball$name2 == player), 13]
```
- At Bats = 214
- Hits = 42
- Homeruns = 1
- Runs = 30


Access the app here!
========================================================




See this link to try the app yourself: https://yonatanrafael.shinyapps.io/Course9FinalProject-YR/
