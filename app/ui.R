library(shiny)
library(shinyIncubator)
library(googleVis)
shinyUI(fluidPage(
    headerPanel("Baltimore Police Department Victim Based Crime Data"),
    mainPanel(
        p("This", a(href="http://shiny.rstudio.com/", "Shiny"),
          "application creates a map with the crime data for Baltimore. You can
      filter crimes by type and the map will be reloaded."),
        p("The data is available", a(href="https://data.baltimorecity.gov/Public-Safety/BPD-Part-1-Victim-Based-Crime-Data/wsfq-mvij", "here"),
          ". The source code for the application is available on",
          a(href="https://github.com/sefakilic/coursera-devdataprod", "GitHub"), "."),
        progressInit(),
        htmlOutput("gvis")
    ),
    sidebarPanel(
        checkboxGroupInput("crime_types",
                           label="Select one or more types of crime and
                           the maps will be updated.",
                           c("LARCENY" = "LARCENY",
                             "LARCENY FROM AUTO" = "LARCENY FROM AUTO",
                             "AUTO THEFT" = "AUTO THEFT",
                             "ROBBERY - COMMERCIAL",
                             "ROBBERY - STREET" = "ROBBERY - STREET",                             
                             "ROBBERY - RESIDENCE" = "ROBBERY - RESIDENCE",
                             "ROBBERY - CARJACKING" = "ROBBERY - CARJACKING",
                             "COMMON ASSAULT" = "COMMON ASSAULT",
                             "ASSAULT BY THREAT" = "ASSAULT BY THREAT",
                             "AGG. ASSAULT" = "AGG. ASSAULT",
                             "BURGLARY" = "BURGLARY",
                             "HOMICIDE" = "HOMICIDE",
                             "SHOOTING" = "SHOOTING",
                             "ARSON" = "ARSON",
                             "RAPE" = "RAPE"))
        )
    ))
