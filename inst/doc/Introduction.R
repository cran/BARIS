## ---- include = FALSE---------------------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>"
)

## ---- eval=FALSE--------------------------------------------------------------
#  
#  install.packages("BARIS")
#  

## ----message=FALSE, warning=FALSE---------------------------------------------
library(BARIS)

BARIS_search(query = "Monuments Historiques Marseille")


## -----------------------------------------------------------------------------

BARIS_explain(datasetId = "5cebfa8306e3e77ffdb31ef5")



## -----------------------------------------------------------------------------
BARIS_resources(datasetId = "5cebfa8306e3e77ffdb31ef5")


## -----------------------------------------------------------------------------

data <- BARIS_extract(resourceId = "59ea7bba-f38a-4d75-b85f-2d1955050e53", format = "csv")

head(data)


