
library(shiny)
library(MASS)
library(ggplot2)
library(rmarkdown)


# Define server logic required to draw a histogram
shinyServer(function(input, output) {
    
    daten <- reactive({
        N <- input$Nges
        m1 <- input$m1
        sd1 <- input$sd1 # > 0
        m2 <- input$m2
        sd2 <- input$sd2 # > 0
        cor12 <- input$corr
        
        cov12 <- cor12*sd1*sd2
        Sigma <- matrix(c(sd1^2,cov12,cov12,sd2^2),2,2)
        
        daten <- data.frame(mvrnorm(n = N, mu=c(m1,m2), Sigma, empirical = TRUE))
        names(daten) <- c("Variable1", "Variable2")
        daten
    })

    output$corPlot <- renderPlot({
        p <- ggplot(daten(), aes(x=Variable1, y=Variable2)) +
            geom_point(shape=1) +    # Use hollow circles
            theme_minimal() +
            theme(axis.title = element_text(size = 15),
               axis.text  = element_text(size=12)) +
            coord_cartesian(xlim=c(-5,5), ylim=c(-5,5)) + 
            scale_y_continuous(breaks=seq(-5, 5)) +
            scale_x_continuous(breaks=seq(-5, 5)) 
        
        # if(input$RegLine == TRUE)
        # {p = p + geom_smooth(method=lm, se=FALSE) } 
        
        if(input$MLine == TRUE)
        {p = p + 
            geom_hline(aes(yintercept=input$m2), colour="deepskyblue", linetype="dashed", size=1) +
            geom_vline(aes(xintercept=input$m1), colour="deepskyblue", linetype="dashed", size=1)}
        
        if(input$Ellipse == TRUE)
        {p = p + stat_ellipse(linetype = "dashed", colour="red", size=2)}
        
        p
    })
    
    
    output$numbers <- renderTable({
        daten <- daten()
        pear <- cor.test(daten$Variable1, daten$Variable2, method = "pearson")
        spear <- cor.test(daten$Variable1, daten$Variable2, method = "spearman")

        tabelle <- data.frame(matrix(c(pear$estimate, spear$estimate,
                    pear$p.value,  spear$p.value), ncol=2), row.names = c("Pearson","Spearman"))
       names(tabelle) <- c("Korrelation","p-Wert")
       tabelle
    },
    align = c("c"),
    rownames = TRUE)
}
)
