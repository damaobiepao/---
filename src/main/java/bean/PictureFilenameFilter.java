package bean;

import java.io.File;
import java.io.FilenameFilter;

public class PictureFilenameFilter implements FilenameFilter{
	String productNameString;
	public PictureFilenameFilter(String productNameString) {
		this.productNameString=productNameString;
	}
	@Override
	public boolean accept(File dir, String name) {
		// TODO 自动生成的方法存根
		return name.startsWith(productNameString);
	}

}
