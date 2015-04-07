package org.chonger.utils;

import java.io.UnsupportedEncodingException;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;

import org.apache.commons.codec.binary.Hex;

/**
 * SHA算法辅助工具。
 * 主要为系统提供SHA算法功能，目前应用于用户的密码单向加密。
 * @author Daniel
 *
 */
public class SHAUtils {
	
	//简单混淆字符串
	private static String defKey="twgdhws250";
	private static MessageDigest mdigest;
	static
	{
		try {
			mdigest = MessageDigest.getInstance("SHA-256");
		} catch (NoSuchAlgorithmException e) {
			System.err.println("SHA密码器初始化失败！");
			e.printStackTrace();
		}
	}
	/**
	 * 对指定的值进行SHA加密
	 * @param value 要加密的值
	 * @return
	 * @throws UnsupportedEncodingException
	 */
	public static String CreateSHAKey(String value)
	{
		if(!StringUtil.IsEmpty(value))
		{
			value+=defKey;
			try {
				mdigest.update(value.getBytes("utf-8"));

				byte[] strCode=mdigest.digest();
				String strResult=bytes2Hex(strCode);
				return strResult;
			} catch (UnsupportedEncodingException e) {
				e.printStackTrace();
			}
		}
		return null;
	}
	
	
	private static String bytes2Hex(byte[] bts) {
        String des = "";
        String tmp = null;
        for (int i = 0; i < bts.length; i++) {
            tmp = (Integer.toHexString(bts[i] & 0xFF));
            if (tmp.length() == 1) {
                des += "0";
            }
            des += tmp;
        }
        return des;
    }
}
