package com.sirx.arquimes.BackOffice;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import com.sirx.arquimes.Bl.ContentManager;
import com.sirx.arquimes.Model.Content;
import com.sirx.arquimes.Model.Image;
import com.sirx.arquimes.utils.FileSystem;

public class ContentHandler {
	private long idContent;
	private Content content;
	private int hasContents;
	private long idSection;
	private ContentManager cm;
	private List<File> upload = new ArrayList<File>();
	private List<String> uploadFileName = new ArrayList<String>();
	private List<String> uploadContentType = new ArrayList<String>();

	public ContentHandler() {
		cm = new ContentManager();
	}

	public long getIdContent() {
		return idContent;
	}

	public void setIdContent(long idContent) {
		this.idContent = idContent;
	}

	public int getHasContents() {
		return hasContents;
	}

	public void setHasContents(int hasContents) {
		this.hasContents = hasContents;
	}

	public Content getContent() {
		return content;
	}

	public void setContent(Content content) {
		this.content = content;
	}

	public List<File> getUpload() {
		return upload;
	}

	public void setUpload(List<File> upload) {
		this.upload = upload;
	}

	public List<String> getUploadFileName() {
		return uploadFileName;
	}

	public void setUploadFileName(List<String> uploadFileName) {
		this.uploadFileName = uploadFileName;
	}

	public List<String> getUploadContentType() {
		return uploadContentType;
	}

	public void setUploadContentType(List<String> uploadContentType) {
		this.uploadContentType = uploadContentType;
	}

	public long getIdSection() {
		return idSection;
	}

	public void setIdSection(long idSection) {
		this.idSection = idSection;
	}

	public String get() {
		content = cm.load(this.getIdContent());
		return "getContentSuccess";
	}

	public String update() {
		Content aux = cm.load(content.getId());
		if (aux.getImages()!=null)
			if(aux.getImages().size()>0){
				content.setImages(aux.getImages());
			}
		content.setDateAdded(aux.getDateAdded());
		content.setVisible(aux.isVisible());
		cm.insert(content);
		// TEMPORAL!!!!
		return "success";
	}
	private List<Image> creaImatges(long idContent) {
		List<Image> images = null;
		if (upload != null) {
			if (upload.size() > 0)
				images = new ArrayList<Image>();
			for (int i = 0; i < this.getUpload().size(); i++) {
				try {
					Image im = new Image();
					im.setOrderPosition(-1);
					im.setVisible(true);
					im.setUrl(FileSystem.getInstance().uploadDataToContent(
							this.getUpload().get(i),
							this.getUploadFileName().get(i), idContent));
					images.add(im);
				} catch (IOException e) {
					e.printStackTrace();
				}

			}
		}
		return images;

	}

	public String addImages() {
		
		Content c = cm.load(this.getIdContent());
		List<Image> images = (List<Image>) c.getImages();
		if (images == null) {
			images = new ArrayList<Image>();
		} else {
			if (images.size() <= 0)
				images = new ArrayList<Image>();
		}
		images.addAll(this.creaImatges(this.getIdContent()));
		c.setImages(images);
		if (cm.insert(c) > 0)
			return "success";
		return "success";//Aquesta seria el fail
		}
	
	public String changePriority(){
		Content c = cm.load(content.getId());
			if (c!=null){
				c.setPrioritat(content.getPrioritat());
				cm.insert(c);
			}
		return "success";
	}

}
