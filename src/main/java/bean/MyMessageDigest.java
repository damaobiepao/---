package bean;

import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;

public class MyMessageDigest {
	public static String getMD5(String passwdord) throws NoSuchAlgorithmException {
		//16λԭʼ����
		byte[] originalpassword = MessageDigest.getInstance("MD5").digest(passwdord.getBytes());
		//����32λʮ����������
		StringBuffer resultBuffer=new StringBuffer(33);
		for (byte b : originalpassword) {
			String tem = Integer.toHexString(b&0xff);
			if(tem.length()==1)
				resultBuffer.append(0);
			resultBuffer.append(tem);
		}
		return resultBuffer.toString();
	}
}
