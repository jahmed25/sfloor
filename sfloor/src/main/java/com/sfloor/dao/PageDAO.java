package com.sfloor.dao;

import java.util.List;

import com.sfloor.entities.Page;

public interface PageDAO extends GenericDAO<Page> {

	List<Page> getAllPage();
}
