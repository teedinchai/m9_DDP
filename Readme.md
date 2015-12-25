---
output: html_document
---

## Coursera Module 9 - Developing Data Products

This shiny application has been created for the course project for "developing Data Products" for class started on 7 Dec 2015.  

The title for this shiny application is **"Light Guiding for Optical Communication"**. The function of this application is to calculate the refractive index versus wavelength for four popular optical materials (Silica, Silicon, Gallium Arsenide and ZBALN). Besides that, it also calculate the critical angle for total internal reflection, velocity of light in the transmission medium, reflectivity and transmission coefficient for normal incident light.  

There is no dataset needed to be loaded for this application. This application get input from user and based on the input, the application calculate the output by solving some equations.  

The link to the shiny application can be found here:
<https://dctee.shinyapps.io/project>

## User Documentation for the shinny application
The user documentation is included with the shiny application. You can see the user documentation by click to the *tabpanel* on top of this shiny application.  

Here i copy and paste the user documentation:   

### Introduction about the application  
This shiny application (Light guiding for optical communication) is built for the purpose to calculate some useful parameters for optical communication which is based on utilizing light (electromagnetic wave) to transmit signal for communication near to speed of light.  

This application first computes the refractive index of the material (medium for light transmission) at different wavelengths and also display the corresponding refractive index vs wavelength graph for the specific optical material chosen by the user after the user press the "calculate refractive index" button  

Next, this application calculates light guiding properties when the light from medium 1 entering into medium 2 with different refractive indices. From the refractive indices choose by user, the application computes the critical angle for total internal reflection to happen, the speed of light in the medium, the reflectivity and transmission coefficient for normal incident (90degree, perpendicular to the interface between mediums) light.  

###Steps for using the application
The user is required to select the features/parameters that they needed on sidebar panel:  

1) Select ONE optical material that they want to see the refractive index vs wavelength graph  

2) Select specific wavelength to obtain its refractive index  

3) Click "calculate refractive index" for the application to display graph and specific refractive index at main panel  

**NOTE**: You must click the "CALCULATE REFRACTIVE INDEX" everytime you want to display updated results   

4) Slide the input value for medium 1 to the refractive indx (n1) you want  

5) slide the input value for medium 2 to the refractive index (n2) you want. Remember that n1>n2 for light to propagate inside medium.  

**NOTE**: You must click the "CALCULATE CHARACTERISTICS" everytime you want to display updated results   