import java.io.*;
import java.util.*;

/*   code to parse header of text given by tesseract into name, phone number, email, and address
*/

public class StringParser{
	private String name;
	private String phoneNumber;
	private String email;
	private String address;

	public stringParser();

	public void getName()
	{
		return this.name;
	}

	public void getPhoneNumber()
	{
		return this.phoneNumber;
	}

	public void getEmail()
	{
		return this.email;
	}

	public void getAddress()
	{
		return this.address;
	}

	public void setName(String name)
	{
		this.name = name;
	}

	public void getPhoneNumber(String phoneNumber)
	{
		this.phoneNumber = phoneNumbe;
	}

	public void getEmail(String email)
	{
		this.email = email;
	}

	public void getAddress(String address)
	{
		this.address = address;
	}

	public String parseString(String s){

		String[] words = s.split(" ");
		String fullName = "";
		boolean first = true;
		boolean second = false;
		boolean addressInitiated = false;

		for(String word : words) {

			// finding name (first 2 words)
			if (first) {
				fullName += word;
				first = false;
				second = true;
			}

			if (second) {
				fullName += word;
				second = false;
				this.name = fullName;
			}

			// finding email
			if(word.contains('@')) {
				this.email = word;
			}

			// addressed started, keep going until you find zip code
			if (addressInitiated == true) {
				int counter = 0;
				for (int i=0; i<word.length(); i++) {
					if(word.charAt(i) > 48 &&  word.charAt(i) < 57) {
						counter++;
					}
				}
				this.address += word;
				if (counter == 5) {
					addressInitiated = false;
				}

			}

			else {

				// finding phone number
				int numNumbers = 0;
				for(int i = 0; i < word.length(); i++) { 
					if(word.charAt(i) > 48 &&  word.charAt(i) < 57) {
						numNumbers++;
					}
				}

				if (numNumbers == 9) { // word is phone number if it has 9 int in it
					this.phoneNumber = word
				}

				// finidng address
				else if (numNumbers > 3) { // found start of address
					this.address += word;
					this.address += " ";
					addressInitiated = true;
				}
			}


		}
	}
}


