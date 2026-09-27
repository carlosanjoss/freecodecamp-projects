# Cat and Dog Image Classifier

This project is part of the **Machine Learning with Python** certification from [freeCodeCamp](https://www.freecodecamp.org/).

The goal is to build and train a convolutional neural network with TensorFlow and Keras that classifies images as cats or dogs with at least **63% accuracy** on the challenge test set.

## Open in Google Colab

[Open the completed notebook in Google Colab](https://colab.research.google.com/github/carlosanjoss/freecodecamp-projects/blob/main/machine-learning-with-python/cat-and-dog-image-classifier/fcc_cat_dog.ipynb)

## Implementation

The notebook includes:

- image normalization with `ImageDataGenerator`;
- separate training, validation, and test generators;
- deterministic test ordering with `shuffle=False`;
- data augmentation using rotation, width and height shifts, zoom, and horizontal flipping;
- a Sequential convolutional neural network with four `Conv2D`/`MaxPooling2D` blocks;
- dropout regularization and a fully connected classification head;
- binary cross-entropy loss with the Adam optimizer;
- training and validation accuracy/loss plots;
- predictions for all 50 challenge test images;
- the original freeCodeCamp pass/fail test requiring at least 63% correct classifications.

## Files

- `fcc_cat_dog.ipynb` — completed Google Colab notebook containing the full solution.

## Challenge requirement

The final model must correctly classify at least **63%** of the 50 test images. freeCodeCamp considers 70% or higher extra credit.

> The notebook must be executed in Google Colab to train the model and generate the final measured accuracy, since model weights and execution outputs are not stored in this repository.
