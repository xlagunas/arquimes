package com.sirx.arquimes.BackOffice;

import java.util.List;
import java.util.StringTokenizer;

import com.sirx.arquimes.Bl.SectionManager;
import com.sirx.arquimes.Model.Image;
import com.sirx.arquimes.Model.Section;
import com.sirx.arquimes.utils.FileSystem;

public class ImageHandler {
	private Image image;
	private SectionManager sm;
	private Section section;
	private long idImage;
	private boolean isSectionImage;
	private int idSection;
	private long idContent;

	public ImageHandler() {
		sm = new SectionManager();
	}

	public void setImage(Image image) {
		this.image = image;
	}

	public long getIdImage() {
		return idImage;
	}

	public void setIdImage(long idImage) {
		this.idImage = idImage;
	}

	public Image getImage() {
		return image;
	}

	
	public boolean isSectionImage() {
		return isSectionImage;
	}

	public void setSectionImage(boolean isSectionImage) {
		this.isSectionImage = isSectionImage;
	}

	public int getIdSection() {
		return idSection;
	}

	public void setIdSection(int idSection) {
		this.idSection = idSection;
	}

	private void eliminaImatge(){
		
		
	}
	
	
	public Section getSection() {
		return section;
	}

	public void setSection(Section section) {
		this.section = section;
	}


	public String load() {
		section = sm.getSectionByType(this.idSection);
		image = sm.getImage(this.getIdImage());
		return "editSuccess";
	}
	
	
	public String toggle(){
		Section s = sm.getSectionByType(this.idSection);
		List<Image> images = null;
		images = s.getImages();
		if (images!=null){
			for (Image imag : images) {
				if (imag.getId() == image.getId()){
					imag.setVisible(!imag.isVisible());
				}
			}
		}
		s.setImages(images);
		sm.insert(s);
		
		return "editSuccess";
	}
	public String toggleContent(){
		Image im = sm.getImage(image.getId());
		im.setVisible(!image.isVisible());
		return "editSuccess";
	}
	
	public String delete(){
		Image im = sm.getImage(idImage);
		return this.getImageType(im.getUrl());
		
	}
	private String getImageType(String path){
		StringTokenizer str = new StringTokenizer(path, "/");
		String token = str.nextToken();
		int idSection = Integer.valueOf(str.nextToken());
		
		Section sec = sm.getSectionByType(idSection);
			List<Image> images = null;
			Image aux = null;
			if(token.equals("Sections"))
				images = sec.getImages();
			else{
				//S'ha de fer
			}
			for(int i=0;i<images.size();i++){
				if(images.get(i).getId() == this.getIdImage()){
					aux = images.get(i);
					images.remove(i);
				}
			}
			sec.setImages(images);
			sm.insert(sec);
			sm.deleteImage(aux.getId());
		if (FileSystem.getInstance().deleteImage(path)){
			return "deleteSuccess";
		}		
		else
			return "deleteError";
		}

}
