library(shiny)

# Define UI for Optical properties for light guiding
shinyUI(pageWithSidebar(
  
  # Application title
  headerPanel("Light Guiding for Optical Communication"),
  

  sidebarPanel(
    h4('Popular Material For Optical Communication'),
    
    radioButtons("opt_mat", "Optical Material:",
                list("Silica, Si02" = "Silica", 
                     "Silicon, Si" = "Silicon", 
                     "Gallium Arsenide, GaAs" = "Gallium Arsenide",
                     "ZBLAN" = "ZBLAN")),
    sliderInput('Lambda', label = HTML("Operating Wavelength, (&mu;m)") ,value = 1.55, min = 1, max = 3, step = 0.01,),
    submitButton("Refractive Index", "Calculate"),
    
    br(),br(),
    
    h4('Light Guiding Properties'),
    h5('Light propagates from medium 1 (n1) into medium 2 (n2). Noted that n1 > n2'),
    sliderInput('n1', 'Refractive index of n1',value = 1.5, min = 1, max = 4, step = 0.01,),
    sliderInput('n2', 'Refractive index of n2',value = 1.0, min = 1, max = 4, step = 0.01,),

    submitButton("Characteristics", "Calculate")
  ),
  

  mainPanel(
    tabsetPanel(
      tabPanel("Main Computation Results",
#display refractive index graph and the corresponding refractive index     
        h4('Refractive Index VS Operating Wavelength'),
        plotOutput("RI_Lambda"),
        htmlOutput("RI"),
        verbatimTextOutput("Value_RI"),
        
        br(),
        
        h4('Critical angle for Total Internal Reflection (unit: degree):'),
        verbatimTextOutput("CA"),
        
        h4('Velocity of light in medium 1 (unit: kilometers oer second, km/s):'),
        verbatimTextOutput("LightSpeed"),
        
        h4('Reflectivity for normal incident light (%):'),
        verbatimTextOutput("Reflectivity"),
        
        h4('Transmission coefficient for normal incident light (%):'),
        verbatimTextOutput("Transmission"),
        
        br()
      ),


      tabPanel("User Documentation", 
               
        h3('Introduction about the application'),
        p('This shiny application (Light guiding for optical communication) is built for the 
          purpose to calculate some useful parameters for optical communication which is based on
          utilizing light (electromagnetic wave) to transmit signal for communication near to speed of light.'),
        p('This application first computes the refractive index of the material (medium for light transmission) at 
          different wavelengths and also display the corresponding refractive index vs wavelength graph for the 
          specific optical material chosen by the user after the user press the "calculate refractive index" button'),
        p('Next, this application calculates light guiding properties when the light from medium 1 entering into medium 
          2 with different refractive indices. From the refractive indices choose by user, the application computes the 
          critical angle for total internal reflection to happen, the speed of light in the medium, the reflectivity 
          and transmission coefficient for normal incident (90degree, perpendicular to the interface between mediums)
          light.'),
    br(),
        h3('Steps for using the application'),
        p('The user is required to select the features/parameters that they needed on sidebar panel:'),
        p('1) Select ONE optical material that they want to see the refractive index vs wavelength graph'),
        p('2) Select specific wavelength to obtain its refractive index'),
        p('3) Click "calculate refractive index" for the application to display graph and specific refractive index 
          at main panel'),
        code('NOTE: You must click the "CALCULATE REFRACTIVE INDEX" everytime you want to display updated results'),
    br(),br(),
        p('4) Slide the input value for medium 1 to the refractive indx (n1) you want'),
        p('5) slide the input value for medium 2 to the refractive index (n2) you want. Remember that n1>n2 for 
          light to propagate inside medium.'),
        code('NOTE: You must click the "CALCULATE CHARACTERISTICS" everytime you want to display updated results'),
    br(), br(), 
        h3('Link to server.R and ui.R codes at github'),
        p('www.teeedinchai.com'),
    br(),
      h4('Hope you enjoy this simple application !')
               
      )
    )
  )
  
))
