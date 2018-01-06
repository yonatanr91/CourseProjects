library(shiny)
library(vcd)
data("Baseball")
shinyUI(fluidPage(
        titlePanel("Course 9 Final Project - YR"),
        sidebarLayout(
                sidebarPanel(
                        h4("Documentation:"),
                        h5("1) Select a player in the drop down below."),
                        h5("2) Look right to see the player's career stats."),
                        h5(" ------ "),
                        selectInput("player",
                                    "Select the Player:", 
                                    Baseball$name2)
                        ),
                mainPanel(
                        h3("Career Stats"),
                        h5("At Bats:"),
                        textOutput("atbat"),
                        h5("Hits:"),
                        textOutput("hits"),
                        h5("Homeruns:"),
                        textOutput("homeruns"),
                        h5("Runs:"),
                        textOutput("runs"),
                        h5("RBIs:"),
                        textOutput("rbi"),
                        h5("Walks:"),
                        textOutput("walks")
                        )
                )
        ))