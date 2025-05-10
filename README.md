# Open Code in Practice for the Census Bureau
Our capstone project that aims to demonstrate best practices in writing clean, organized code for complex statistical and machine learning analyses. Our objective is to create a publicly accessible, open-source guide that others can reference and adapt for their own work.

## Data Background
We used the HIPM (Health Inclusive Poverty Measure) dataset from 2023 as a case study to walk through each step of a typical data analysis pipeline, from data loading and preprocessing to model building, evaluation, and reporting. 

HIPM is a measure of poverty that is specific to an individual or household's healthcare related circumstances, such as insurance type, Medicaid expansion state, benefits, resources, and more. From observing this dataset, we decided on two key data analysis questions to demonstrate good code-writing practices

1.  Can we predict whether a household is in HIPM poverty based on their health needs and insurance status?
2.  What else do we need to predict HIPM poverty status besides being in a state that has expanded Medicaid?

## Files
- `hipm_2023.csv`: The HIPM poverty dataset used in our example, sourced from the US Census Bureau website
- `Q1_EDA.R`: Exploratory data analysis for Question 1
- `Q1_LogisticRegression.Rmd`: Logistic regression model code for Question 1
- `Q1_RandomForest.Rmd`: Random Forest model code for Question 1
- `Q1_XGBoost.Rmd`: XGBoost model code for Question 1
- `Q2_EDA.Rmd`: Exploratory data analysis for Question 2
- `Q2_LogisticRegression.Rmd`: Logistic regression model code for Question 2
- `Q2_RandomForest.Rmd`: Random Forest model code for Question 2

## How to Run Code
To reproduce the analysis:
1. Open the `.R` or `.Rmd` files in RStudio
2. Ensure the dataset `hipm_2023.csv` is in your working directory
3. Install required packages using `install.packages()`
4. Run each script step by step
5. Knit `.Rmd` files for full analysis and output if desired

## Acknowledgements
We would like to thank our sponsor Emily Molfino, Open Census Lead of the US Census Bureau, for introducing us to this project and providing consistant guidance on how to best present our solution. We would also like to highlight our project advisor, Dana Yang, who was an immense support in our planning process and provided feedback to our machine learning models. Lastly, we thank Sreyoshi Das for keeping us on track in terms of progress with biweekly stand-up meetings.
