package com.sirx.arquimes.BackOffice;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.List;

import com.opensymphony.xwork2.ActionSupport;
import com.sirx.arquimes.Bl.ContentManager;
import com.sirx.arquimes.Bl.SectionManager;
import com.sirx.arquimes.Model.Content;
import com.sirx.arquimes.Model.Image;
import com.sirx.arquimes.Model.Section;
import com.sirx.arquimes.utils.FileSystem;

public class AddContentForm extends ActionSupport {
	private int sectionType;
	private Section section;
	private ContentManager cm;
	private SectionManager sm;
	private Content content;
	private List<File> uploads = new ArrayList<File>();
	private List<String> uploadFileNames = new ArrayList<String>();
	private List<String> uploadContentTypes = new ArrayList<String>();

	public AddContentForm() {
		cm = new ContentManager();
		sm = new SectionManager();
	}

	public List<File> getUpload() {
		return this.uploads;
	}

	public Content getContent() {
		return content;
	}

	public void setContent(Content content) {
		this.content = content;
	}

	public void setUpload(List<File> uploads) {
		this.uploads = uploads;
	}

	public List<String> getUploadFileName() {
		return this.uploadFileNames;
	}

	public void setUploadFileName(List<String> uploadFileNames) {
		this.uploadFileNames = uploadFileNames;
	}

	public List<String> getUploadContentType() {
		return this.uploadContentTypes;
	}

	public void setUploadContentType(List<String> contentTypes) {
		this.uploadContentTypes = contentTypes;
	}

	public int getSectionType() {
		return sectionType;
	}

	public void setSectionType(int sectionType) {
		this.sectionType = sectionType;
	}

	public Section getSection() {
		return section;
	}

	public void setSection(Section section) {
		this.section = section;
	}

	private List<Image> creaImatges(long idContent) {
		List<Image> images = null;
		if (uploads != null) {
			if (uploads.size() > 0)
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

	public String execute() {
		content.setDateAdded(Calendar.getInstance());
		section = sm.getSectionByType(this.getSectionType());
		long idContent = 0;
		if (content.getId() == 0){
			idContent = cm.insert(content);			
			if (uploads!= null){
				if (uploads.size()>0){
					List<Image> images =new ArrayList<Image>();
					images.addAll(this.creaImatges(idContent));
					content.setImages(images);
					if (cm.insert(content) > 0){
						sm.addContentToSection(content, section);
						return "success";
					}
					return "fail";
				}
			}
			
			if (idContent > 0){
				sm.addContentToSection(content, section);
				return "success";
			}
			return "fail";
		}
		else{
			idContent= cm.insert(content);
			if (idContent > 0)
				return "success";

			return "fail";
		}
	}

}
