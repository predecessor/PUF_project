server <- function(input, output) {
  
  
  
  EQ_5Ds<-callModule(EQ_5D_Questions,"EQ_5D")
  
  formData<-reactive({
    
    data<-EQ_5Ds()
    data<-t(data)
    data<-as.data.frame(data)
    data<-data[ ,mixedsort(names(data))]
    data<-as.matrix(data)
    colnames(data)<-bar_names
    data<-data
    
  })
  
  saveData<- function(data) {
    filename<-sprintf("%s_%s.csv", as.integer(Sys.time()), digest::digest(data))
    #filePath<-file.path(tempdir(),filename)
    #data<-data
    #data<-data[,data[order(nchar(data),data)]]
    #data<-as.data.frame(data)
    #data<-data[ ,mixedsort(names(data))]
    write.csv(x=data,file = file.path(responsesDir,filename), row.names = FALSE, quote = TRUE)
    
    
    
  }
  
  
  observeEvent(input$submit, {
    saveData(formData())
    shinyjs::hide("EQ_5D_input")
    shinyjs::hide("submit")
    shinyjs::hide("EQ_5DPlot")
    shinyjs::show("thankyou_msg")
  })
  
  output$EQ_5DPlot <- renderPlot({
    
    barplot(formData())
  
  })
}