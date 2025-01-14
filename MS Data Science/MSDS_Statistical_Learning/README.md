# Statistical Learning
Applied Logistic Regression, Random Forest, and Support Vector Machines for binary classification.

# Predictive Analysis of College Data Using Statistical Learning

## Overview
This project applies statistical learning techniques to analyze and predict whether a college is private or public using data from the `College` dataset in the `ISLR2` package. The analysis includes exploratory data analysis (EDA), feature engineering, and predictive modeling with logistic regression, decision trees, and random forests.

## Goal
The main goal is to use statistical learning methods to build accurate predictive models, evaluate their performance, and communicate the results effectively.

---

## Dataset
### Source
- **Dataset**: `College`
- **Package**: `ISLR2`

### Description
The dataset contains information on 777 colleges and universities in the United States. It includes 18 variables related to applications, acceptance, enrollment, costs, and other features. The target variable, `Private`, classifies colleges as private (`Yes`) or public (`No`).

---

## Project Structure

### 1. Introduction
- Describes the dataset, target population, and sampling strategies.
- Defines the prediction problem: Binary classification of colleges as private or public.
- Explains data splitting: Stratified sampling (80% training, 20% testing).

### 2. Statistical Learning Strategies and Methods
- **Exploratory Data Analysis (EDA)**: Includes visualization and summary statistics to understand data distributions and relationships.
- **Feature Engineering**: Handles missing values, scales data, and generates new features as needed.
- **Predictive Models**: Implements and evaluates the following:
  - Logistic Regression
  - Decision Trees
  - Random Forests

### 3. Performance Evaluation
- Uses metrics such as accuracy, precision, recall, F1-score, and ROC-AUC.
- Includes visualizations like confusion matrices and ROC curves.

---

## Results
- Summarizes the performance of each model.
- Identifies the best-performing model based on evaluation metrics.
- Highlights key features influencing the prediction.

---

## Technologies and Tools
- **Programming Language**: R
- **Libraries**: `ISLR2`, `ggplot2`, `caret`, `randomForest`

---

## How to Run the Code
1. Clone the repository.
   ```bash
   git clone <repository-url>
   ```
2. Open the R script in an R environment (e.g., RStudio).
3. Install required packages.
   ```R
   install.packages(c("ISLR2", "ggplot2", "caret", "randomForest"))
   ```
4. Run the script step-by-step or execute the entire script.

---

## Future Enhancements
- Add other machine learning models (e.g., Support Vector Machines, Gradient Boosting).
- Perform hyperparameter tuning for the models.
- Deploy the best model as a web application.

---

## Authors
- [Your Name]  

## License
This project is licensed under the [MIT License](LICENSE).
