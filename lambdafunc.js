var AWS = require('aws-sdk');
var s3 = new AWS.S3();

exports.handler = (event, context, callback) => {
    
    var rawJSON = JSON.stringify(event.body);
    
    console.log(rawJSON);
    
    var uniqueID=""; var imageString="";
    var firstName=""; var middleName=""; var lastName="";
    var phoneNumber=""; var email="";
    var parCount = 0;
    
    
    
    for (var i=0; i<rawJSON.length; ++i) {
        if (rawJSON[i]=='\"') {
            parCount++;
        }
        else if(parCount==1) {
            uniqueID+=rawJSON[i];
        }
        else if (parCount==9) {
            firstName+=rawJSON[i];
        }
        else if (parCount==13) {
            middleName+=rawJSON[i];
        }
        else if (parCount==17) {
            lastName+=rawJSON[i];
        }
        else if (parCount==21) {
            phoneNumber+=rawJSON[i];
        }
        else if (parCount==25) {
            email+=rawJSON[i];
        }
        else if (parCount==29) {
            imageString+=rawJSON[i];
        }
    }
    

    // console.log("image code: " + imageString);

    var bitmap = new Buffer(imageString, 'base64');
    
 
   // image input
    s3.putObject({Bucket: "lambda-api-test-workday", Key: "pic: " + uniqueID + ".png", Body: bitmap}, function(err) {
       if (err)
            console.log(err);
    });
    
   
    // header input
    s3.putObject({Bucket: "lambda-api-test-workday", Key: "header: " + uniqueID+".txt", Body: "Name: " + firstName+" "+middleName+" "+lastName+"\nPhone Number: "+phoneNumber + "\nEmail: " + email }, function(err) {
        if (err)
            console.log( err );
    });

    

    // callback(null, "success from lambda");
    
    // bottom line has to be commented out??????
    // context.succeed(event);
    

    

}
