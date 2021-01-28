# Eyes - An AI-Driven, Self-Learning Image-Sharing Platform (CIT's Best Overall Computer-Science Project 2019)

# Quickly:
This project consists of a website that allows users to upload and share photos. These photos are automatically tagged by a deep convolutional neural network in the backend, but can also be tagged by users. High-quality tagged photos are then used as a source-set for continually training the neural-nets that drive the tagging system, effectively perpetuating the learning process indefinitely.

### setup
The setup process for this application *should* be as simple as cloning this repository (and recursively cloning the submodules), and running `docker-compose up`, although it's worth noting that this application has only ever been tested on Ubuntu 18.04, with `CUDA 10` and `nvidia-docker2` pre-installed.

## Introduction
Deep Neural Networks (DNN's), while accurate, must be trained with millions of sample-images before they can classify
image contents effectively. Sourcing images at this scale poses a huge challenge, especially when a diverse dataset is required.
This project presents a novel solution to sourcing new datasets by offering a public image-sharing platform. The platform uses a
Deep Neural Network to tag image contents and can re-train itself with user-uploaded images, ensuring it can adapt to the data it's
most often presented with. The project also implements state-of-the-art techniques that reduce the size-requirements of datasets
by orders of magnitude

## Architecture

The application is comprised of a number of submodules:
 - An API that loads a saved DNN to classify newly-uploaded images.
 - A database that maintains a record of users, images, and image tags.
 - A DNN training environment (known as a training instance) where new neural networks are trained and saved for the purposes of classifying images.
 - A shared filesystem where DNN's and raw image data are stored.


## Metrics
 - DNN performance is measured during training for later analysis.
 - An 18-class DNN trained with 565 images/class reached ~80% accuracy in 779seconds (~13minutes).
 - For most images, classification takes between 2 and 4 seconds, depending on the image size and other factors such as instantaneous GPU load.

## Transfer Learning with DNN's
The feasibility of this project rests heavily on the concept of transfer
learning, which offers the ability to produce specialised DNN's with only
a fraction of the data required to build a DNN from scratch.

To implement transfer learning, a pretrained, publicly-available DNN is
loaded, and its outputs are replaced with new ones, corresponding to the
new classes it will recognize.

The DNN is then trained on a new dataset, at which point it learns
incredibly quickly, as its previous knowledge is adapted to the new task.
The more similar its old and new tasks are, the faster it will adapt.

With this method, a DNN was trained to 80% accuracy with less than 600
images per image class.

## Conclusions
 - A DNN recognising 18 different classes can be trained to 79.9% accuracy with as little as 600 images per class.
 - Adjusting for file size, a request to classify an image takes an average of 3 seconds with mid-range graphics hardware.
 - An image-sharing platform can be a viable method of sourcing data for DNN-training purposes, given a sufficiently-large user base.
