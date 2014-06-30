package com.sirx.arquimes.bl;

import java.util.ArrayList;
import java.util.List;

import junit.framework.TestCase;

import org.junit.Test;

import com.sirx.arquimes.DAO.SectionDAO;
import com.sirx.arquimes.Model.Content;
import com.sirx.arquimes.Model.Image;
import com.sirx.arquimes.Model.Section;

public class _SectionDAO extends TestCase {
	private SectionDAO sectionDAO;
	private Section section;
	private static long idSection;
	private static Section section2;

	public void setUp() {
		sectionDAO = new SectionDAO();
		section = new Section();
		section.setSectionType(Section.SECTION_ENCURS);
		section.setElements(new ArrayList<Content>());
		section.setImages(new ArrayList<Image>());

	}

	@Test
	public void testInsertOrUpdate() throws Exception {
		assertTrue(section != null && sectionDAO != null);
		System.out.println("Insertant seccio");

		Section s = null;
		if((s = sectionDAO.getSectionByType(Section.SECTION_ENCURS))==null){
			s = new Section();
			s.setSectionType(Section.SECTION_ENCURS);
		}
		else {
			Image img = new Image();
			img.setOrderPosition(-1);
			img.setUrl("Http://Google.es");
			img.setVisible(true);
			ArrayList<Image> images = new ArrayList();
			images.add(img);
			s.setImages(images);
			sectionDAO.insert(s);
		}
	}

	@Test
	public void testLoad() throws Exception {
		assertTrue(section != null && sectionDAO != null);
		System.out.println("Carregant Seccio");
		section2 = sectionDAO.load(idSection);
		assertTrue(section2 != null);
		System.out
				.println("En teoria ha llegit la secci— amb id: " + idSection);
	}

	@Test
	public void testUpdate() throws Exception {
		assertTrue(section != null && sectionDAO != null);
		System.out.println("Modificant Seccio");
		Image i = new Image();
		i.setUrl("Http://google.es");
		i.setVisible(true);
		i.setOrderPosition(0);
		// ArrayList<Image> im = new ArrayList<Image>();
		// im.add(i);
		if (section2.getImages() == null) {
			ArrayList<Image> im = new ArrayList<Image>();
			im.add(i);
			section2.setImages(im);
		} else {
			List<Image> image = section.getImages();
			image.add(i);
			section2.setImages(image);
		}

		long retVal = sectionDAO.insert(section2);
		assertTrue(retVal == idSection);
		System.out.println("En teoria ha modificat la seccio");

	}

	@Test
	public void testGetContent() throws Exception {
		assertTrue(section != null && sectionDAO != null);
		List<Content> contents = sectionDAO
				.getContentsBySection(Section.SECTION_ENCURS);
		assertTrue(contents != null);
		System.out
				.println("Ara hauria de mostrar el total de continguts d'una secci—");
		System.out.println("Contents total: " + contents.size());

	}
	/*
	 * @Test public void testDelete() throws Exception{ assertTrue(section!=null
	 * && sectionDAO != null); System.out.println("Eliminant Seccio");
	 * sectionDAO.delete(idSection);
	 * System.out.println("En teoria ha eliminat la Seccio"); }
	 */

}
