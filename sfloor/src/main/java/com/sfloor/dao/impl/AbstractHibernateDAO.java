package com.sfloor.dao.impl;

import java.io.Serializable;
import java.lang.reflect.ParameterizedType;
import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.orm.hibernate3.HibernateTemplate;
import com.sfloor.dao.GenericDAO;


@SuppressWarnings("unchecked")
public abstract class AbstractHibernateDAO<T> implements GenericDAO<T> {

	
	private Class<T> entityClass;

	@Autowired
	private SessionFactory sessionFactory;
	private HibernateTemplate hibernateTemplate;

	@Autowired
	public void setSessionFactory(SessionFactory sessionFactory) {
		hibernateTemplate = new HibernateTemplate(sessionFactory);
	}

	protected Session currentSession() {
		return sessionFactory.getCurrentSession();
    }

	
	public AbstractHibernateDAO() {
		entityClass=(Class<T>)((ParameterizedType)getClass().getGenericSuperclass()).getActualTypeArguments()[0];
	}

	@Override
	public List<T> loadAll() {
		return hibernateTemplate.loadAll(entityClass);//.createCriteria(entityClass).list();
	}

	@Override
	public void delete(T domain) {
		hibernateTemplate.delete(domain);
	}

	@Override
	public void save(T domain) {
		hibernateTemplate.saveOrUpdate(domain);
	}

	@Override
	public void update(T domain) {
		hibernateTemplate.merge(domain);
	}

	@Override
	public T get(Serializable id) {
		T o = (T) hibernateTemplate.get(entityClass, id);
		return o;
	}
	
	@Override
	public T load(Serializable id) {
		T o = (T) hibernateTemplate.load(entityClass, id);
		return o;
	}

}
