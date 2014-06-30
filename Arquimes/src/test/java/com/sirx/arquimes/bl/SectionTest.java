package com.sirx.arquimes.bl;
/*
import static org.junit.Assert.*;

import java.util.ArrayList;
import java.util.Calendar;
import java.util.List;

import org.junit.Test;

import com.sirx.arquimes.Bl.SectionManager;
import com.sirx.arquimes.Model.Image;
import com.sirx.arquimes.Model.InternationalText;
import com.sirx.arquimes.Model.Content;

public class SectionTest {
	private SectionManager sm;
	private Content s;
	
	@Test
	public void testSectionManager() {
		
		sm = new SectionManager();
		Image img = new Image();
		img.setUrl("/etc/repository/content");

		InternationalText it = new InternationalText();
		it.setCa_CA("Titol hola que tal aix˜ Žs una prova amb text utf8");
		it.setEn_EN("Titol Hello this is a test with utf8 text");
		it.setEs_ES("Titol Hola esta es un test con texto utf8");
		it.setFr_FR("Titol Halo a e i o u que no se frances");

		InternationalText it2 = new InternationalText();
		it2.setCa_CA("Descripcio hola que tal aix˜ Žs una prova amb text utf8");
		it2.setEn_EN("Descripcio Hello this is a test with utf8 text");
		it2.setEs_ES("Descripcio Hola esta es un test con texto utf8");
		it2.setFr_FR("Descripcio Halo a e i o u que no se frances");
		
		s = new Content();
		s.setHeader(it);
		s.setContent(it2);
		s.setDateAdded(Calendar.getInstance());
		ArrayList<Image>imgs = new ArrayList<Image>();
		imgs.add(img);
		Image i2 = new Image();
		i2.setUrl("/etc/repository/content2");
		imgs.add(i2);
		s.setImages(imgs);
	}

	@Test
	public void testInsert() {
		
		sm = new SectionManager();
		Image img = new Image();
		img.setUrl("/etc/repository/content");

		InternationalText it = new InternationalText();
		it.setCa_CA("Titol hola que tal aix˜ Žs una prova amb text utf8");
		it.setEn_EN("Titol Hello this is a test with utf8 text");
		it.setEs_ES("Titol Hola esta es un test con texto utf8");
		it.setFr_FR("Titol Halo a e i o u que no se frances");

		InternationalText it2 = new InternationalText();
		it2.setCa_CA("Descripcio hola que tal aix˜ Žs una prova amb text utf8");
		it2.setEn_EN("Descripcio Hello this is a test with utf8 text");
		it2.setEs_ES("Descripcio Hola esta es un test con texto utf8");
		it2.setFr_FR("Descripcio Halo a e i o u que no se frances");
		
		InternationalText it3 = new InternationalText();
		it3.setCa_CA("asTitol hola que tal aix˜ Žs una prova amb text utf8");
		it3.setEn_EN("Tasitol Hello this is a test with utf8 text");
		it3.setEs_ES("Tiastol Hola esta es un test con texto utf8");
		it3.setFr_FR("Titasol Halo a e i o u que no se frances");

		InternationalText it4 = new InternationalText();
		it4.setCa_CA("asDescripcio hola que tal aix˜ Žs una prova amb text utf8");
		it4.setEn_EN("Dasescripcio Hello this is a test with utf8 text");
		it4.setEs_ES("asDescripcio Hola esta es un test con texto utf8");
		it4.setFr_FR("asDescripcio Halo a e i o u que no se frances");
		
		s = new Content();
		s.setHeader(it);
		s.setContent(it2);
		s.setDateAdded(Calendar.getInstance());
		ArrayList<Image>imgs = new ArrayList<Image>();
		imgs.add(img);
		Image i2 = new Image();
		i2.setUrl("/etc/repository/content2");
		imgs.add(i2);
		s.setImages(imgs);
		
		assert(s!=null);
		long id = sm.insert(s);
		assert(id>0);
		
		
		//Ara Aqui has de llegir l'usuari
		
		Content section2 = sm.load(s.getId());
		assert(section2.equals(s));
		
		it.setCa_CA("Aquest text ha estat modificat");
		section2.setHeader(it);
		sm.insert(section2);
		
		System.out.println("Si tot ha anat be, aquest text hauria de ser 'Aquest text ha estat modificat'");
		System.out.println(section2.getHeader().getCa_CA());
		
		Content section3 = new Content();
		section3.setHeader(it3);
		section3.setContent(it4);
		section3.setVisible(false);
		section3.setDateAdded(Calendar.getInstance());
		long id2 = sm.insert(section3);
		assert(id2>0);
		
		sm.delete(section3.getId());
		sm.delete(section2.getId());
	}

}
*/