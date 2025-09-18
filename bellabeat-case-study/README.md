
# Bellabeat Case Study

**Author:** Eve Kudriavska  
**Date:** 2025-03-26

## Project Overview
Bellabeat is a high-tech manufacturer of wellness devices for women.  
This project analyzes smart wellness tracker data to understand usage patterns and provide actionable insights for marketing and product strategy.

## Objective
- Explore usage of features like steps, sleep, weight, and calories.  
- Identify trends and patterns that Bellabeat could leverage.  
- Provide recommendations based on data-driven insights.

## Data
- **Source:** [FitBit Fitness Tracker Data on Zenodo](https://zenodo.org/records/53894#.X9oeh3Uzaao)  
- **Contents:** 29 CSV files covering daily activity, steps, sleep, calories, weight, and intensities.  
- **Note:** Data collected in 2016; anonymized and public domain.

## Tools & Methods
- **Tools:** R and RStudio (via Posit Cloud), ggplot2, tidyverse  
- **Methods:** Data cleaning, merging tables, exploratory data analysis, visualization, statistical summaries.

## Key Findings
- Step tracking is the most popular feature (33/33 users), sleep monitoring is used less (24/33), and weight logging is least used (8/33).  
- Peak activity occurs during lunch hours and 5–8 PM, suggesting sedentary office jobs.  
- Negative correlation between sedentary minutes and sleep duration.  
- Positive correlation between total time in bed and total sleep minutes.  
- More steps lead to more calories burned.

## Recommendations
- Promote holistic health messaging linking steps, sleep, and calories.  
- Improve usability of weight logging (e.g., voice input, reminders).  
- Develop daily activity programs for office workers.  
- Add features like daily challenges and weekly activity reports.

## Files
- `bellabeat_report.html` – full RMarkdown report  
- `charts/` – folder containing visualizations  
- `data/` – optional raw data files  

## View the Report
- **On GitHub:** [View full Bellabeat Report](file:///Users/tomas/Downloads/rstudio-export/Bellabeat-Case-Study.html)  

