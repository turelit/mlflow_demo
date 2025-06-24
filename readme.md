---
title: MLflow demo
summary: A demo machine learning project based on MLflow and SageMaker AI
authors:
    - Rafal Turel
tags:
    - MLflow
    - Machine Learning
    - AI
---

## Overview

MLflow is an open source platform for development and tracking of Machine Learning models. This project contains basic AWS infrastructure definitions and some ML code to build and train models, as well as corresponding open source datasets.

## Infrastructure

Terraform is used to deploy the SageMaker AI components such as Domain, Space and MLflow tracking server. It will also create required IAM policies and roles as well as a development S3 bucket.
Bear in mind, backend is configured to use S3 however the bucket itself for storing state file has to be created beforehand.

## Deployment

I used the AWS CodePipeline service mainly to keep the setup secure, avoiding the need to configure security for external tools such as GitHub Actions. It was also rather easy to set up, using the AWS provided worker nodes.
Word of advice, the MLflow tracking server takes around 30 minutes to create so it could potentially timeout a deployment pipeline.

## Notepad setup

The only thing needed to start working is updating the MLflow tracking server's ARN in the notebook. Its declared with mlflow.set_tracking_uri() method. Otherwise you won't be able to upload the training data into MLflow.

## Working with notebooks

I recommend using the Jupyter notepad in SageMaker AI, it starts with everything thats needed to work on this project's notebooks. I used the standard Python3 kernel.
Bear in mind, the tracking server is charged per hour so its a good idea to stop it once done using it. Jupyter is based on instances mounted with EFS but normally you might want to clone the repository directly into the notebook. With a GitHub token you can also push your changes directly from the notebook into a github repository.
I included the Iris dataset however it is not actually being imported because Scikit Learn library comes with it (which is loaded with sklearn.datasets.load_iris() method) however it made sense to have the dataset file present as well in case I would want to see it directly.
The iris and gold_prices notebooks allow to create and train models using logistics and linear regression models. They both transform the data and scale it accordingly. The cities_worldwide notebook is based on a PCA decomposition algorithm. All notebooks use pandas dataframes (although Iris initially uses a standard array).

## Datasets

Iris is a very commonly used dataset for ML learning. It consists of 150 samples of iris flowers, with each sample including four features: sepal length, sepal width, petal length, and petal width. The dataset also specifies the species of each flower, which can be Iris Setosa, Iris Versicolor, or Iris Virginica.
Worldwide_Travel_Cities_Dataset constists of travel information about 560 cities worldwide with data such as average temperature, ideal duration or budget rating.
XAU datasets contain historical data on gold prices from 2004 to June 2025.


## Models

Iris and gold-price models are essentialy aimed at enabling predictions based on existing datasets. We could for example use the gold-price model to make predictions on gold prices for given date. We could also look for trends with price fluctuations and specific times of year.
The cities_worldwide notebook aims at analysing the dataset and measuring it before building a model that can be used for itinerary advice.