package workday.com;
 
import java.rmi.RemoteException;


import javax.xml.namespace.QName;
import javax.xml.soap.MessageFactory;
import javax.xml.soap.SOAPBody;
import javax.xml.soap.SOAPConnection;
import javax.xml.soap.SOAPConnectionFactory;
import javax.xml.soap.SOAPElement;
import javax.xml.soap.SOAPEnvelope;
import javax.xml.soap.SOAPException;
import javax.xml.soap.SOAPMessage;
import javax.xml.soap.SOAPPart;

import org.apache.axis.message.PrefixedQName;
import org.apache.axis.message.SOAPHeaderElement;

import java.io.*;

#USERNAME 
#PASSWORD 


public class Client {
	
	public static void main(String args[]) {
		//service = new service locator
		//fill in info using the class files
		//call operation
		
		//Put in header request info: Username and password
		//wss security token
		
		SOAPHeaderElement wsseSecurity = new SOAPHeaderElement(new PrefixedQName("http://docs.oasis-open.org/wss/2004/01/oasis-200401-wss-wssecurity-secext-1.0.xsd","Security", "wsse"));
        wsseSecurity.setMustUnderstand(true);
        wsseSecurity.setActor(null);
        SOAPElement sub = null;
		try {
			sub = wsseSecurity.addChildElement("UsernameToken");
		} catch (SOAPException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}
        sub.setAttribute("xmlns:wsu", "http://schemas.xmlsoap.org/ws/2002/07/utility");
        SOAPElement userElement = null;
		try {
			userElement = sub.addChildElement(#USERNAME);
		} catch (SOAPException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}
        try {
			userElement.addTextNode("superuser@super");
		} catch (SOAPException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}         
        SOAPElement pwdElement = null;
		try {
			pwdElement = sub.addChildElement("Password");
		} catch (SOAPException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}
        pwdElement.setAttribute("Type", "http://docs.oasis-open.org/wss/2004/01/oasis-200401-wss-username-token-profile-1.0#PasswordText");
        try {
			pwdElement.addTextNode(#PASSWORD);
		} catch (SOAPException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}
       

        //TODO: fill in body of SOAP request
        
        //create applicant object, then add info to the object.
        Applicant_Data_WWSType applicant_data = new Applicant_Data_WWSType();
        
        //applicant should contain: personal data, contact data, 
        //email address data, usage data, type data (type reference inside this)
        
        //personal data
        Personal_Information_DataType personalData = new Personal_Information_DataType();
        
        
        Person_Name_DataType nameData = new Person_Name_DataType();
        
        Legal_Name_DataType legalNameData = new Legal_Name_DataType();
        
        CountryObjectIDType[] countryObject = new CountryObjectIDType[1];
        countryObject[0] = new CountryObjectIDType();
        
        //"ISO_3166-1_Alpha-2_Code"
        
        countryObject[0].setType("ISO_3166-1_Alpha-2_Code");
        countryObject[0].set_value("US");
        
 
        Person_Name_Detail_DataType nameDetails = new Person_Name_Detail_DataType();
        nameDetails.setFirst_Name("Andrew");
        nameDetails.setLast_Name("Huang");
//        nameDetails.setMiddle_Name("W");
        
        nameDetails.setReporting_Name("ignore this");
        
        //how to add in country?? Ignore for now possibly
        nameDetails.setCountry_Reference(countryObject);      
        
        legalNameData.setName_Detail_Data(nameDetails);
        nameData.setLegal_Name_Data(legalNameData);
        //name data is now set
        personalData.setName_Data(nameData);
        
        //contact data should contain phone data, email address data
        Contact_Information_DataType contactData = new Contact_Information_DataType();
        
        //phone data
        Phone_Information_DataType phoneData[] = new Phone_Information_DataType[1];
        
        phoneData[0] = new Phone_Information_DataType();
        phoneData[0].setArea_Code("510");
        phoneData[0].setPhone_Number("232-1542");
        
        //TODO: phone Device Reference?
        
        //TODO: set usage data?
        
        //phone data is set
        //contactData.setPhone_Data(phoneData);
        
        //email address data
        Email_Address_Information_DataType[] emailData = new Email_Address_Information_DataType[1];
        
        emailData[0] = new Email_Address_Information_DataType();
        emailData[0].setEmail_Address("andrewhuang@umail.ucsb.edu");
        
        //TODO: set usage data?
        Communication_Method_Usage_Information_DataType[] usage_Data = new Communication_Method_Usage_Information_DataType[1];
        usage_Data[0] = new Communication_Method_Usage_Information_DataType();
        usage_Data[0].set_public(true);
        
        Communication_Usage_Type_DataType[] type_Data = new Communication_Usage_Type_DataType[1];
        type_Data[0] = new Communication_Usage_Type_DataType();
        type_Data[0].setPrimary(true);
        
        Communication_Usage_TypeObjectIDType[] type_Reference = new Communication_Usage_TypeObjectIDType[1];
        type_Reference[0] = new Communication_Usage_TypeObjectIDType();
        type_Reference[0].setType("Communication_Usage_Type_ID");
        type_Reference[0].set_value("Home");
        
        type_Data[0].setType_Reference(type_Reference);
        
        usage_Data[0].setType_Data(type_Data);
        
        emailData[0].setUsage_Data(usage_Data);
        
        contactData.setEmail_Address_Data(emailData);
        
        //body of SOAP message is now sent, now send over to endpoint along with the secure header
        
        //contactData is of type Contact_Information_DataType
        //add to personal data, then applicant object
        
        personalData.setContact_Data(contactData);
        applicant_data.setPersonal_Data(personalData);
        
        //add applicant to request (applicant is of type Applicant_Data_WWSType)
        
        RecruitingPortProxy port = new RecruitingPortProxy();
        
        Put_Applicant_RequestType body = new Put_Applicant_RequestType();
		body.setApplicant_Data(applicant_data);
		
		try {
			Put_Applicant_ResponseType createdApplicant = port.put_Applicant(body, wsseSecurity);
			System.out.print("created applicant" + createdApplicant.getApplicant_Reference()[0].get_value());
		} catch (RemoteException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	
	
	}

}
