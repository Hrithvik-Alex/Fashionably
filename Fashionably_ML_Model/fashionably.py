###### Import Libs ######
from __future__ import print_function

import cv2
import numpy as np
import sys
import shutil

import keras
from keras.datasets import fashion_mnist
from keras.preprocessing import image
from keras.preprocessing.image import ImageDataGenerator, img_to_array, load_img
from keras.models import Sequential, load_model
from keras.backend import resize_images
from keras.layers import Dense, Dropout, Activation, Flatten
from keras.layers import Conv2D, ZeroPadding2D, MaxPooling2D
from keras.utils.vis_utils import plot_model
from keras import models
from keras_applications import mobilenet_v2
from keras.utils import np_utils
from keras.applications.vgg16 import VGG16
from keras.preprocessing.image import load_img
from keras.preprocessing.image import img_to_array
from keras.applications.vgg16 import preprocess_input
from keras.applications.vgg16 import decode_predictions
from keras.applications.vgg16 import VGG16

from PIL import Image

from keras.optimizers import RMSprop, SGD
from keras.callbacks import ModelCheckpoint, EarlyStopping, ReduceLROnPlateau

import scipy
import pylab as pl

import os
from os import listdir
from os.path import isfile, join

import matplotlib.cm as cm
import matplotlib.image as mpimg
import matplotlib.pyplot as plt


import sklearn
from sklearn.metrics import classification_report, confusion_matrix
import numpy as np
from keras.models import load_model

import coremltools
###### Import Done ######


# Load the fashion-mnist
(x_train, y_train), (x_test, y_test) = fashion_mnist.load_data()

# Show Image
    # plt.imshow(x_train[5])

x_train = x_train.astype('float32') / 255
x_test = x_test.astype('float32') / 255


# Split training and testing
# 5000 into validation set and 55,000 for train set
(x_train, x_valid) = x_train[5000:], x_train[:5000]
(y_train, y_valid) = y_train[5000:], y_train[:5000]

# Reshape input data from (28, 28) to (28, 28, 1)
w, h = 28, 28
x_train = x_train.reshape(x_train.shape[0], w, h, 1)
x_valid = x_valid.reshape(x_valid.shape[0], w, h, 1)
x_test = x_test.reshape(x_test.shape[0], w, h, 1)

# One-hot encode the labels
y_train = np_utils.to_categorical(y_train)
y_valid = np_utils.to_categorical(y_valid)
y_test = np_utils.to_categorical(y_test)

# Print training set shape
    #print("x_train shape:", x_train.shape, "y_train shape:", y_train.shape)

# Print the number of training, validation, and test datasets
    #print(x_train.shape[0], 'train set')
    #print(x_valid.shape[0], 'validation set')
    #print(x_test.shape[0], 'test set')

# Build NN
    
# Must define the input shape in the first layer of the neural network
model = Sequential()
model.add(Conv2D(filters=64, kernel_size=2, padding='same', activation='relu', input_shape=(28,28,1)))
model.add(MaxPooling2D(pool_size=2))
model.add(Dropout(0.3))
model.add(Conv2D(filters=32, kernel_size=2, padding='same', activation='relu'))
model.add(MaxPooling2D(pool_size=2))
model.add(Dropout(0.3))
model.add(Flatten())
model.add(Dense(256, activation='relu'))
model.add(Dropout(0.5))
model.add(Dense(10, activation='softmax'))
 
# Take a look at the model summary
model.summary()

opt = keras.optimizers.rmsprop(lr=0.0001, decay=1e-6)
print(model.summary())

checkpoint = ModelCheckpoint("/Users/Scotia/Desktop/StarterHacks/model.h5",
                             monitor="val_loss",
                             mode="min",
                             save_best_only = True,
                             verbose=1)

earlystop = EarlyStopping(monitor = 'val_loss', 
                          min_delta = 0, 
                          patience = 3,
                          verbose = 1)

reduce_lr = ReduceLROnPlateau(monitor = 'val_loss',
                              factor = 0.2,
                              patience = 3,
                              verbose = 1,
                              min_delta = 0.0001)

callbacks = [earlystop, checkpoint, reduce_lr]


model.compile(loss = 'categorical_crossentropy',
              optimizer = RMSprop(lr = 0.001),
              metrics = ['accuracy'])

epochs = 25
batch_size = 32

hist = model.fit(x_train,
          y_train,
          batch_size = batch_size,
          epochs = epochs,
          verbose = 1,
          callbacks=callbacks,
          validation_data = (x_test, y_test))



######## RESULT GRAPHING ########
score = model.evaluate(x_test, y_test, verbose=0)
print('Test loss:', score[0])
print('Test accuracy:', score[1])

# Plotting our loss charts
history_dict = hist.history

loss_values = history_dict['loss']
val_loss_values = history_dict['val_loss']
epochs = range(1, len(loss_values) + 1)

line1 = plt.plot(epochs, val_loss_values, label='Validation/Test Loss')
line2 = plt.plot(epochs, loss_values, label='Training Loss')
plt.setp(line1, linewidth=2.0, marker = '+', markersize=10.0)
plt.setp(line2, linewidth=2.0, marker = '4', markersize=10.0)
plt.xlabel('Epochs')
plt.ylabel('Loss')
plt.grid(True)
plt.legend()
plt.show()

# Plotting our accuracy charts
history_dict = hist.history

acc_values = history_dict['acc']
val_acc_values = history_dict['val_acc']
epochs = range(1, len(loss_values) + 1)

line1 = plt.plot(epochs, val_acc_values, label='Validation/Test Accuracy')
line2 = plt.plot(epochs, acc_values, label='Training Accuracy')
plt.setp(line1, linewidth=2.0, marker = '+', markersize=10.0)
plt.setp(line2, linewidth=2.0, marker = '4', markersize=10.0)
plt.xlabel('Epochs')
plt.ylabel('Accuracy')
plt.grid(True)
plt.legend()
plt.show()

##### Save #####
model.save("/Users/Scotia/Desktop/StarterHacks/model_v2.h5")
print("Model Saved")

#Load
#loaded_model = load_model("/Users/Scotia/Desktop/Fashionably/Fashionably_ML_Model/fashionably_model.h5")
#print("Model Loaded")

loaded_model = VGG16(weights="imagenet")
loaded_model = VGG16()

## TEST ##

image = load_img('/Users/Scotia/Desktop/Clothing/shoes.jpg', target_size=(224, 224))
image = img_to_array(image)
image = image.reshape((1, image.shape[0], image.shape[1], image.shape[2]))
# prepare the image for the VGG model
image = preprocess_input(image)
# predict the probability across all output classes
x = loaded_model.predict(image)
# convert the probabilities to class labels
label = decode_predictions(x)
# retrieve the most likely result, e.g. highest probability
for i in range(5):
    print(label[0][i])



# Test
def draw_test(name, pred, input_im):
    BLACK = [0,0,0]
    expanded_image = cv2.copyMakeBorder(input_im, 0, 0, 0, imageL.shape[0] ,cv2.BORDER_CONSTANT,value=BLACK)
    expanded_image = cv2.cvtColor(expanded_image, cv2.COLOR_GRAY2BGR)
    cv2.putText(expanded_image, str(pred), (152, 70) , cv2.FONT_HERSHEY_COMPLEX_SMALL,4, (0,255,0), 2)
    cv2.imshow(name, expanded_image)


for i in range(0,10):

    #rand = np.random.randint(0,len(x_test))
    #input_im = x_test[0]
    
    #input_im = cv2.imread("/Users/Scotia/Desktop/Clothing/pls.png")
    
    input_im = Image.open("/Users/Scotia/Desktop/Clothing/shirt.jpg")
    input_im = input_im.resize((28,28))
    input_im = input_im.convert('L') #makes it greyscale
    input_im = np.asarray(input_im)

    imageL = cv2.resize(input_im, None, fx=4, fy=4, interpolation = cv2.INTER_CUBIC)
    cv2.imshow("Test Image", imageL)
    
    input_im = input_im.astype('float32') / 255
    
    input_im = input_im.reshape(1,28,28,1)
    

    # Get Prediction
    res = str(loaded_model.predict(input_im, 1, verbose = 0)[0])

    draw_test("Prediction", res, imageL)
    cv2.waitKey(0)

cv2.destroyAllWindows()