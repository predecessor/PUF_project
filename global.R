library(shiny)
#install.packages("gtools")
library(shinyjs)
library("gtools")
responsesDir<-file.path("responses")
source("EQ_5D_Questions.R")


bar_names<-c("mobility","self-care","usual activities","pain/discomfort","anxiety/depression")

#responses_file_path<-file.path("responses",list.files("responses"))
#list_responses<-lapply(responses_file_path,read.csv)
#responses_df<-do.call(rbind,list_responses)
#k<-as.data.frame((list_responses)[[1]])

#k<-k[ ,mixedsort(names(k))]
#summary(k)
#k<-as.matrix(k)
#colnames(k)<-bar_names


#barplot(k)