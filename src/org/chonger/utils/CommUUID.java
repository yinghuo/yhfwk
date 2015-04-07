package org.chonger.utils;

import java.util.UUID;

public class CommUUID {
	public static String getUUID() {
		return UUID.randomUUID().toString();
	}

	public static void main(String[] args) {
		System.out.println(getUUID().length());
	}
}