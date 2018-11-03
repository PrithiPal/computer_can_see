## Objective

The objective of the assignment is to assign an address to the cigarette buds present in an image such that a robot with the following program would be able to pick up. To accomplish the task, a MATLAB code with the help of built-in image processing tools are used. 

## Assumptions
There are a few assumptions the algorithm take considerations into: 

**Height of Camera**: The threshold and morphological values used for doing the pre-processing and image segmentation may differ from what is expected. 

•	The algorithm expects the average height to take photograph as used in given sample images (except one). Cigarette appears smaller and thus diminishes when thresholding when observed from a greater height. 
•	Height may also influence the lower, upper bound constant. They refer to range within which total no. of pixels of an object lie. Higher height photos may bring this range down and vice-versa. 
 
**Color of the Bud**: Within the pre-processing phase, one segment specially is attributed towards picking ‘White’ or ‘Mustard’

**Lighting**: This distorts the ideal color depth algorithm performs in. The proper lighting is defined where the image produces greater contrast between cigarette bud and surroundings. 

**Cigarette Orientation**: The algorithm checks for the resembles of segmented objects from a rectangle. Closeness to vertical and horizontal orientation increases likeliness to find the cigarette bud.

**Cigarettes quantity** : The number of cigarette present in the image. 

## Constants
The limitations of the algorithm to perform in all possible scenarios are listed above in the assumption. These assumptions arises from the number of pre-determined constants. These so-called variables are chosen to be constants because we have no possibility of knowing certain physical attributes of place in the image that drives their value. 
-	**Global threshold value**
- **Morphological Opening**
- **Cigarette bud size (lower and upper bound)**
-	**Median Filter window size**
-	**No of Cigarettes**
-	**color**

Amongst these constants, user is required to input only one officially which is the noOfCiagrettes. The other ones have more to do with the performance of the algorithm. However we will discuss in the later part of the document what more information could be provided that may help choose more good values for these constants. 
 **find_cigrettes (thresh_val,morphVal,[lower upper],medianVal, noOfCiagrettes,color)**
 
## App Design

To help choose the correct values for some pre-processing operations such as morphology and image-segmentation (thresholding), I wrote a GUI in the MATLAB App Designer for experimenting. It has three different tabs, each for morphology, thresholding and edge detection. Here I can open an image, perform the desired operation and save the result.

## Algorithm

**Pre-processing (feature-reduction)**
Grayscale: Extracting only one component out of the RGB image to 2D grayscale.

**Choosing morphVal and threshVal** : As I mentioned before, I used the GUI made above to come up with the best likely range for the morphVal and threshVal for each sample image. 

**FAILED** : Noise removal: Median Filter and Opening (morph): Both the filter allowed to filter out the noise caused by the irregularities appeared through lighting. However the combined performance of these two filters depends upon the value of their neighbor windows chosen. Initially I performed the erosion on the grayscale which in turn preceded opening as I tried later on. 
**REPLACED** BY White/Mustard cigarette identification: Because I felt like the thresholding and the noise removal need too much trivial values to be able to cater to image’s needs, I replaced them with the White cigarette detection philosophy.

**Global Thresholding**: Adaptive thresholding simply just does not works here. It goes good in edge detection but my model has avoided doing edges. So global thresholding makes more sense here as this assignment is simpler version of object recognition. After this step, Binary image is obtained as an output. 

## Segmentation

**Connected components (CC)**: We likely have our binary image now. So the next step is the identification of the possible physical objects present in the environment. To achieve this, I used bwconncomp() function to divide up the image into finite recognized images.  

**Filter 1**:  CC area:  Upto this time, we have still retained a number of noises that has been identified as connected components. So here we disregards many cc based upon their comprising number of Pixels. The comp_size (Threshold image) exactly does this and returns an array of sizes for each cc. Then by Trial and error, I found out that for majority of cases, cigarette buds are found with noOfpixel of cc between 1000 and 4000. Hence I choose these specific lower and upper bound to narrow down our search for buds. 

**Filter 2**:  Rectangularity: Only size can’t be the criteria (unless I know exactly how big the cigarette bud is). Thus I embarked upon the idea of shape recognition and because each image varies the cigarette bud’s shape (orientation, actual size, height of camera), I am not able to correctly perform upto 100 percent accuracy. However the strategy(atleast in theory) is used is to compare cc’s ratio of actual area and perimeter(calculated through regionprops() )  with calculated area and perimeter using width, height from Bounding Box property of regionprops(). 
Then pick N(noOfCiagrettes)no. of cc which have least amount of error among all the cc in the Filter 1 stage. Or in other words, pick N cc with minimum errors. 


The shortcoming of this rectangularity tactic is that it does not logically accounts for all rectangle made from cigarette identification. For instance a cigarette bud oriented at 45 degrees would also yield a bounding box (rectangle) and but the rectangularity is very less for this one (appears square due to cigarette touching diagonally).

Best case scenario for us is when cigarette bud are aligned approximately horizontally or vertically, they give better rectangle. This influences Filter 2’s decision of picking good rectangles. 

## Results

It is impossible for the algorithm to get everything right provided with fixed variables. Each photos dictates how much the bound for cc size, cigarette bud color or number of cigarettes are present. So Below I summarized the performance provided with the trivial values. 

###### Image Name	noOfCiagrette	Color	sizeBounds (lower,upper)	Result (fp = false-positives true)
**Ground zoom**	3	White	[50,100]	2 detected, fp
**Ground, leaves**	1	White	[1000,4000]	1 detected
**Plain ground**	1	White(mustard failed)	[1000,4000]	1 detected
**Three buds rocks**	3	White	[500,4000]	3 detected
**Rocks with wall**	1	Mustard	[10,4000]	1 detected
**texture**	1	Mustard	[10,4000]	1 detected





