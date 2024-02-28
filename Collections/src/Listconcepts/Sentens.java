package Listconcepts;

public class Sentens {

	public static void main(String[] args) {

		String s="My name is bharath krishna and this 2022 year";
		
		String newstatement=s.replaceAll("[^0-9]", "");
		System.out.println(newstatement);
		
		String nospaces=s.replaceAll("[^A-Za-z0-9]", "");
      System.out.println(nospaces);
	}

}
