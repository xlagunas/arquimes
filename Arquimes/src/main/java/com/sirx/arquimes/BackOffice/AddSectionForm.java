package com.sirx.arquimes.BackOffice;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.List;
import java.util.StringTokenizer;

import com.opensymphony.xwork2.ActionSupport;
import com.sirx.arquimes.Bl.SectionManager;
import com.sirx.arquimes.Model.Content;
import com.sirx.arquimes.Model.Image;
import com.sirx.arquimes.Model.Section;
import com.sirx.arquimes.utils.FileSystem;

public class AddSectionForm extends ActionSupport {
	private int sectionType;
	private SectionManager sm;
	private boolean toggleVisibility;
	private boolean elimina;
	private Content content;

	private List<File> uploads = new ArrayList<File>();
	private List<String> uploadFileNames = new ArrayList<String>();
	private List<String> uploadContentTypes = new ArrayList<String>();
	
	private long idImage;
	

	public AddSectionForm() {
		sm = new SectionManager();
	}

	public boolean isToggleVisibility() {
		return toggleVisibility;
	}

	public void setToggleVisibility(boolean toggleVisibility) {
		this.toggleVisibility = toggleVisibility;
	}

	public boolean isElimina() {
		return elimina;
	}

	public void setElimina(boolean elimina) {
		this.elimina = elimina;
	}

	public Content getContent() {
		return content;
	}

	public void setContent(Content content) {
		this.content = content;
	}

	public long getIdImage() {
		return idImage;
	}

	public void setIdImage(long idImage) {
		this.idImage = idImage;
	}

	public List<File> getUpload() {
		return this.uploads;
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
	
	private List<Image> creaImatges(long idSection) {
		List<Image> images = null;
		if (uploads != null) {
			if (uploads.size() > 0)
				images = new ArrayList<Image>();
			for (int i = 0; i < this.getUpload().size(); i++) {
				try {
					Image im = new Image();
					im.setOrderPosition(-1);
					im.setVisible(true);
					im.setUrl(FileSystem.getInstance().uploadDataToSection(
							this.getUpload().get(i),
							this.getUploadFileName().get(i), idSection));
					images.add(im);
				} catch (IOException e) {
					e.printStackTrace();
				}

			}
		}
		return images;

	}
	public String addImage(){
		Section s = sm.getSectionByType(this.getSectionType());
		List<Image> images = (List<Image>) s.getImages();
		if (images == null) {
			images = new ArrayList<Image>();
		} else {
			if (images.size() <= 0)
				images = new ArrayList<Image>();
		}
		images.addAll(this.creaImatges(this.getSectionType()));
		s.setImages(images);
		if (sm.insert(s) > 0){
			this.addActionMessage("Imatge(s) afegides satisfactoriament.");
			return "success";
		}
		this.addActionError("Error al afegir imatge(s)");
		return "fail";
	}
	public String toggleImage(){
		Section s = sm.getSectionByType(this.getSectionType());
		List<Image> images = null;
		images = s.getImages();
		if (images!=null){
			for (Image imag : images) {
				if (imag.getId() == idImage){
					imag.setVisible(!imag.isVisible());
				}
			}
		}
		s.setImages(images);
		sm.insert(s);
		this.addActionMessage("Visibilitat d'imatge canviada satisfactoriament");
		return "success";
	}
	private String getImageType(String path){
		StringTokenizer str = new StringTokenizer(path, "/");
		String token = str.nextToken();
		int idSection = Integer.valueOf(str.nextToken());
		
		Section sec = sm.getSectionByType(sectionType);
			List<Image> images = null;
			Image aux = null;
			if(token.equals("Sections")){
				images = sec.getImages();
				for (Image image : images) {
					if(image.getId() == this.getIdImage()){
						sec.getImages().remove(image);
						break;
					}
				}
			}
			else{
				for (Content c : sec.getElements()) {
					if(c.getId() == content.getId()){
						for (Image image : c.getImages()) {
							if (image.getId() == this.getIdImage()){
								c.getImages().remove(image);
								break;
							}
						}
						break;
					}
				}
			}
			sm.insert(sec);

			/*for(int i=0;i<images.size();i++){
				if(images.get(i).getId() == this.getIdImage()){
					aux = images.get(i);
					images.remove(i);
				}
			}*/
			//sec.setImages(images);
			//sm.insert(sec);
			sm.deleteImage(this.getIdImage());
		if (FileSystem.getInstance().deleteImage(path)){
			addActionMessage("Imatge eliminada satisfactoriament");
			return "success";
		}		
		else
			addActionError("Error al eliminar imatge");
			return "error";
		}
	
	public String deleteImage(){
		Image im = sm.getImage(idImage);
		return this.getImageType(im.getUrl());
	}
	
	public String deleteContentImage(){
		Image im = sm.getImage(idImage);
		return this.getImageType(im.getUrl());
	}
	
	public String addNewContentTo(){
		content.setDateAdded(Calendar.getInstance());
		Section section = sm.getSectionByType(this.getSectionType());
		if(content != null){
			int value = sm.addContentToSection(content, section);
			this.addActionMessage("Contingut afegit a la seccio correctament");
		}
		else {
			this.addActionMessage("Error al afegir contingut a la seccio");
		}
		return "success";
	}
	
	public String toggleContent(){
		Section section = sm.getSectionByType(this.getSectionType());
			for (Content content : section.getElements()) {
				if (content.getId() == this.content.getId()){
					content.setVisible(!content.isVisible());
					break;
				}
			}
			sm.insert(section);
			this.addActionMessage("Visibilitat de contingut canviat satisfactoriament");

		return "success";
	}
	
	public String toggleContentImage(){
		Section section = sm.getSectionByType(this.getSectionType());
			for (Content content : section.getElements()) {
				if (content.getId() == this.content.getId()){
					for (Image im : content.getImages()) {
						if (im.getId() == this.getIdImage()){
							im.setVisible(!im.isVisible());
							break;
						}
					}
				}
			}
			sm.insert(section);
			this.addActionMessage("Visibilitat d'imatge canviada satisfactoriament");
		return "success";
	}
	
	public String imageTransform(){
		if(toggleVisibility)
			return this.toggleImage();
		else if(elimina)
			return this.deleteImage();
		else
			return "";
	}
	
	public String contentImageTransform(){
		if(toggleVisibility)
			return this.toggleContentImage();
		else if(elimina)
			return this.deleteContentImage();
		else
			return "";
	}
	
	public String addImageContent(){
		Section s = sm.getSectionByType(this.getSectionType());
			for (Content c : s.getElements()) {
				if(c.getId() == this.getContent().getId()){
					List<Image> images = (List<Image>) c.getImages();
					if (images == null) {
						images = new ArrayList<Image>();
					} else {
						if (images.size() <= 0)
							images = new ArrayList<Image>();
					}
					images.addAll(this.creaImatgesContent(c.getId()));
					c.setImages(images);
					if (sm.insert(s) > 0){
						this.addActionMessage("Imatge(s) afegides satisfactoriament");
						return "success";
					}
					break;
				}
			}
			this.addActionError("Error al afegir imatges noves");
			return "failure";	
	}
	
	private List<Image> creaImatgesContent(long idContent) {
		List<Image> images = null;
		if (uploads != null) {
			if (uploads.size() > 0)
				images = new ArrayList<Image>();
			for (int i = 0; i < this.getUpload().size(); i++) {
				if (this.getUpload().get(i)!= null){
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
		}
		return images;

	}
	
	public String execute() {
		return "success";
	}

}
