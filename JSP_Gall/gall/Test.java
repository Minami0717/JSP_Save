package gall;

import java.util.ArrayList;

public class Test {
	
	public static void main(String[] args) {
		ArrayList<Integer> list = new ArrayList<Integer>();
		list.add(1);
		list.add(2);
		list.add(3);
		for (int i = 0; i < list.size(); i++) {
			System.out.println(list.get(i));
			
		}
	}
}
