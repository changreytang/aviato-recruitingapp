# Career Fair Recruiting Application
CS189a/b Capstone Project    
By: Matthew Cheung, Andy Chen, Rey Tang, John Lau, Tim Liew

## Problem
In every career fair today, the process of recruiting interns and new hires is purely manual and laborious. This brings about delays in the entire process: receiving resumes, evaluating applicant information, and finally reaching out to candidates. The solution we propose is a mobile application that combines and captures resumes, notes, and other information from candidates and recruiters, parses that data, creates an online record, and saves it into the cloud. Essentially, the project will improve efficiency in the in- person recruiting process.

## Goals/Objectives
The biggest goal that our application hopes to achieve is to expedite and make more efficient the recruiting process at career fairs. The mobile (iOS) application should be able to easily parse pictures of resumes taken at career fairs and automatically fill out the company’s internal application. The recruiter should be able to easily take a picture of the resume and continue the conversation with the applicant while our app quickly and accurately parses the information. The recruiter can then add any relevant notes about the applicant before finally submitting the application into the company database. This should all be a seamless process in which the recruiter should not be stopping and waiting for our app when talking to the applicant, that is the ultimate goal. 

## Front End
### iOS
Mobile application created with a combination of Objective-C and Swift. Developed and designed application UI using XCode and Canva.

Work To Be Done:
1) Integrate a list view of applications created for recruiters to easily access/edit current applications
2) Change from using Tesseract to Workday's Text Parser on Front End
3) Create Android version of mobile application

## Back End
### lambdafunc.js
Main function on AWS Lambda. Parses out JSON received from front end and distrubtes relevant information to storages like AWS S3 and Workday.

### json_bodyMapping
Application/json body map on API Gateway. Processes the JSON sent from Front end and sends it to AWS Lambda. 

### whitespaceML.py
Simple binary classifier ML that finds valid whitespaces. Currently an individual program that can obtain the the 5 subimages. 

Work To Be Done:
1) Integrate into main workflow
2) Run tessseract on individual image in order to generate text data


### Client.java
Java client file for making SOAP requests to Workday application - create user applicant objects with this

### putApplicant.wsdl
Wsdl file to generate class files for Workday API - use these class files to create a client to connect to Workday

Work To Be done:
1) Be able to draw data and map to correct areas of applicant object
2) Upload code to Amazon Lambda to be called after parsing on back-end
3) Automate text data input into API call to create applicant 

### AWSLib
Playground to test Back End workflow
