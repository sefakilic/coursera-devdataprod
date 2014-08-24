library(shiny)
library(shinyIncubator)
library(googleVis)

source("helper.R")

shinyServer(function(input, output, session) {
    output$gvis <- renderGvis({
        
        withProgress(session, {
            
            setProgress(message = "Calculating, please wait",
                        detail = "This may take a few moments...")
            
            fcrime <- crime[(crime$description %in% input$crime_types), ]
            
            gvisMap(fcrime, "locationvar", "detail",
                    options=list(showTip=TRUE, 
                        showLine=TRUE, 
                        enableScrollWheel=TRUE,
                        mapType='terrain', 
                        useMapTypeControl=TRUE))
        })
    })
})
