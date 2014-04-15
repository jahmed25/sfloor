package com.sfloor.dao.impl;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.sfloor.dao.PageDAO;
import com.sfloor.entities.Page;

@Repository
public class PageDAOImpl extends AbstractHibernateDAO<Page> implements PageDAO{

	@Override
	public List<Page> getAllPage() {
		return loadAll();
	}

}
