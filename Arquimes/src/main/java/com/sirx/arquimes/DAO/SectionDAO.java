package com.sirx.arquimes.DAO;

import java.util.List;

import org.hibernate.Criteria;
import org.hibernate.Session;
import org.hibernate.Transaction;
import org.hibernate.criterion.Restrictions;

import com.opensymphony.xwork2.util.logging.Logger;
import com.opensymphony.xwork2.util.logging.LoggerFactory;

import com.sirx.arquimes.Model.Content;
import com.sirx.arquimes.Model.Image;
import com.sirx.arquimes.Model.Section;
import com.sirx.arquimes.utils.HibernateSessionFactory;

public class SectionDAO implements ISectionDAO {
	Logger logger = LoggerFactory.getLogger(SectionDAO.class);

	public long insert(Section section) {
		Session s = null;
		long id = 0;
		try {
			s = HibernateSessionFactory.getSession();
			s.beginTransaction();
			s.saveOrUpdate(section);
			id = section.getId();
			if (section.getImages() != null) {
				for (int i = 0; i < section.getImages().size(); i++) {
					s.saveOrUpdate(section.getImages().get(i));
				}
			}
			if (section.getElements() != null) {
				for (int i = 0; i < section.getElements().size(); i++) {
					s.saveOrUpdate(section.getElements().get(i));
				}
			}
			s.getTransaction().commit();
		} catch (Exception e) {
			logger.error(e.getMessage());
			if (s.getTransaction() != null)
				s.getTransaction().rollback();
		} finally {
			if (s != null)
				s.close();
		}
		return id;
	}

	public Section load(long idSection) {
		Session s = null;
		Section section = null;
		try {
			s = HibernateSessionFactory.getSession();
			s.beginTransaction();
			section = (Section) s.get(Section.class, idSection);
			s.getTransaction().commit();
		} catch (Exception e) {
			logger.error(e.getMessage());
			s.getTransaction().rollback();
		} finally {
			if (s != null)
				s.close();
		}
		return section;
	}

	public Section getSectionByType(int sectionType) {
		Session s = null;
		Section sec = null;
		try {
			s = HibernateSessionFactory.getSession();
			sec = (Section) s.createCriteria(Section.class)
					.add(Restrictions.eq("sectionType", sectionType))
					.uniqueResult();
			
		} catch (Exception e) {
			logger.error(e.getMessage());
		} finally {
			if (s != null)
				s.close();
		}
		return sec;
	}

	public void delete(long idSection) {
		Session s = null;
		try {
			s = HibernateSessionFactory.getSession();
			Section section = (Section) s.load(Section.class, idSection);
			this.delete(section);
		} catch (Exception e) {
			logger.error(e.getMessage());
		} finally {
			if (s != null)
				s.close();
		}
	}

	private void delete(Section section) {
		Session s = null;
		Transaction tx = null;
		try {
			s = HibernateSessionFactory.getSession();
			tx = s.beginTransaction();
			s.delete(section);
			tx.commit();
		} catch (Exception e) {
			logger.error(e.getMessage());
			if (tx != null)
				tx.rollback();
		}
	}

	public List<Content> getContentsBySection(int sectionType) {
		List<Content> contents = null;
		Session s = null;
		try {
			s = HibernateSessionFactory.getSession();

			Criteria criteria = s.createCriteria(Section.class);
			criteria.add(Restrictions.eq("sectionType", sectionType));
			Section sec = (Section) criteria.uniqueResult();
			contents = sec.getElements();
		} catch (Exception e) {
			logger.error(e.getMessage());
		} finally {
			if (s != null)
				s.close();
		}
		return contents;
	}
	public long updateSectionImage(Image i){
		Session s = null;
		long id = 0;
		try {
			s = HibernateSessionFactory.getSession();
			s.beginTransaction();
			s.saveOrUpdate(i);
			s.getTransaction().commit();
		} catch (Exception e) {
			logger.error(e.getMessage());
			id = -1;
			if (s.getTransaction() != null)
				s.getTransaction().rollback();
		} finally {
			if (s != null)
				s.close();
		}
		return id;
	}

	public void deleteImage(long idImage){
		Session s = null;
		try {
			s = HibernateSessionFactory.getSession();
			Image image = (Image) s.load(Image.class, idImage);
			this.delete(image);
		} catch (Exception e) {
			logger.error(e.getMessage());
		} finally {
			if (s != null)
				s.close();
		}
	}
	private void delete(Image image) {
		Session s = null;
		Transaction tx = null;
		try {
			s = HibernateSessionFactory.getSession();
			tx = s.beginTransaction();
			s.delete(image);
			tx.commit();
		} catch (Exception e) {
			logger.error(e.getMessage());
			if (tx != null)
				tx.rollback();
		}
	}
		
		public Image getImage(long idImage){
			Image image = null;
			Session s = null;
			try {
				s = HibernateSessionFactory.getSession();
				s.beginTransaction();
				image = (Image) s.get(Image.class, idImage);
				s.getTransaction().commit();
			} catch (Exception e) {
				logger.error(e.getMessage());
				s.getTransaction().rollback();
			} finally {
				if (s != null)
					s.close();
			}
			return image;

	}

	
	/*
	 * public int deleteContentFromSection(Content c, Section section) { Session
	 * s = null; try { s = HibernateSessionFactory.getSession(); section.
	 * Criteria criteria = s.createCriteria(Section.class);
	 * criteria.add(Restrictions.eq("sectionType",sectionType)); contents =
	 * ((Section)criteria.uniqueResult()).getElements(); } catch (Exception e) {
	 * logger.error(e.getMessage()); } finally { if (s != null) s.close(); }
	 * return contents; }
	 */
}
