## Facial Recognition using CNN

**Objectives**
The primary objectives of the assignment is to design and write a facial recognition classifier using Convolutional Neural Networks using MATLAB’s neural net library. The whole framework is divided into three major parts: Data acquisition, setting up of layers and determination of accuracy of the neural net used. We already had the ATT face database from the previous assignment so this posed no challenge. The most time consuming part was setting up and choosing appropriate values of training neural net layers. 

**Neural Nets. Understanding** 
The firm grasp of CNN Layeral workings, the types of layers, their intended goals, parameters to tweak and their influence on performance as a whole were mandatory to understand before writing the implementation for our ATT Database set. Just Learning about the layers and their corresponding parameters are not enough to design one. So [1] provided a good layout on the importance of the parameters and even proposed a relational formula establishing connection with variables like Padding, Stride, Output dim and kernel dim. 
My approach for layer setup and hyper-parameter determination is to go from simplest to a complex model. By Simple I mean number of layers, hyper-parameters such that they take small time to estimate the accuracy.

**Legends for Conv Layer hyperparameters**
W = input width
H = input height
Ow = output width
OH = output height
F = Kernel’s Size
K = Number of Filters (Conv’s depth)
S = Stride
P = zero-padding rows

Another decisions to make to gather comparitvely better results 
**Choice of Pooling technique** : Max or average Pooling. That can be manipulated by two parameters Stride and Frame size. The relation of these two variables and the input,outputs dimenstions are as follows [1]: 
Choice of data reducing 

## Read Report.pdf FOR OBSERVATIONS AND CONCLUSION.
