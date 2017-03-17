package com.hanzhou.www;

import java.util.UUID;

public class UuidGenerator {
	
	/**
	 * uuid生成工具
	 * @return
	 */
	public static String generateor(){
		return UUID.randomUUID().toString().replaceAll("-", "");		
	}

}
