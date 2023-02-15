package gall;

import java.time.LocalDate;
import java.util.ArrayList;
import java.util.Random;

public class Test {
	
	public static void main(String[] args) {
		System.out.println(LocalDate.now());
		Random random = new Random();
		for (int i = 0; i < 10; i++) {
			System.out.println(random.nextInt(5));
		}
	}
}
