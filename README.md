# Open Code in Practice for the Census Bureau
This repository is part of our capstone project that aims to demonstrate best practices in writing clean, organized code for complex statistical and machine learning analyses. Our objective is to create a publicly accessible, open-source guide that others can reference and adapt for their own work.

## Repository Contents
- `hipm_2023.csv`: A HIPM dataset used in our example, sourced from the US Census Bureau website
- `EDA/`: A folder containing exploratory data analysis scripts and visualizations
- `modeling/`: A folder with code for logistic regression, neural networks, random forest and XGBoost models to answer our key questions
- `README.md`: This file, which introduces the purpose of the project and how to use the repository

## Data Background
We used the HIPM (Health Inclusive Poverty Measure) dataset from 2023 as a case study to walk through each step of a typical data analysis pipeline, from data loading and preprocessing to model building, evaluation, and reporting. 

HIPM is a measure of poverty that is specific to an individual or household's healthcare related circumstances, such as insurance type, Medicaid expansion state, benefits, resources, and more. From observing this dataset, we decided on two key data analysis questions to demonstrate good code-writing practices
- Can we predict whether a household is in HIPM poverty based on their health needs and insurance status?
- What else do we need to predict HIPM poverty status besides residing in states that have expand Medicaid?

## Acknowledgements
We would like to thank Dr. Emily Molfino, Open Census Lead of the US Census Bureau, for introducing us to this project and providing consistant guidance on how to best present our solution. We would also like to highlight our project advisor, Dr. Dana Yang, who was an immense support in our planning process and provided feedback to our machine learning models.
