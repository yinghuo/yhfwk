package org.chonger.utils;

import java.io.File;

/**
 * 文件上传管理类
 * 提供给Action使用的文件上传操作，封装FileUtil的文件上传功能
 * @author Daniel
 * @date 2014-09-25
 */
public class FileUpLoadUtils {
	
	/**文件大小限制5M*/
	public static final long FILESIZE_5M=5242880;
	
	/**上传单个文件*/
	private File upfile;
	/**上传单个文件的文件名*/
	private String upfileFileName;
	/**上传多个文件*/
	private File[] upfiles;
	/**上传多个文件的文件名*/
	private String[] upfilesFileName;
	
	/**
	 * 对文件进行文件大小检测
	 * @param size 文件的大小
	 * @return
	 * @throws Exception 超出指定大小的异常
	 */
	public boolean checkSize(long size) throws Exception
	{
		if(upfile!=null)
		{
			return upfile.length() > size;
		}
		else
			throw new Exception("文件超出指定的大小！");
	}
	
	/**
	 * 按照指定的路径标记保存上传的文件
	 * @param pathTag 指定的文件上传路径标识
	 * @param rename2uuid 是否使用UUID重命名
	 * @return 文件信息数组，0：获取上传文件的原名，1：获取上传文件的新名字(如果使用了rename2uuid=true)，2：获取生成的访问URL，3：获取文件的本地存储地址
	 * @throws Exception
	 * 
	 * @author Daniel
	 */
	public String[] SaveFile(String pathTag,boolean rename2uuid) throws Exception
	{
		//获取指定的服务器路径
		String realPath = FileUtil.getServicePathMk(pathTag);
		
		String[] returnValue=new String[4];
		returnValue[0]=upfileFileName;
		if(rename2uuid)
			upfileFileName= CommUUID.getUUID();
		returnValue[1]=upfileFileName;
		returnValue[3]=realPath+File.separatorChar+upfileFileName;
		FileUtil.fileMoveTo(upfile,	new File(returnValue[3]));
		returnValue[2]=FileUtil.getRemotePath(pathTag)+"/"+upfileFileName;
		return returnValue;
	}
	
	
	
	
	public File getUpfile() {
		return upfile;
	}
	public void setUpfile(File upfile) {
		this.upfile = upfile;
	}
	public String getUpfileFileName() {
		return upfileFileName;
	}
	public void setUpfileFileName(String upfileFileName) {
		this.upfileFileName = upfileFileName;
	}
	public File[] getUpfiles() {
		return upfiles;
	}
	public void setUpfiles(File[] upfiles) {
		this.upfiles = upfiles;
	}
	public String[] getUpfilesFileName() {
		return upfilesFileName;
	}
	public void setUpfilesFileName(String[] upfilesFileName) {
		this.upfilesFileName = upfilesFileName;
	}
}
