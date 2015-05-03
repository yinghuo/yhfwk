package org.chonger.utils;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.text.SimpleDateFormat;
import java.util.Date;

import org.apache.commons.io.FileUtils;
import org.apache.struts2.ServletActionContext;

/**
 * 文件操作类
 * 
 * @author Daniel
 * V1.1	2015-05-02	Daniel 	1：新增删除函数delFile(String path,String name);用来删除图片
 */
public class FileUtil {
	
	private static final String FUNCTIONDATE="#dt";
	
	// 定义项目使用的文件路径
	public static final String LECTUREIMAGEPATH = "/files/lecture";
	
	//使用函数标记，表示为日期分类 20140724
	//modify Daniel 将pathTag重命名为
	
	// Note 可以在此添加自己的文件路径

	/**
	 * 获取服务器路径
	 * 
	 * 依据参数指定的相对路径获取服务器的真实文件路径，路径可能会不存在。如果路径不存在则返回null
	 * 
	 * @param path
	 *            定义的项目根目录的相对路径
	 * @return 真实的服务器路径
	 */
	public static String getServicePath(String path) {
		
		//String localPath=ServletActionContext.getServletContext().getInitParameter("imageLocalServer");
		//return localPath+path;//
		return ServletActionContext.getServletContext().getRealPath("/")+path;
	}
	
	public static String getRemotePath(String path)
	{
		//return ServletActionContext.getServletContext().getInitParameter("imageServer")+functionParamFilter(path);
		return ServletActionContext.getServletContext().getContextPath()+functionParamFilter(path);
	}
	
	/**
	 * 获取服务器路径
	 * 
	 * 依据参数指定的相对路径获取服务器的真实文件路径，如果路径不存在，则依据create参数进行创建
	 * 
	 * @param path
	 * @param create
	 * @return
	 */
	public static String getServicePathMk(String path) {
		path=functionParamFilter(path);//过滤参数
		String serpath = getServicePath(path);
		if(!serpath.startsWith("/"))
			serpath=pathConvert(serpath, '/', '\\');
		createFilePath(serpath);
//		if (serpath == null) {
//			serpath = ServletActionContext.getServletContext().getRealPath("/");
//			File pathFile = createFilePath(serpath+);
//			return pathFile.getAbsolutePath();
//		}
		return serpath;
	}
	
	private static SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMdd");
	//函数类型参数过滤
	private static String functionParamFilter(String path)
	{
		//FUNCTIONDATE
		if(path.indexOf(FUNCTIONDATE)>-1)
		{
			path=path.replaceAll(FUNCTIONDATE, sdf.format(new Date()));
		}
		return path;
	}
	
	
	/**
	 * 路径字符串转换
	 * 
	 * 将path中的字符c1转换为c2
	 * 
	 * @param path
	 * @param c1
	 * @param c2
	 * @return
	 */
	public static String pathConvert(String path, char c1, char c2) {
		return path.replace(c1, c2);
	}
	
	
	public static void fileMoveTo(File srcFile,String folderKey,String filename)
	{
		String realPath = FileUtil.getServicePathMk(folderKey);
		
		fileMoveTo(srcFile,new File(realPath + File.separatorChar + filename));
	}
	
	public static void fileMoveTo(File srcFile, File toFile) {
		//toFile.setWritable(true);
		//System.out.println("SrcFile:"+srcFile);
		//System.out.println("SrcFile:"+srcFile.length());
//		try {
//			FileInputStream istream=new FileInputStream(srcFile);
//			FileOutputStream ostream=new FileOutputStream(toFile);
//			byte[] buffer=new byte[2048];
//			int length=0;
//			while(-1!=(length=istream.read(buffer)))
//			{
//				String str=new String(buffer,0,length);
//				System.out.println(str);
//				ostream.write(buffer);
//			}
//			ostream.close();
//			istream.close();
//		} catch (FileNotFoundException e) {
//			e.printStackTrace();
//		} catch (IOException e) {
//			e.printStackTrace();
//		}
		
		//toFile=new File("/usr/share/tomcat6/temp/test.png");
		
		if (srcFile != null && toFile != null) {
			createFilePath(toFile.getParent());
			//srcFile.renameTo(toFile); //modify Daniel 取消使用renameTo函数，该函数在不同分区会造成移动失败
			try {
				FileUtils.copyFile(srcFile, toFile);
				srcFile.delete();
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
	}

	/**
	 * 创建文件路径
	 * 
	 * @param file
	 */
	public static void createFilePath(File file) {
		if (!file.exists()){
			file.mkdirs();
			file.setWritable(true);
		}
	}

	public static File createFilePath(String path) {
		File file = null;
		if (!StringUtil.IsEmpty(path)) {
			file = new File(path);
			createFilePath(file);
		}
		return file;
	}
	
	/**新增图片删除函数*/
	public static boolean delFile(String path,String name)
	{
		path=functionParamFilter(path);
		path = getServicePath(path);
		path+=(File.separatorChar+name);
		return delFile(path);
	}
	
	public static boolean delFile(String path) {
		File file = null;
		if (!StringUtil.IsEmpty(path)) {
			file = new File(path);
			if (file.exists()) {
				return file.delete();
			} else {
				return true;
			}
		}
		return false;
	}
}
