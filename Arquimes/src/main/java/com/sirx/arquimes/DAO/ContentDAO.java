package com.sirx.arquimes.DAO;

import org.hibernate.Session;
import org.hibernate.Transaction;
import org.hibernate.criterion.Restrictions;

import com.opensymphony.xwork2.util.logging.Logger;
import com.opensymphony.xwork2.util.logging.LoggerFactory;

import com.sirx.arquimes.Model.Content;
import com.sirx.arquimes.Model.Section;
import com.sirx.arquimes.utils.HibernateSessionFactory;

public class ContentDAO implements IContentDAO {
	Logger logger = LoggerFactory.getLogger(ContentDAO.class);

	public long insert(Content c) {
		Session s = null;
		long id = 0;
		try {
			s = HibernateSessionFactory.getSession();
			s.beginTransaction();
			s.saveOrUpdate(c);
			id = c.getId();
			if (c.getImages() != null) {
				for (int i = 0; i < c.getImages().size(); i++) {
					s.saveOrUpdate(c.getImages().get(i));
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

	public Content load(long idContent) {
		Session s = null;
		Content c = null;
		try {
			s = HibernateSessionFactory.getSession();
			s.beginTransaction();
			c = (Content) s.get(Content.class, idContent);
			s.getTransaction().commit();
		} catch (Exception e) {
			logger.error(e.getMessage());
			s.getTransaction().rollback();
		} finally {
			if (s != null)
				s.close();
		}
		return c;
	}

	public void delete(long idContent) {
		Session s = null;
		try {
			s = HibernateSessionFactory.getSession();
			Content c = (Content) s.load(Content.class,
					idContent);
			this.delete(c);
		} catch (Exception e) {
			logger.error(e.getMessage());
		} finally {
			if (s != null)
				s.close();
		}
	}

	private void delete(Content c) {
		Session s = null;
		Transaction tx = null;
		try {
			s = HibernateSessionFactory.getSession();
			tx = s.beginTransaction();
			s.delete(c);
			tx.commit();
		} catch (Exception e) {
			logger.error(e.getMessage());
			if (tx != null)
				tx.rollback();
		}
	}

	
}
