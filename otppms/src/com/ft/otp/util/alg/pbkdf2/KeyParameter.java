package com.ft.otp.util.alg.pbkdf2;

public class KeyParameter implements CipherParameters {
	
	private byte[] key;

	public KeyParameter(byte[] key) {
		this(key, 0, key.length);
	}

	public KeyParameter(byte[] key, int keyOff, int keyLen) {
		this.key = new byte[keyLen];

		System.arraycopy(key, keyOff, this.key, 0, keyLen);
	}

	public byte[] getKey() {
		return key;
	}
}
