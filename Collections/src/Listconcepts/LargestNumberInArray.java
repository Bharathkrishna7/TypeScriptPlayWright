package Listconcepts;

import java.util.Arrays;

public class LargestNumberInArray {

	public static void main(String[] args) {

		int num[] = { 9, 2, 99, 411, 54 };

		int largest = num[0]; 

		for (int i = 1; i < num.length; i++) {

			if (num[i] > largest) { 
				largest = num[i]; 
			}
		}
		System.out.println(largest);
		System.out.println(Arrays.toString(num));
	}

}
