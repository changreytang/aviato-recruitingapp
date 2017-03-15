# Career Fair Recruiting Application
CS189a/b Capstone Project    

# Front End




# Back End
### lambdafunc.js
main function on AWS Lambda. Parses out JSON received from front end and distrubtes relevant information to storages like AWS S3 and Workday.

### json_bodyMapping
application/json body map on API Gateway. Processes the JSON sent from Front end and sends it to AWS Lambda. 

### whitespaceML.py
Simple binary classifier ML that finds valid whitespaces. Currently an individual program that can obtain the the 5 subimages. 
### Client.java
Java client file for making SOAP requests to Workday application - create user applicant objects with this

### putApplicant.wsdl
Wsdl file to generate class files for Workday API - use these class files to create a client to connect to Workday 

Work To Be Done:
1) Integrate into main workflow
2) Run tessseract on individual image in order to generate text data
3) Automate text data input into API call to create applicant

### AWSLib
Playground to test Back End workflow
