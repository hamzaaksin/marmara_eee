# -*- coding: utf-8 -*-

import numpy as np
from numpynet.layer import Dense, ELU, ReLU, SoftmaxCrossEntropy
from numpynet.function import Softmax
from numpynet.utils import Dataloader, one_hot_encoding, load_MNIST
from sklearn.metrics import accuracy_score
import matplotlib.pyplot as plt

IntType = np.int64
FloatType = np.float64


class Model(object):
    """Model Your Deep Neural Network
    """
    def __init__(self, input_dim, output_dim):
        """__init__ Constructor

        Arguments:
            input_dim {IntType or int} -- Number of input dimensions
            output_dim {IntType or int} -- Number of classes
        """
        self.input_dim = input_dim
        self.output_dim = output_dim
        self.loss_fn = SoftmaxCrossEntropy(axis=-1)
        self.build_model()

    def build_model(self):
        """build_model Build the model using numpynet API
        """
        # TODO: Finish this function
        raise NotImplementedError

    def __call__(self, X):
        """__call__ Forward propogation of the model

        Arguments:
            X {np.ndarray} -- Input batch

        Returns:
            np.ndarray -- The output of the model. 
                You can return the logits or probits, 
                which depends on the way how you structure 
                the code.
        """
        # TODO: Finish this function
        raise NotImplementedError

    def bprop(self, logits, labels, istraining=True):
        """bprop Backward propogation of the model

        Arguments:
            logits {np.ndarray} -- The logits of the model output, 
                which means the pre-softmax output, since you need 
                to pass the logits into SoftmaxCrossEntropy.
            labels {np,ndarray} -- True one-hot lables of the input batch.

        Keyword Arguments:
            istraining {bool} -- If False, only compute the loss. If True, 
                compute the loss first and propagate the gradients through 
                each layer. (default: {True})

        Returns:
            FloatType or float -- The loss of the iteration
        """

        # TODO: Finish this function
        raise NotImplementedError

    def update_parameters(self, lr):
        """update_parameters Update the parameters for each layer.

        Arguments:
            lr {FloatType or float} -- The learning rate
        """
        # TODO: Finish this function
        raise NotImplementedError


def train(model,
          train_X,
          train_y,
          val_X,
          val_y,
          max_epochs=20,
          lr=1e-3,
          batch_size=16,
          metric_fn=accuracy_score,
          **kwargs):
    """train Train the model

    Arguments:
        model {Model} -- The Model object
        train_X {np.ndarray} -- Training dataset
        train_y {np.ndarray} -- Training labels
        val_X {np.ndarray} -- Validation dataset
        val_y {np.ndarray} -- Validation labels

    Keyword Arguments:
        max_epochs {IntType or int} -- Maximum training expochs (default: {20})
        lr {FloatType or float} -- Learning rate (default: {1e-3})
        batch_size {IntType or int} -- Size of each mini batch (default: {16})
        metric_fn {function} -- Metric function to measure the performance of 
            the model (default: {accuracy_score})
    """
    # TODO: Finish this function
    raise NotImplementedError


def inference(model, X, y, batch_size=16, metric_fn=accuracy_score, **kwargs):
    """inference Run the inference on the given dataset

    Arguments:
        model {Model} -- The Neural Network model
        X {np.ndarray} -- The dataset input
        y {np.ndarray} -- The sdataset labels

    Keyword Arguments:
        metric {function} -- Metric function to measure the performance of the model 
            (default: {accuracy_score})

    Returns:
        tuple of (float, float): A tuple of the loss and accuracy
    """

    # TODO: Finish this function
    raise NotImplementedError




def main():
    print('loading data #####')
    train_X, train_y = load_MNIST(path ='dataset/',name="train")
    val_X, val_y = load_MNIST(path = 'dataset/', name="val")
    test_X = load_MNIST(path = 'dataset/', name="test")
    test_loss, test_acc = None, None
    print('loading data complete #####')

    # TODO: 1. Build your model
    # TODO: 2. Train your model with training dataset and
    #       validate it  on the validation dataset
    # TODO: 3. Test your trained model on the test dataset
    #       you need have at least 95% accuracy on the test dataset to receive full scores

    # Your code starts here

    #NOTE: WE HAVE PROVIDED A SKELETON FOR THE MAIN FUNCTION. FEEL FREE TO CHANGE IT AS YOU WISH, THIS IS JUST A SUGGESTED FORMAT TO HELP YOU.

    batchSize = 32
    learningRate = 0.2 
    model = Model(input_dim = 784,output_dim = 10)
    model.build_model()
    print('Model built #####')
    model, train_acc, train_loss, val_acc, val_loss = train(model, train_X, train_y, val_X, val_y, max_epochs=200, lr=learningRate, batch_size=batchSize, metric_fn=accuracy_score)
    print('Training complete #####')

    # Plot of train and val accuracy vs iteration
    plt.figure(figsize=(10,7))
    plt.ylabel('Accuracy')
    plt.xlabel('Number of iterations')
    plt.title('Accuracy vs number of iterations')
    plt.plot(np.linspace(0,199,200), train_acc, label = 'Train accuracy across iterations')
    plt.plot(np.linspace(0,198,100), val_acc, label = 'Val accuracy across iterations')
    plt.legend(loc = 'upper right')
    plt.show()

    # Plot of train and val loss vs iteration
    plt.figure(figsize=(10,7))
    plt.ylabel('Loss')
    plt.xlabel('Number of iterations')
    plt.title('Loss vs number of iterations')
    plt.plot(np.linspace(0,199,200), train_loss, label = 'Train loss across iterations')
    plt.plot(np.linspace(0,198,100), val_loss, label = 'Val loss across iteration')
    plt.legend(loc='upper right')
    plt.show()

    # Implement inference such that you predict the labels and also evaluate val_accuracy and loss if true labels are provided
    val_acc, val_loss, val_pred = inference(model, val_X, val_y, batch_size = batchSize)

    # Inference on test dataset without labels

    #Implement inference function so that you can return the test prediction output and save it in test_pred. You are allowed to create a different function to generate just the predicted labels.
    test_pred = inference(model, test_X, batch_size = batchSize)
    
    save_csv(test_pred)
    # Your code ends here

    print("Validation loss: {0}, Validation Acc: {1}%".format(val_loss, 100 * val_acc))
    if val_acc > 0.95:
        print("Your model is well-trained.")
    else:
        print("You still need to tune your model")


if __name__ == '__main__':
    main()
