package com.sirx.arquimes.Bl;

import java.util.ArrayList;
import java.util.List;

import com.opensymphony.xwork2.util.logging.Logger;
import com.opensymphony.xwork2.util.logging.LoggerFactory;
import com.sirx.arquimes.DAO.FactoryDAO;
import com.sirx.arquimes.DAO.SectionDAO;
import com.sirx.arquimes.Model.Content;
import com.sirx.arquimes.Model.Image;
import com.sirx.arquimes.Model.Section;

public class SectionManager {
	Logger logger = LoggerFactory.getLogger(Section.class);
	private SectionDAO sectionDAO;

	public SectionManager() {
		sectionDAO = (SectionDAO) FactoryDAO.getSectionDAO();
	}

	public long insert(Section s) {
		return sectionDAO.insert(s);
	}

	public Section load(long idSection) {
		return sectionDAO.load(idSection);
	};

	public void delete(long idSection) {
		sectionDAO.delete(idSection);
	};

	public Section getSectionByType(int sectionType) {
		return sectionDAO.getSectionByType(sectionType);
	};

	public int addContentToSection(Content c, Section section) {

		if (section.getElements() == null) {
			ArrayList<Content> contents = new ArrayList<Content>();
			contents.add(c);
			section.setElements(contents);
		} else
			section.getElements().add(c);

		return this.insert(section) > 0 ? 1 : -1;

	}

	public int addContentsToSection(List<Content> contents, Section section) {
		List<Content> cts = section.getElements();
		if (cts == null) {
			section.setElements(cts);
		} else {
			for (Content content : contents) {
				section.getElements().add(content);
			}
		}

		return this.insert(section) > 0 ? 1 : -1;
	};

	public int addImageToSection(Image image, Section section) {
		if (section.getImages() == null) {
			ArrayList<Image> images = new ArrayList<Image>();
			images.add(image);
			section.setImages(images);
		} else
			section.getImages().add(image);

		return this.insert(section) > 0 ? 1 : -1;
	}

	public int addImagesToSection(List<Image> images, Section section) {
		List<Image> imgs = section.getImages();
		if (imgs == null) {
			section.setImages(images);
		} else {
			for (Image image : images) {
				section.getImages().add(image);
			}
		}

		return this.insert(section) > 0 ? 1 : -1;
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
	
	public void deleteImage(long idImage){
		sectionDAO.deleteImage(idImage);
	}
	public long updateSectionImage(Image image){
		return sectionDAO.updateSectionImage(image);
	}
	public Image getImage(long idImage){
		return sectionDAO.getImage(idImage);
	}
}
