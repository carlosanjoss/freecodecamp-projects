# Neural Network SMS Text Classifier

This project is part of the **Machine Learning with Python** certification from [freeCodeCamp](https://www.freecodecamp.org/).

The goal is to classify SMS messages as either **ham** (normal messages) or **spam** using a neural network trained on the SMS Spam Collection dataset.

## Approach

The notebook implements an end-to-end TensorFlow/Keras text-classification pipeline:

- loads the provided training and validation TSV files;
- maps `ham` to `0` and `spam` to `1`;
- converts raw text into integer token sequences with `TextVectorization`;
- learns distributed word representations with an `Embedding` layer;
- models message context with a bidirectional LSTM;
- uses dropout regularization to reduce overfitting;
- compensates for class imbalance with class weights;
- trains with early stopping based on validation loss;
- returns predictions through the required `predict_message` function.

## Model

The classifier uses the following architecture:

1. `TextVectorization`
2. `Embedding`
3. `Bidirectional(LSTM)`
4. `Dropout`
5. `Dense(ReLU)`
6. `Dropout`
7. `Dense(1, sigmoid)`

The final sigmoid output is interpreted as the probability of the message belonging to the spam class.

## Required Function

```python
def predict_message(pred_text):
    ...
    return [probability, label]
```

The returned label is `ham` when the predicted probability is below `0.5`, otherwise `spam`.

## Run in Google Colab

[Open this notebook in Google Colab](https://colab.research.google.com/github/carlosanjoss/freecodecamp-projects/blob/main/machine-learning-with-python/neural-network-sms-text-classifier/fcc_sms_text_classification.ipynb)

Run all cells in order. The final cell contains the original freeCodeCamp challenge test and was left unchanged.
