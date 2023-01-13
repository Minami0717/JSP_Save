package gall;

import java.util.ArrayList;

public class Test {
	
	public static void main(String[] args) {
		ArrayList<String> list = new ArrayList<String>();
		list.add("t");
		list.add("t");
		list.add("t");
		list.remove("t");
		for (int i = 0; i < list.size(); i++) {
			System.out.println(list.get(i));
			
		}
	}
}
