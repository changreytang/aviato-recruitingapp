
from PIL import Image
import os
import numpy as np

image = Image.open("/Users/andychen/.Trash/resume_test.jpg") # pulling image
                                                             # image.show() to show image
indexed = np.array(image)                                     # indexed.shape to get array dimen

# training data
blackTraining = [60,61,62,63,64,65,66,67,120,121,122,123,124,125,131,132,133,134,135,196,284,285,286,287,288,315,316,317,318,319,388,389,390,391,392,497,498,499,500,501]
whiteTraining = [93,94,95,96,97,98,99,112,113,114,115,116,260,261,262,263,264,265,275,276,277,278,279,280,293,294,295,296,297,298]
# testing data
blackTesting = [512,513,514,515,516,517,541,542,543,544,545,566,567,568,569,570,571,572]
whiteTesting = [441,442,443,444,445,446,447,604,605,606,607,608,609,610]

# function to compute centroid
def centroidComp(arr):
    allSum=0
    for x in arr:
        lineSum =  0
        for y in range(0,len(indexed[0]),1):
            curVal = indexed[x][y][0]
            if (curVal < 90):  # huge penalty on dark spots
                lineSum = lineSum - 1000 
            else:               
                lineSum = lineSum + indexed[x][y][0]
        lineRes = lineSum/len(indexed[0])
        if (lineRes < 80):     # less penalty on lines with pure black
            allSum = allSum + 80
        else:
            allSum = allSum + lineSum/len(indexed[0])
    return(allSum/len(arr))
   

#blackCentroid = centroidComp(blackTraining)
#whiteCentroid = centroidComp(whiteTraining)
#classificationLine = (blackCentroid+whiteCentroid)/2 + 25  # additional 25 to skew it as it works better

#print("Classification Line: " + str(classificationLine))

# testing on test data
def testingComp(arr,white):
    for x in arr:
        lineSum=0
        for y in range(0,len(indexed[0]),1):
            curVal = indexed[x][y][0]
            if (curVal < 90):
                lineSum = lineSum - 1000
            else:
                lineSum = lineSum + indexed[x][y][0]
        average = lineSum/len(indexed[0])

# image splitting
def isBlack(row):
    lineSum = 0
    for x in range(0,len(indexed[0]),1):
        curVal = indexed[row][x][0]
        if (curVal < 90):
            lineSum = lineSum - 1000
        else:
            lineSum = lineSum + indexed[row][x][0]
    average = lineSum/len(indexed[0])
    if (average < classificationLine):
        return True
    else:
        return False

        
rows = len(indexed)
margin = rows/5
firstMargin = margin
secondMargin = 2*margin
thirdMargin = 3*margin
fourthMargin = 4*margin

print("Boundary 4 HALT")
for x in range (0,12,1):
    print("iterating Boundary 1")
    print("iterating Boundary 2")
    print("iterating Boundary 3")
print("Boundary 2 HALT")
for x in range (0,5,1):
    print("iterating Boundary 1")
    print("iterating Boundary 3")
print("Boundary 1 HALT")
for x in range (0,2,1):
    print("iterating Boundary 3")
print("Boundary 3 HALT")


# original indexes
#print (firstMargin)
#print(secondMargin)
#print(thirdMargin)
#print(fourthMargin)


#while(isBlack(firstMargin)):
#    firstMargin = firstMargin + 1
#while(isBlack(secondMargin)):
#    secondMargin = secondMargin + 1
#while(isBlack(thirdMargin)):
#    thirdMargin = thirdMargin + 1
#while(isBlack(fourthMargin)):
#    fourthMargin = fourthMargin + 1

# shows indexes of white spaces
print (firstMargin)
print(secondMargin)
print(thirdMargin)
print(fourthMargin)

# the 5 sub images
np_1 = indexed[:259]
np_2 = indexed[260:542]
np_3 = indexed[543:813]
np_4 = indexed[814:1055]
np_5 = indexed[1056:]

# open sub images
im1 = Image.fromarray(np_1)
im1.show()

im2 = Image.fromarray(np_2)
im2.show()

im3 = Image.fromarray(np_3)
im3.show()

im4 = Image.fromarray(np_4)
im4.show()

im5 = Image.fromarray(np_5)
im5.show()




