# Predicting Customer Satisfaction on Airlines
Analyzed customer satisfaction using machine learning models in R and statistical techniques.

# Airline Passenger Satisfaction Analysis

This project analyzes airline passenger satisfaction using machine learning models and statistical techniques. The dataset includes demographic, travel, and service-related attributes, with the target variable being passenger satisfaction.

## Table of Contents
- [Introduction](#introduction)
- [Dataset Description](#dataset-description)
- [Requirements](#requirements)
- [Data Preprocessing](#data-preprocessing)
- [Exploratory Data Analysis (EDA)](#exploratory-data-analysis-eda)
- [Machine Learning Models](#machine-learning-models)
- [Statistical Analysis](#statistical-analysis)
- [Results](#results)
- [How to Run](#how-to-run)

## Introduction
The project involves:
- Cleaning and preprocessing airline passenger data.
- Visualizing the dataset to understand patterns.
- Applying machine learning models to predict passenger satisfaction.
- Conducting statistical analysis for deeper insights.

## Dataset Description
The dataset contains information on:
- **Demographics**: Age, Gender.
- **Travel Details**: Travel Type, Class, Flight Distance.
- **Service Ratings**: In-flight entertainment, Onboard service, etc.
- **Target Variable**: Passenger Satisfaction (Satisfied or Dissatisfied).

## Requirements
The following R libraries are required:

```R
install.packages(c("readr", "tidyverse", "caret", "party", "rpart", "rpart.plot",
                   "caTools", "randomForest", "dplyr", "ROCR", "MASS", "psych",
                   "lda", "plyr", "e1071", "kernlab"))
```

## Data Preprocessing
1. **Loading Data**: The dataset is read from a CSV file.
2. **Missing Values**: Rows with missing values are removed using `na.omit()`.
3. **Feature Engineering**:
   - Categorical variables (e.g., Gender, Class) are converted to factors.
   - Continuous variables are scaled and transformed.
4. **Outlier Treatment**: Outliers are handled using `boxplot()` and quantile-based filtering.

## Exploratory Data Analysis (EDA)
- Visualizations like bar plots and histograms are used to understand the distribution of features.
- Satisfaction levels are visualized with a bar plot.
- Age groups are categorized into bins like "Child," "Young," "Middle Age," etc.

## Machine Learning Models
The following models are implemented:

1. **Decision Tree**:
   - Built using the `rpart` library.
   - Visualized with `rpart.plot()`.

2. **Random Forest**:
   - Constructed using the `randomForest` library with 500 trees.
   - Feature importance is visualized.

3. **Logistic Regression**:
   - Performed using `glm()` to predict satisfaction as a binary outcome.

4. **Support Vector Machine (SVM)**:
   - Implemented using `kernlab` and `caret` libraries for polynomial kernels.

### Model Evaluation
All models are evaluated using:
- Confusion matrix (`caret::confusionMatrix`)
- Accuracy, precision, recall, and F1 score.

## Statistical Analysis
1. **Factor Analysis**:
   - Conducted using `factanal()` to identify underlying factors.

2. **Linear Discriminant Analysis (LDA)**:
   - Implemented using the `lda` library.
   - Scatterplot matrices are used to visualize relationships.

## Results
- Decision Tree, Random Forest, Logistic Regression, and SVM models are evaluated on test data.
- Accuracy and feature importance are reported for each model.
- Factor analysis and LDA provide insights into feature contributions.

## How to Run
1. Clone this repository.
2. Place the dataset (`Airline.csv`) in the working directory.
3. Run the R script in RStudio or an R environment.

```R
source("airline_analysis.R")
```

4. View model outputs, visualizations, and performance metrics in the console.

---

For any questions or issues, feel free to contact the author of this repository.

