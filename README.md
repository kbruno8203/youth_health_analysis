# Youth Health Analysis Project

This repository contains the final project for STAT 302, focused on analyzing youth health survey data. The project was completed in 2024 and includes data cleaning, exploratory data analysis (EDA), and an interactive Shiny app for data visualization and insights.

## Project Structure

- `00_install_packages.R: Script for installing and loading necessary packages.
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

## Run the App

1. Navigate to directory where `app.R` is located.
2. Run `00_install_packages.R` to make sure all dependencies are present.
3. Launch `app.R` with `runApp()` to start the Shiny app for interactive data exploration.

## Requirements

- R (version 4.0 or higher recommended)
- R packages: `tidyverse`, `shiny`, `readr`, `dplyr`, `ggplot2`, and others as specified in the scripts.

## License

This project is for educational purposes only and completed under instruction at Northwestern University. Please contact the authors for permission to reuse or distribute.
