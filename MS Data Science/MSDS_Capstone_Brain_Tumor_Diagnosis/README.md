# Capstone: Brain Tumor Diagnosis
Developed and optimized deep learning models for tumor classification and segmentation from MRI data.

# Deep Learning Models Overview

This repository contains Jupyter Notebooks implementing and experimenting with various Convolutional Neural Network (CNN) architectures, including custom CNN, ResNet-50, and VGG19. These notebooks are designed to provide a hands-on understanding of the models, their training processes, and performance evaluation on image classification tasks.

## Files

### 1. `CNN.ipynb`
This notebook demonstrates the implementation of a custom Convolutional Neural Network (CNN). It includes:
- **Architecture Design**: A simple yet effective CNN model built from scratch.
- **Dataset Loading**: Preprocessing and augmentation of an image dataset.
- **Model Training**: Training the model with a specified optimizer, loss function, and evaluation metrics.
- **Evaluation**: Metrics and visualizations like accuracy and loss curves.

Use this notebook to understand the fundamentals of CNNs and their application to image classification.

---

### 2. `RESNET50.ipynb`
This notebook focuses on utilizing ResNet-50, a popular pre-trained deep learning model, for image classification tasks. It includes:
- **Pre-trained Model Usage**: Leveraging ResNet-50 from libraries like TensorFlow/Keras or PyTorch.
- **Transfer Learning**: Fine-tuning the model for a custom dataset.
- **Performance Analysis**: Detailed metrics, confusion matrix, and visualizations of predictions.
- **Advanced Features**: Techniques like data augmentation and learning rate scheduling.

This notebook is ideal for understanding the power of transfer learning and ResNet-50's performance on complex datasets.

---

### 3. `VGG19.ipynb`
This notebook implements the VGG19 architecture, another pre-trained model known for its depth and simplicity. It includes:
- **Architecture Overview**: Explanation of VGG19 layers and their functionality.
- **Dataset Preparation**: Steps to preprocess and split data for training and validation.
- **Model Training**: Fine-tuning the VGG19 model with various hyperparameters.
- **Visualization**: Features like Grad-CAM to interpret model decisions.

Use this notebook to explore how deeper networks like VGG19 perform and the benefits of model interpretability.

---

## Requirements
Before running these notebooks, ensure the following dependencies are installed:
- Python 3.7+
- TensorFlow or PyTorch
- NumPy
- Matplotlib
- scikit-learn
- Jupyter Notebook or JupyterLab
- Additional libraries for data handling and augmentation (e.g., pandas, OpenCV, or PIL)

Install dependencies using:
```bash
pip install -r requirements.txt
```

## Usage
1. Clone this repository:
   ```bash
   git clone https://github.com/your-repo/deep-learning-models.git
   cd deep-learning-models
   ```
2. Open the desired notebook:
   ```bash
   jupyter notebook CNN.ipynb
   ```
3. Follow the instructions within the notebook to train and evaluate the models.

## Contributing
Contributions are welcome! Please fork the repository and submit a pull request with your enhancements.

## License
This project is licensed under the MIT License. See the `LICENSE` file for details.

## Contact
For questions or collaboration, feel free to reach out at gannavarapup.11@gmail.com.

---

Happy coding and learning!
