library(shiny)
library(ggplot2)

#variable used for for-loop
RHS_plot<- 0
wlength_plot<-0
j<-0


# Define server logic required to calculate reactive output and plot graph
shinyServer(function(input, output) {
  
  ##For renderPlot on Refractive Index vs Wavelength##  
  output$RI_Lambda <- renderPlot({
    # to plot refractive index vs wavelength for Silica 
    if (input$opt_mat == "Silica"){
      for (i in seq(30,120, by=1)) {
        j <- i/30
        wlength_plot[i] <- j
        RHS_plot[i] <- (0.6961663*(j^2)/((j^2) - 0.0684043^2)) + 
          (0.4079426*(j^2)/((j^2) - 0.1162414^2)) + 
          (0.8974794*(j^2)/((j^2) - 9.896161^2))
        R_index_plot <- sqrt(RHS_plot+1)
      }
      wlength_plot<-wlength_plot[-(1:29)]
      R_index_plot <- R_index_plot[-(1:29)]
      dat<-as.data.frame(cbind(wlength_plot, R_index_plot))
      ggplot() + geom_line(data=dat, aes(x=wlength_plot, y=R_index_plot), color ="red", size=1.5) + 
        labs(title="Silica, SiO2") + xlab("wavelength (um)") + ylab("Refractive Index")
    } 
    # to plot refractive index vs wavelength for Silicon     
    else if (input$opt_mat == "Silicon"){
      for (i in seq(30,120, by=1)) {
        j <- i/30
        wlength_plot[i] <- j
        RHS_plot[i] <- 10.6684293*(j^2)/((j^2) - 0.301516485^2) +
          0.0030434748*(j^2)/((j^2) - 1.13475115^2) +
          1.54133408*(j^2)/((j^2) - 1104^2)
        R_index_plot <- sqrt(RHS_plot+1)
      }
      wlength_plot<-wlength_plot[-(1:34)]
      R_index_plot <- R_index_plot[-(1:34)]
      dat<-as.data.frame(cbind(wlength_plot, R_index_plot))
      ggplot() + geom_line(data=dat, aes(x=wlength_plot, y=R_index_plot), color ="blue", size=1.5) + 
        labs(title="Silicon, Si") + xlab("wavelength (um)") + ylab("Refractive Index")
    } 
    # to plot refractive index vs wavelength for GaAs      
    else if (input$opt_mat == "Gallium Arsenide"){
      for (i in seq(30,120, by=1)) {
        j <- i/30
        wlength_plot[i] <- j
        RHS_plot[i] <- 4.372514 + 5.466742*j^2/(j^2 - 0.4431307^2) +
          0.02429960*j^2/(j^2 - 0.8746453^2) +
          1.957522*j^2/(j^2 - 36.9166^2)
        R_index_plot <- sqrt(RHS_plot+1)
      }
      wlength_plot<-wlength_plot[-(1:29)]
      R_index_plot <- R_index_plot[-(1:29)]
      dat<-as.data.frame(cbind(wlength_plot, R_index_plot))
      ggplot() + geom_line(data=dat, aes(x=wlength_plot, y=R_index_plot), color ="green", size=1.5) + 
        labs(title="Gallium Arsenide, GaAs") + xlab("wavelength (um)") + ylab("Refractive Index") 
      #       library(rCharts)
      #       n1<-nPlot(R_index_plot~wlength_plot, data=dat, type='point')
      #       plot(n1$params$data)
      #       cat('<iframe src="n1.html" width=100%, height=600></iframe>')
    }
    # to plot refractive index vs wavelength for ZBLAN      
    else if (input$opt_mat == "ZBLAN"){
      for (i in seq(30,120, by=1)) {
        j <- i/30
        wlength_plot[i] <- j
        RHS_plot[i] <- 1.22514*j^2/(j^2 - 0.08969^2) +
          1.52898*j^2/(j^2 - 21.3825^2) 
        R_index_plot <- sqrt(RHS_plot+1)
      }
      wlength_plot<-wlength_plot[-(1:29)]
      R_index_plot <- R_index_plot[-(1:29)]
      dat<-as.data.frame(cbind(wlength_plot, R_index_plot))
      ggplot() + geom_line(data=dat, aes(x=wlength_plot, y=R_index_plot), color ="purple", size=1.5) + 
        labs(title="ZBLAN") + xlab("wavelength (um)") + ylab("Refractive Index") 
    }
  })
  
  #Display the strings for corresponding refractive index at user input wavelength  
  output$RI <- renderUI({
    str1 <- paste("The Refractive Index for", input$opt_mat)
    str2 <- paste("at wavelength of ",input$Lambda)
    str3 <- paste(label = HTML("&mu;m is"))
    HTML(paste(str1, str2, str3, sep = ' '))
  })
  
  ##To calculate the refractive index at wavelength entered by user (reactive calculation)##    
  output$Value_RI <- reactive({
    L_um <- (input$Lambda)^2
    
    if (input$opt_mat == "Silica"){
      #Refractive index for Silica at different wavelengths
      RHS <- (0.6961663*L_um/(L_um - 0.0684043^2)) + 
        (0.4079426*L_um/(L_um - 0.1162414^2)) + 
        (0.8974794*L_um/(L_um - 9.896161^2))
      R_index <- sqrt(RHS+1)
    } 
    else if (input$opt_mat == "Silicon"){
      #Refractive index for Silicon at different wavelengths
      RHS <- 10.6684293*L_um/(L_um - 0.301516485^2) +
        0.0030434748*L_um/(L_um - 1.13475115^2) +
        1.54133408*L_um/(L_um - 1104^2)
      R_index <- sqrt(RHS+1)
    }
    else if (input$opt_mat == "Gallium Arsenide"){
      #Refractive index for GaAs at different wavelengths
      RHS <- 4.372514 + 5.466742*L_um/(L_um - 0.4431307^2) +
        0.02429960*L_um/(L_um - 0.8746453^2) +
        1.957522*L_um/(L_um - 36.9166^2)
      R_index <- sqrt(RHS+1)
    }
    else if (input$opt_mat == "ZBLAN"){
      #Refractive index for ZBLAN at different wavelengths
      RHS <- 1.22514*L_um/(L_um - 0.08969^2) +
        1.52898*L_um/(L_um - 21.3825^2) 
      R_index <- sqrt(RHS+1)
    }
  })
  
  #calculation for Critical Angle for Total Internal Reflection   
  output$CA <- reactive({
    if (input$n1 >= input$n2) {
      (asin(input$n2/input$n1)) * 180 / pi
    } 
    else if (input$n2 > input$n1){
      as.character("n2>n1!! Critical Angle can't be calculated!! Make sure n1>n2!!")
    }
  })

  #calculation for velocity of light in transmission medium    
  output$LightSpeed <- reactive({
    c <- 299792.458 / input$n1
  })
  
  #calculation for reflectivity for normal incident light
  output$Reflectivity <- reactive({
    ((input$n2 - input$n1)/(input$n2+input$n1))^2 * 100
  })
  
  #calculation for transmission coefficient for normal incident light  
  output$Transmission <- reactive({
    (1-((input$n2 - input$n1)/(input$n2+input$n1))^2) * 100
  })
  
})
