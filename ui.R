ui <- fluidPage(
  useShinyjs(),
    #hidden(
      list(
  
  
  # Application title
  #titlePanel("PUF"),
  
 div(id="EQ_5D_input",
    
     EQ_5D_Questions_Input("EQ_5D", questions=c("I have problems with mobility",
                                                "I have problems with self-care",
                                                "I have problems with usual activities",
                                                "I have pain/discomfort",
                                                "I have anxiety or depression"))
     
    ),
 plotOutput("EQ_5DPlot"),
 actionButton("submit","Submit", class="btn-primary"),
 
 shinyjs::hidden(
   div(
     id="thankyou_msg",
     h3("Thanks,your response was submitted successfully!")

   
   )
  )
 
 )
    )
     #)
    


