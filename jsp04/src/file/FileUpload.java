package file;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;


public class FileUpload {
	
	public String[] fileUpload(
			String path, HttpServletRequest req) {
			//request객체 자료형 httpsevletrequest
		
		int size = 1024*1024*10;
		String file = null, oriFile=null;
		String[] files = new String[2];
		MultipartRequest multi;
		try {
			multi = new MultipartRequest(req, path, size, "utf-8",
					new DefaultFileRenamePolicy());
			file = multi.getFilesystemName("file");
			oriFile = multi.getOriginalFileName("file");
			files[0] = file; files[1] = oriFile;
			
		} catch (IOException e) {
			System.out.println("fileUpload메소드");
			e.printStackTrace();
		}

		
		return files;
	}
	
	

}
