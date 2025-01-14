# Computational Statistics
Preprocessed data and built predictive models, achieving 83.4% accuracy.
# Computational Statistics - Final Project

## Author
**Priyanka Gannavarapu**  
**Date**: December 9, 2023  

---

## Project Description
This project analyzes customer satisfaction for an airline company using a dataset (`Invistico_Airline.csv`). Various statistical and machine learning techniques have been applied, including data preprocessing, exploratory data analysis, correlation analysis, chi-square tests, and logistic regression modeling.

The analysis includes:
1. Data Cleaning and Preprocessing.
2. Exploratory Data Analysis (EDA).
3. Correlation Analysis.
4. Chi-Square Tests for categorical variables.
5. Logistic Regression Modeling for customer satisfaction prediction.

---

## Data Preprocessing
1. **Missing Values**:  
   Missing values were removed using `na.omit()`.  
2. **Encoding Categorical Variables**:  
   - Gender: Male -> 1, Female -> 0  
   - Customer Type: Loyal Customer -> 1, Disloyal Customer -> 0  
   - Type of Travel: Personal -> 1, Business -> 0  
   - Class: Eco -> 1, Eco Plus -> 2, Business -> 3  

3. **Age Grouping**:  
   Age was grouped into categories:
   - Child: 1–18
   - Young: 19–35
   - Middle Age: 36–55
   - Old: 56–70
   - Older: 71–90  

---

## Exploratory Data Analysis (EDA)
- Bar plots for age groups, customer types, and travel types grouped by satisfaction.
- Histograms for numerical variables (Age, Flight Distance, Seat Comfort).  
- Summary statistics and visualizations for identifying patterns and distributions.

---

## Statistical Analysis
1. **Correlation Analysis**:  
   - A correlation matrix was calculated for numerical variables to identify relationships.
2. **Chi-Square Tests**:  
   - Tested associations between satisfaction and categorical variables (Customer Type, Type of Travel, Class).  

---

## Logistic Regression Model
1. **Dataset Split**:  
   - Training: 80%  
   - Testing: 20%  

2. **Logistic Regression**:  
   - A binary logistic regression model was trained using satisfaction as the dependent variable.  
   - Predictive accuracy: **83.4%**  
   - Precision and AUC were calculated.  

3. **ROC Curve**:  
   - A Receiver Operating Characteristic (ROC) curve was plotted, and AUC values were evaluated to assess model performance.

---

## Results
- **Key Findings**:
  - Customer satisfaction was significantly associated with customer type, travel type, and flight class.
  - The model achieved an accuracy of 83.4% in predicting customer satisfaction.
- **AUC**: A high Area Under the Curve was observed, indicating good model performance.  

---

## Required Libraries
The following R libraries were used in the analysis:
- `knitr`
- `ggplot2`
- `caret`
- `caTools`
- `ROCR`

---

## How to Run the Project
1. Download the dataset (`Invistico_Airline.csv`) and update the file path in the script.
2. Install the required R libraries using:
   ```R
   install.packages(c("knitr", "ggplot2", "caret", "caTools", "ROCR"))
3. Run the R Markdown script in RStudio to generate the report and visualizations.

## Output
Visualizations: Age group distributions, bar plots, histograms, and ROC curves.
Model Performance: Confusion matrix, accuracy, precision, recall, and AUC.