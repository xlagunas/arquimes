package com.sirx.arquimes.Bl;

import java.util.ArrayList;
import java.util.List;

import com.opensymphony.xwork2.util.logging.Logger;
import com.opensymphony.xwork2.util.logging.LoggerFactory;
import com.sirx.arquimes.DAO.ContentDAO;
import com.sirx.arquimes.DAO.FactoryDAO;
import com.sirx.arquimes.DAO.SectionDAO;
import com.sirx.arquimes.Model.Content;
import com.sirx.arquimes.Model.Image;
import com.sirx.arquimes.Model.Section;

public class ContentManager {
	Logger logger = LoggerFactory.getLogger(Section.class);
	private ContentDAO contentDAO;

	public ContentManager() {
		contentDAO = (ContentDAO) FactoryDAO.getContentDAO();
	}

	public long insert(Content c) {
		return contentDAO.insert(c);
	}

	public Content load(long idContent) {
		return contentDAO.load(idContent);
	};

	public void delete(long idContent) {
		contentDAO.delete(idContent);
	};

	/*public int addContentToSection(Content c, Section section) {

		if (section.getElements() == null) {
			ArrayList<Content> contents = new ArrayList<Content>();
			contents.add(c);
			section.setElements(contents);
		} else
			section.getElements().add(c);

		return this.insert(section) > 0 ? 1 : -1;

	}*/

	/*public int addContentsToSection(List<Content> contents, Section section) {
		List<Content> cts = section.getElements();
		if (cts == null) {
			section.setElements(cts);
		} else {
			for (Content content : contents) {
				section.getElements().add(content);
			}
		}

		return this.insert(section) > 0 ? 1 : -1;
	};*/

	public int addImageToContent(Image image, Content content) {
		if (content.getImages() == null) {
			ArrayList<Image> images = new ArrayList<Image>();
			images.add(image);
			content.setImages(images);
		} else
			content.getImages().add(image);

		return this.insert(content) > 0 ? 1 : -1;
	}

	public int addImagesToSection(List<Image> images, Content content) {
		List<Image> imgs = content.getImages();
		if (imgs == null) {
			content.setImages(images);
		} else {
			for (Image image : images) {
				content.getImages().add(image);
			}
		}

		return this.insert(content) > 0 ? 1 : -1;
	}
	
	public int mvContentToSection(Section orig, Section dst, Content c) {
		// TODO CODE
		/*
		 * Si no hi ha una relacio bidireccional, sha de buscar al vector i
		 * eliminar el contingut, despres s'ha d'afegir a l'altre vector i
		 * actualitzar
		 */
		return 0;
	}
	
	/*public void deleteImage(long idImage){
		contentDAO.deleteImage(idImage);
	}*/
	/*public long updateContentImage(Image image){
		return contentDAO.updateSectionImage(image);
	}
	public Image getImage(long idImage){
		return sectionDAO.getImage(idImage);
	}*/
}
