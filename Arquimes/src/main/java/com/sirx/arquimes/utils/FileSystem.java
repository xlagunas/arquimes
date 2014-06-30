package com.sirx.arquimes.utils;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.RandomAccessFile;
import java.nio.ByteBuffer;
import java.nio.channels.FileChannel;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.List;

import com.opensymphony.xwork2.util.logging.Logger;
import com.opensymphony.xwork2.util.logging.LoggerFactory;

public class FileSystem {
	public final static String PATH_SECTIONS = "Sections";
	public final static String PATH_CONTENTS = "Contents";

	private Logger log = LoggerFactory.getLogger(FileSystem.class);
	private static FileSystem INSTANCE;
	private String storageFolder = PropertyManager.getInstance().getImageRepo();

	private void initializeFolders(String path) {
		log.info("Checking if " + path + " exists...");

		File f = new File(path);
		if (f.exists())
			log.info("Folder already created");
		else {
			log.info("Creating Storage folder....");
			if (f.mkdir())
				log.info("Storage folder successfully created!");
			else
				log.error("Storage folder couldn't be created! - check permission....");
		}
	}

	private FileSystem() {

		initializeFolders(storageFolder);
		initializeFolders(storageFolder + File.separatorChar
				+ FileSystem.PATH_SECTIONS);
		initializeFolders(storageFolder + File.separatorChar
				+ FileSystem.PATH_CONTENTS);

	}

	public int createSectionFolder(long idSection) {
		return this.createFolder(FileSystem.PATH_SECTIONS, idSection);
	}

	public int createContentFolder(long idContent) {
		return this.createFolder(FileSystem.PATH_CONTENTS, idContent);
	}

	private int createFolder(String addonPath, long id) {
		String path = storageFolder + File.separatorChar + addonPath
				+ File.separatorChar + id;
		log.info("Checking if folder" + path + " exists...");

		File f = new File(path);
		if (f.exists()) {
			log.info("Folder already created");
			return 0;
		} else {
			log.info("Creating folder....");
			if (f.mkdir()) {
				log.info("Folder successfully created!");
				return 1;
			} else {
				log.error("Folder couldn't be created! - check permission....");
				return -1;
			}
		}
	}

	public String getStorageFolder() {
		return storageFolder;
	}

	public void setStorageFolder(String storageFolder) {
		this.storageFolder = storageFolder;
	}

	private synchronized static void createInstance() {
		if (INSTANCE == null) {
			INSTANCE = new FileSystem();
		}
	}

	public static FileSystem getInstance() {
		if (INSTANCE == null)
			createInstance();
		return INSTANCE;
	}

	public String uploadDataToSection(File uploadedFile, String filename,
			long idSection) throws IOException {
		// Comprova que exosteox el directori del projecte (per si de cas)
		createSectionFolder(idSection);
		String path = this.storageFolder + File.separatorChar
				+ FileSystem.PATH_SECTIONS + File.separatorChar + idSection;
		return this.uploadData(uploadedFile, filename, path);
	}

	public String uploadDataToContent(File uploadedFile, String filename,
			long idContent) throws IOException {

		// Comprova que existeix el directori del projecte (per si de cas)
		createContentFolder(idContent);

		String path = this.storageFolder + File.separatorChar
				+ FileSystem.PATH_CONTENTS + File.separatorChar + idContent;
		return this.uploadData(uploadedFile, filename, path);
	}

	private String uploadData(File uploadedFile, String filename, String url)
			throws IOException {
		String hashedFilename = FileSystem.getDigestedName(filename);
		File destinacio = new File(url + File.separatorChar + hashedFilename);

		FileInputStream fis = null;
		FileOutputStream fos = null;

		FileChannel or = null;
		FileChannel des = null;

		if (!destinacio.exists())
			destinacio.createNewFile();
		try {
			fis = new FileInputStream(uploadedFile);
			or = fis.getChannel();
			fos = new FileOutputStream(destinacio);
			des = fos.getChannel();
			long llegit = des.transferFrom(or, 0, or.size());
			log.info("S'han llegit " + llegit + " bytes del fitxer.");

		} finally {
			if (or != null)
				or.close();
			fis.close();
			if (des != null)
				des.close();
			fos.close();
		}
		return destinacio.getPath().replaceFirst(storageFolder, "");
	}

	public static String getDigestedName(String filename) {
		String resume = filename + Calendar.getInstance().getTimeInMillis();
		String[] extension = filename.split("\\.");
		StringBuffer hexString = new StringBuffer();

		MessageDigest md;
		try {
			md = MessageDigest.getInstance("MD5");

			byte[] output = md.digest(resume.getBytes());

			for (int i = 0; i < output.length; i++) {
				hexString.append(Integer.toHexString(0xFF & output[i]));
			}
			hexString.append("." + extension[extension.length - 1]);
		} catch (NoSuchAlgorithmException e) {
			e.printStackTrace();
		}
		return hexString.toString();
	}

	public boolean deleteImage(String relPath) {
		log.info("Procedint a eliminar fitxer del repositori");
		String path = this.storageFolder + relPath;
		log.info("Path del fitxer a eliminar: " + path);
		File f = new File(path);
		if (f.delete()) {
			log.info("Fitxer Eliminat: " + path);
			return true;
		} else {
			log.info("Fitxer Eliminat: " + path);
			return false;
		}

	}

}