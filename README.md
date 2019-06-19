# Eyes - An AI-Driven, Self-Learning Image-Sharing Platform

## (CIT's Best Overall Computer-Science Project 2019)

This is a fourth-year project repository consisting of submodule git repositories that make up the platform.


## ...what?
Eyes is the working title for my final-year project - a means of sourcing new data for image-recognition deep neural networks.
Eyes is made up of a simple database (for storing image data uploaded via the API), a Keras-based training environment where new classifiers are generated, and a Flask-based API that classifies uploaded images via models trained in the aforementioned training env.

## setup
The setup process for this application *should* be as simple as cloning this repository (and recursively cloning the submodules), and running `docker-compose up`, although it's worth noting that this application has only ever been tested on Ubuntu 18.04, with `CUDA 10` and `nvidia-docker2` pre-installed.
