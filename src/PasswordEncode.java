
import java.security.MessageDigest;

import java.security.NoSuchAlgorithmException;
import java.util.Base64;

public class PasswordEncode {
	public String PasswordEncoder(String password) {
	String algorithm = "SHA-512" ; // Algorithm chosen for digesting
	 String data = password ; // Any piece of data to be hashed, in this example used command line input
	 MessageDigest md = null ;
	  
	 try {
	     md = MessageDigest.getInstance(algorithm) ; // MessageDigest instance instantiated with SHA-512 algorithm implementation
	 } catch( NoSuchAlgorithmException nsae) {
		 //System.out.println("No Such Algorithm Exception");
		 }
	  
	 byte[] hash = null ;
	  
	 md.update(data.getBytes()) ; // Repeatedly use update method, to add all inputs to be hashed.
	  
	 hash = md.digest() ; // Perform actual hashing
	  
//	 System.out.println("Base64 hash is = " + ) ;
	 return Base64.getEncoder().encodeToString(hash);
	}
}
