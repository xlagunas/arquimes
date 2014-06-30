package com.sirx.arquimes.util;

import static org.junit.Assert.*;

import java.io.File;
import java.io.IOException;

import junit.framework.TestCase;

import org.junit.Before;
import org.junit.Test;

import com.sirx.arquimes.Model.Section;
import com.sirx.arquimes.utils.FileSystem;

public class testFileUpload extends TestCase {
	String filename = null;

	@Before
	public void setUp() throws Exception {
		filename = FileSystem.getInstance().getDigestedName("UnNomDimatge.png");
	}

	@Test
	public void testHash() {
		System.out.println("StorageFolder: "+FileSystem.getInstance().getStorageFolder());
		System.out.println(filename);
	}
	
	@Test
	public void testCreateSectionFolder(){
		System.out.println(FileSystem.getInstance().createSectionFolder(Section.SECTION_ENCURS));
	}
	
	@Test
	public void testCreateContentFolder(){
		System.out.println(FileSystem.getInstance().createContentFolder(45));
	}
	
	@Test
	public void testUploadFile(){
		File f = new File("/Users/xlagunas/Downloads/260x180.gif");
		try {
			FileSystem.getInstance().uploadDataToSection(f,"260x180.gif", 45);
		} catch (IOException e) {
			System.out.println(e.getMessage());
			e.printStackTrace();
			
		}
	}

}
