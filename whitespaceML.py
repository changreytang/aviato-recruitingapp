from PIL import Image
import os
import numpy as np

image = Image.open("/Users/andychen/.Trash/resume_test.jpg") # pulling image
                                                             # image.show() to show image
indexed = np.array(image)                                     # indexed.shape to get array dimen

# training data
blackTraining = [x.strip() for x in open('blackTraining.txt')] 
whiteTraining = [x.strip() for x in open('whiteTraining.txt')] 
# testing data
blackTesting = [x.strip() for x in open('blackTesting.txt')] 
whiteTesting = [x.strip() for x in oepn('whiteTesting.txt')] 

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
   

blackCentroid = centroidComp(blackTraining)
whiteCentroid = centroidComp(whiteTraining)
classificationLine = (blackCentroid+whiteCentroid)/2 + 25  # additional 25 to skew it as it works better

print("Classification Line: " + str(classificationLine))

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
        if (white):  # white spot test
            if (average > classificationLine):
                print("correct output on line: " + str(x))
            else:
                print("WRONG VALUE ON LINE: " +str(x))
        else:   # black spot test
            if (average < classificationLine):
                print("correct output on line: " + str(x) + " val: " + str(average))
            else:
                print("WRONG VALUE ON LINE: " +str(x) + " val: " + str(average))

# comment these next 2 lines in real situation. Only a measure of our true positives
testingComp(whiteTesting,True)
testingComp(blackTesting,False)

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

# original indexes
#print (firstMargin)
#print(secondMargin)
#print(thirdMargin)
#print(fourthMargin)

# basic iteration of finding whitespace
# change to back and forth iteration. Faster computation
while(isBlack(firstMargin)):
    firstMargin = firstMargin + 1
while(isBlack(secondMargin)):
    secondMargin = secondMargin + 1
while(isBlack(thirdMargin)):
    thirdMargin = thirdMargin + 1
while(isBlack(fourthMargin)):
    fourthMargin = fourthMargin + 1

# shows indexes of white spaces
print (firstMargin)
print(secondMargin)
print(thirdMargin)
print(fourthMargin)

# the 5 sub images
np_1 = indexed[:firstMargin]
np_2 = indexed[firstMargin:secondMargin]
np_3 = indexed[secondMargin:thirdMargin]
np_4 = indexed[thirdMargin:fourthMargin]
np_5 = indexed[fourthMargin:]

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


