# Book Recommendation Engine using KNN

This project is part of freeCodeCamp's **Machine Learning with Python** certification.

The goal is to build a book recommendation system using the **Book-Crossings** dataset and `NearestNeighbors` from scikit-learn. Given a book title, the `get_recommends` function returns five similar books together with their cosine distances.

## Method

The implementation follows the statistical-significance constraints required by the challenge:

- users with fewer than 200 ratings are removed;
- books with fewer than 100 ratings are removed;
- the remaining ratings are transformed into a book-by-user matrix;
- missing ratings are filled with zero;
- the matrix is converted to a SciPy `csr_matrix`;
- a K-Nearest Neighbors model is fitted using cosine distance.

## Files

- `fcc_book_recommendation_knn.ipynb` — completed Google Colab notebook containing data preparation, KNN model training, the `get_recommends` function, and the official freeCodeCamp test.

## Run in Google Colab

[Open the notebook in Google Colab](https://colab.research.google.com/github/carlosanjoss/freecodecamp-projects/blob/main/machine-learning-with-python/book-recommendation-engine-knn/fcc_book_recommendation_knn.ipynb)

Run all cells from top to bottom. The notebook downloads the Book-Crossings dataset automatically and executes the official challenge test in the final cell.

## Expected function format

```python
get_recommends("The Queen of the Damned (Vampire Chronicles (Paperback))")
```

returns a list containing the queried title and five recommended books with their corresponding distances.
