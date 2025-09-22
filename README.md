# Youth Health Analysis Project

This repository contains the final project for STAT 302, focused on analyzing youth health survey data. The project was completed in 2024 and includes data cleaning, exploratory data analysis (EDA), and an interactive Shiny app for data visualization and insights.

## Project Structure

- `01_cleaning.R`: Script for cleaning raw survey data.
- `02_eda.R`: Script for exploratory data analysis and visualization.
- `app.R`: Shiny app for interactive exploration of the cleaned data.
- `data/`
  - `codebook.csv`: Documentation of survey questions and variable definitions.
  - `responses.csv`: Raw survey responses.
  - `responses_clean.csv`: Cleaned survey data ready for analysis.
- `memo/`
  - `Bruno_Kyla_Progress_Memo.qmd`: Project progress memo (Quarto format).
  - `Bruno_Kyla_Progress_Memo.html`: Rendered progress memo.

## Getting Started

1. **Open the Project**: Use RStudio to open `final_project.Rproj` for an integrated workflow.
2. **Data Cleaning**: Run `01_cleaning.R` to process and clean the raw data.
3. **Exploratory Analysis**: Use `02_eda.R` to generate summary statistics and visualizations.
4. **Interactive App**: Launch `app.R` to start the Shiny app for interactive data exploration.

## Requirements

- R (version 4.0 or higher recommended)
- R packages: `tidyverse`, `shiny`, `readr`, `dplyr`, `ggplot2`, and others as specified in the scripts.



## License

This project is for educational purposes only and completed under instruction at Northwestern University. Please contact the authors for permission to reuse or distribute.