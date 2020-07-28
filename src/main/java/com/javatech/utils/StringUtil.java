package com.javatech.utils;

public class StringUtil{
    public static String makeBeautiful(String str){
    	if(str == null) return "";
        return str.trim().replaceAll("\\s+", " ");
    }
    
    /**
     * 
     * @param str
     * @return true if str is null or empty
     */
    public static Boolean isNullOrEmpty(String str) {
    	if(str == null || str.equals("")) {
    		return true;
    	}
    	return false;
    }
    
    /**
     * 
     * @param strs
     * @return true, if all field is not null or empty.
     */
    public static Boolean checkNullOrEmptyForValidation(String... strs) {
    	for (String str : strs) {
			if(isNullOrEmpty(str)) {
				return false;
			}
		}
    	return true;
    }
    
 // function to generate a random string of length n 
    public static String randomString(int n) 
    { 
  
        // chose a Character random from this String 
        String AlphaNumericString = "ABCDEFGHIJKLMNOPQRSTUVWXYZ"
                                    + "0123456789"
                                    + "abcdefghijklmnopqrstuvxyz"; 
  
        // create StringBuffer size of AlphaNumericString 
        StringBuilder sb = new StringBuilder(n); 
  
        for (int i = 0; i < n; i++) { 
  
            // generate a random number between 
            // 0 to AlphaNumericString variable length 
            int index 
                = (int)(AlphaNumericString.length() 
                        * Math.random()); 
  
            // add Character one by one in end of sb 
            sb.append(AlphaNumericString 
                          .charAt(index)); 
        } 
  
        return sb.toString(); 
    } 
}