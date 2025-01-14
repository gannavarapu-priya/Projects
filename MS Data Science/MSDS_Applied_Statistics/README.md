# Applied Statistics
Implemented regression techniques and performed feature selection with statistical modeling.

# Final Project

This repository contains R markdown scripts for a statistical and machine learning analysis project. The analysis covers various datasets and includes tasks such as regression modeling, feature selection, and performance evaluation.

## Project Details

### 1. Logistic Regression Analysis
- **Dataset**: `Downer` from the `alr4` package.
- **Objective**: Predict the `calving` outcome using explanatory variables (`daysrec`, `ck`, `ast`, `urea`, `pcv`).
- **Methodology**:
  - Performed data preprocessing and train-test split.
  - Built a logistic regression model using training data.
  - Evaluated model performance using a confusion matrix.
- **Key Libraries**: `alr4`, `dplyr`, `caret`.

### 2. Lasso Regression on Boston Housing Data
- **Dataset**: `Boston` from the `MASS` package.
- **Objective**: Predict `medv` (median value of owner-occupied homes) using other housing features.
- **Methodology**:
  - Standardized predictors and applied Lasso regression using cross-validation.
  - Identified important features with non-zero coefficients.
  - Evaluated model performance with Mean Squared Error (MSE).
- **Key Libraries**: `MASS`, `glmnet`.

### 3. Polynomial Regression on Faithful Data
- **Dataset**: `faithful`.
- **Objective**: Predict `eruptions` using `waiting` time with polynomial regression models of varying degrees.
- **Methodology**:
  - Built polynomial regression models for degrees 1 to 4.
  - Conducted 10-fold cross-validation to compute R² values.
  - Selected the model degree with the highest R².
- **Key Libraries**: `boot`.

## Instructions for Use
1. Install the necessary R packages:
   ```R
   install.packages(c("alr4", "dplyr", "caret", "MASS", "glmnet", "boot"))
   ```
2. Load the R markdown file in RStudio or any R IDE.
3. Execute the chunks to replicate the analysis.

## Outputs
- Confusion matrix for logistic regression.
- Optimal polynomial degree for regression with cross-validated R².
- Feature importance and MSE for Lasso regression.

## Author
Priyanka Gannavarapu  
Date: December 5, 2023  
