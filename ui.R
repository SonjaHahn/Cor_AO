# Cor_AO: ui.R
# App for changing values of variables and Observing changes in a scatter plot

shinyUI(fluidPage(

    # Application title
    titlePanel("Korrelationen verändern und beobachten"),

    # Sidebar panel
    sidebarLayout(
        sidebarPanel(
            h4("Angaben zur Stichprobe"),
            sliderInput("corr",
                        "Korrelation",
                        min = -1,
                        max = 1,
                        value = 0.3,
                        step= 0.01),
            numericInput("Nges",
                         "Stichprobengröße",
                         min = 0,
                         max = 10000,
                         value = 30,
                         step = 5),
            
            h5("Variable 1 (x-Achse)"),
            splitLayout(
                numericInput("m1",
                         "Mittelwert",
                         value = 0,
                         step = 0.5),
                numericInput("sd1",
                         "SD",
                         value = 1,
                         min = 0.000,
                         step = 0.5)
            ),
            
            h5("Variable 2 (y-Achse)"),
            splitLayout(
                numericInput("m2",
                         "Mittelwert",
                         value = 0,
                         step = 0.5),
                numericInput("sd2",
                         "SD",
                         value = 1,
                         min = 0.000,
                         step = 0.5)
            ),
            
            h4("Grafik-Optionen"),
            # checkboxInput(inputId = "RegLine",
            #               label = c("Regressionsgerade einzeichnen"),
            #               value = FALSE),
            checkboxInput(inputId = "MLine",
                          label = c("Mittelwerte einzeichnen"),
                          value = FALSE),
            checkboxInput(inputId = "Ellipse",
                          label = c("Ellipse einzeichnen"),
                          value = FALSE),
            br(), br(),
            
            h4("Zusätzliche Materialien"),
            #a("Arbeitsaufträge als pdf öffnen",target="_blank",href="Arbeitsauftraege.pdf"),
            
            shiny::actionButton(inputId='ab1', label="Arbeitsaufträge als pdf", 
                                icon = icon("th"), 
                                onclick ="window.open('Arbeitsauftraege.pdf', '_blank')")
            
            #
            #https://stackoverflow.com/questions/29936561/how-do-i-add-a-link-to-open-a-pdf-file-in-a-new-window-from-my-r-shiny-app

            
        ),

        # Show a table containing numbers and a scatter plot
        mainPanel(
          tabsetPanel(
            tabPanel("Ausgabe",
                     
                h4("Korrelationsmaße"),
                    tableOutput("numbers"),
                br(), br(),
            
                h4("Streudiagramm"),
                plotOutput("corPlot")
                ) , 
 
             tabPanel("About",
                     includeMarkdown("About.md"))
        )
        )
    )
)
)

