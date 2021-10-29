package com.sist.utils;

import javax.crypto.Cipher;
import javax.crypto.SecretKey;
import javax.crypto.SecretKeyFactory;
import javax.crypto.spec.IvParameterSpec;
import javax.crypto.spec.PBEKeySpec;
import javax.crypto.spec.SecretKeySpec;

import java.io.IOException;
import java.security.GeneralSecurityException;
import java.security.NoSuchAlgorithmException;
import java.security.spec.InvalidKeySpecException;
import java.util.Base64;

public class Encryption {
	
	private static final byte[] salt = new String("12345678").getBytes();
	private static final int iterationCount = 40000;
	private static final int keyLength = 128;

	public static SecretKeySpec createSecretKey(char[] password)
			throws NoSuchAlgorithmException, InvalidKeySpecException {
		SecretKeyFactory keyFactory = SecretKeyFactory.getInstance("PBKDF2WithHmacSHA512");
		PBEKeySpec keySpec = new PBEKeySpec(password, salt, iterationCount, keyLength);
		SecretKey keyTmp = keyFactory.generateSecret(keySpec);

		return new SecretKeySpec(keyTmp.getEncoded(), "AES");
	}

	public static String decrypt(String string, SecretKeySpec key) throws GeneralSecurityException, IOException {
		String iv = string.split(":")[0];
		String property = string.split(":")[1];
		Cipher pbeCipher = Cipher.getInstance("AES/CBC/PKCS5Padding");
		pbeCipher.init(Cipher.DECRYPT_MODE, key, new IvParameterSpec(base64Decode(iv)));

		return new String(pbeCipher.doFinal(base64Decode(property)), "UTF-8");
	}

	private static byte[] base64Decode(String property) throws IOException {

		return Base64.getDecoder().decode(property);
	}
}