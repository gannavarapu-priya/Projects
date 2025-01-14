# Data Mining Techniques: Fake News Detection
Implemented machine learning and natural language processing to detect fake news with high accuracy.
# Fake News Detection

This project focuses on detecting fake news articles using various machine learning models and natural language processing techniques. The dataset contains labeled articles that are preprocessed, analyzed, and classified as either **True News** or **Fake News**.

---

## Features
- Data preprocessing with lemmatization and stopword removal
- TF-IDF vectorization for text feature extraction
- Visualization of label distributions, word frequencies, and word clouds
- Implementation of multiple machine learning models for classification:
  - Logistic Regression
  - Support Vector Machines (SVM)
  - Naive Bayes
  - Decision Trees
  - Random Forest
  - Gradient Boosting Machines (GBM)
  - Bagging and Bootstrapping Ensembles
- Performance evaluation using accuracy, confusion matrices, and classification reports

---

## Installation

1. Clone the repository:
   ```bash
   git clone <repository_url>
   cd fake-news-detection
   ```

2. Install required dependencies:
   ```bash
   pip install -r requirements.txt
   ```

3. Download the dataset:
   - Place your datasets (`train.csv`, `test.csv`, `submit.csv`) in the appropriate directory.

---

## Dataset

### Structure:
- **`train.csv`**: Used for training machine learning models
- **`test.csv`**: Unlabeled data for testing
- **`submit.csv`**: Contains labels to evaluate model predictions

### Columns:
- `text`: The content of the news article
- `label`: Binary classification (0 = True News, 1 = Fake News)

---

## Usage

### 1. Preprocess Data
The `preprocess_text` function cleans the text by removing punctuation, converting to lowercase, and applying lemmatization.

### 2. Feature Extraction
The `TF-IDF` vectorizer is used to convert the text into numerical features for machine learning.

### 3. Model Training & Evaluation
Run the following models to classify news articles:
- Logistic Regression
- Support Vector Machines (SVM)
- Naive Bayes
- Decision Trees
- Random Forest
- Gradient Boosting Machines (GBM)
- Bagging Ensembles

Evaluate models using:
- Accuracy score
- Confusion matrix
- Classification report

---

## Results
Detailed performance metrics and visualizations for each model are saved in the results directory or printed to the console.

---

## Contributing
Contributions are welcome! If you want to contribute:
1. Fork this repository.
2. Create a new branch for your feature or bug fix.
3. Submit a pull request describing your changes.

---

## License
This project is licensed under the MIT License. See `LICENSE` for more details.

---

## Acknowledgments
- Thanks to the creators of the dataset for their efforts in data collection.
- Libraries used: `scikit-learn`, `pandas`, `matplotlib`, `nltk`, `seaborn`.
