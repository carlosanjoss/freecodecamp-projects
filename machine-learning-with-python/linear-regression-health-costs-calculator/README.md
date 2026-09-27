# Linear Regression Health Costs Calculator

This project is part of the **Machine Learning with Python** certification from [freeCodeCamp](https://www.freecodecamp.org/).

The goal is to predict healthcare expenses from demographic and lifestyle features using a regression model built with TensorFlow and Keras.

## Challenge Requirements

- Convert categorical variables to numerical values.
- Use 80% of the data for training and 20% for testing.
- Remove the `expenses` column from the feature sets using `pop` to create `train_labels` and `test_labels`.
- Train a regression model using `train_dataset` and `train_labels`.
- Achieve a **Mean Absolute Error (MAE) below 3500** on the unseen test set.

## Implementation

The notebook uses:

- one-hot encoding for `sex`, `smoker`, and `region`;
- an 80/20 reproducible train-test split;
- feature normalization learned from the training set only;
- a TensorFlow/Keras dense regression network;
- Mean Squared Error as the training loss;
- MAE and MSE as evaluation metrics;
- Early Stopping and adaptive learning-rate reduction to improve generalization.

## Files

- `fcc_predict_health_costs_with_regression.ipynb` — completed freeCodeCamp notebook with preprocessing, model training, evaluation, and prediction visualization.

## Open in Google Colab

[Open the notebook in Google Colab](https://colab.research.google.com/github/carlosanjoss/freecodecamp-projects/blob/main/machine-learning-with-python/linear-regression-health-costs-calculator/fcc_predict_health_costs_with_regression.ipynb)

Run all cells from top to bottom. The final freeCodeCamp test cell evaluates the trained model and confirms whether the MAE is below 3500.
