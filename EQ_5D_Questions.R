EQ_5D_Questions_Input<-function(id, questions, ...){
  
  ns<-NS(id)
  
  lapply(seq_along(questions), function(i){
    question <- questions[i]
    sliderInput(ns(paste0("EQ_5D",i)),
                question,
                min = 0,
                max = 100,
                value = 50, ...)
    
    
  })
}

EQ_5D_Questions <- function (input, output, session) {
  
  EQ_5D_inputs<-isolate(names(reactiveValuesToList(input)))
  
  observe(print(EQ_5D_inputs))
  
  EQ_5Ds<-reactive({
    vapply(
      EQ_5D_inputs,
      function(x) {
        out<-input[[x]]
        #if(length(out)==0) return("")
        out
      },
      numeric(1)
    )
      })
  return(EQ_5Ds)
  
  observe(print(EQ_5Ds))
      
}