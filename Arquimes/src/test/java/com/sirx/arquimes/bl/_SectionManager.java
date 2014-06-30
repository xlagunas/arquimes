package com.sirx.arquimes.bl;

import static org.junit.Assert.*;

import java.util.ArrayList;

import junit.framework.TestCase;

import org.junit.Test;

import com.sirx.arquimes.Bl.SectionManager;
import com.sirx.arquimes.Model.Image;
import com.sirx.arquimes.Model.Section;

public class _SectionManager extends TestCase {
	
	private SectionManager sm;
	private Section s;

	public void setUp() {
		sm = new SectionManager();
		s = new Section();
		s.setSectionType(Section.SECTION_PROJECTES);

	}

	@Test
	public void testInsertOrUpdate() {
		Section sec = sm.getSectionByType(Section.SECTION_PROJECTES);
		if (sec == null) {
			System.out.println("*** Creant Nova Seccio ***");
			sm.insert(s);
			System.out.println("*** Nova Seccio hauria d'estar creada ***");
		} else {
			System.out.println("*** Modificant Seccio ***");
			Image im = new Image();
			im.setOrderPosition(-1);
			im.setUrl("primeraModificada.com");
			im.setId(5);
			ArrayList<Image> imgs = new ArrayList<Image>();
			imgs.add(im);
			sm.addImagesToSection(imgs, sec);
			System.out.println("*** La Seccio hauria d'haver estat modificada***");
		}

	}
}
