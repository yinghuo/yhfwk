package org.chonger.utils;

import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;

/**
 * 
 * @author Daniel
 * @date May 23, 2015 6:43:14 PM
 * @version V1.0
 */
public class YhFileInputStream extends FileInputStream {
	
	private boolean autoDelete;
	private String filePath;
	
	public YhFileInputStream(String name,boolean autodel) throws FileNotFoundException {
		super(name);
		autoDelete=autodel;
		filePath=name;
	}

//	@Override
//	public int read() throws IOException {
//		int readvalue=super.read();
//		if(autoDelete&&readvalue==-1)deleteFile();
//		return readvalue;
//	}
//
//	@Override
//	public int read(byte[] b, int off, int len) throws IOException {
//		
//		int readvalue=super.read(b, off, len);
//		if(autoDelete&&readvalue==-1)deleteFile();
//		return readvalue;
//	}
//
//	@Override
//	public int read(byte[] b) throws IOException {
//		return super.read(b);
//	}
	
	@Override
	public void close() throws IOException {
		super.close();
		System.out.println("关闭文件流！");
		if(autoDelete)deleteFile();
	}

	private void deleteFile()
	{
		FileUtil.delFile(filePath);
	}
}
