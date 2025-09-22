# List of required packages
required_packages <- c(
  "tidyverse",
  "shiny",
  "readr",
  "dplyr",
  "ggplot2", 
  "ggthemes",
  "shinythemes",
  "here"
)

# Install any missing packages
installed_packages <- rownames(installed.packages())
for (pkg in required_packages) {
  if (!pkg %in% installed_packages) {
    install.packages(pkg)
  }
}

# Optionally, load all packages
lapply(required_packages, library, character.only = TRUE)